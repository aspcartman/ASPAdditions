//
// Created by ASPCartman on 16/04/14.
// Copyright (c) 2014 ASPCartman. All rights reserved.
//

#import <KeepLayout.h>
#import "ASPLayoutView.h"
#import "UIView+ContraintsAffectingView.h"
#import "NSMutableArray+BlocksKit.h"

@implementation ASPLayoutView
{
	NSMutableArray *_savedConstraintsForHiddenViews;
	NSMutableArray *_retainedHiddenViews;
	NSMutableArray *_springs;
}

- (id) init
{
	self = [super init];
	if (self)
	{
		_centerSubviews = YES;
		_savedConstraintsForHiddenViews = [NSMutableArray new];
		_retainedHiddenViews            = [NSMutableArray new];
		_springs = [NSMutableArray new];
	}

	return self;
}

- (void) addVertically:(UIView *)view offset:(float)offset
{
	[self addVertically:view offset:offset centered:_centerSubviews];
}

- (void) addVertically:(UIView *)view offset:(float)offset centered:(BOOL)centered
{
	NSArray *currentViews   = self.subviews;
	[self addSubview:view];
	for (UIView *subview in currentViews)
	{
		view.keepTopOffsetTo(subview).min = offset;
	}
	view.keepTopInset.equal = currentViews.count ? KeepFitting(0) : offset;
	if (centered)
	{
		[view keepHorizontallyCentered];
	}
}

- (void) addHorizontally:(UIView *)view offset:(float)offset
{
	[self addHorizontally:view offset:offset centered:_centerSubviews];
}

- (void) addHorizontally:(UIView *)view offset:(float)offset centered:(BOOL)centered
{
	NSArray *currentViews    = self.subviews;
	[self addSubview:view];
	for (UIView *subview in currentViews)
	{
		view.keepLeftOffsetTo(subview).min = offset;
	}
	view.keepLeftInset.equal = currentViews.count ? KeepFitting(0) : offset;
	if (centered)
	{
		[view keepVerticallyCentered];
	}
}

- (void) addCentralizedHorizontally:(UIView*)view
{
	[self addSubview:view];

	if (_springs.count == 0)
	{
		UIView *spring1 = [UIView new];
		spring1.backgroundColor = [UIColor clearColor];
		[self addSubview:spring1];
		spring1.keepLeftInset.equal = 0;

		view.keepLeftOffsetTo(spring1).equal = 0;

		UIView *spring2 = [UIView new];
		spring2.backgroundColor = [UIColor clearColor];
		[self addSubview:spring2];
		spring2.keepRightInset.equal = 0;

		view.keepRightOffsetTo(spring2).equal = 0;

		[_springs addObjectsFromArray:@[spring1, spring2]];
	}
	else if (_springs.count >= 2)
	{
		view.keepLeftOffsetTo(_springs.lastObject).equal = 0;

		[_springs.lastObject keepRightInset].equal = KeepNone;

		UIView *spring = [UIView new];
		spring.backgroundColor = [UIColor clearColor];
		[self addSubview:spring];
		spring.keepRightInset.equal = 0;

		view.keepRightOffsetTo(spring).equal = 0;

		[_springs addObject:spring];
	}
	else
	{
		NSAssert(0, @"It's impossible.");
	}

	[view keepVerticallyCentered];
	[_springs keepSizesEqual];

}

- (NSArray *) subviewsWithTag:(NSInteger)tag
{
	NSMutableArray *a = [NSMutableArray new];
	for (UIView *view in self.subviews)
	{
		if (view.tag == tag)
			[a addObject:view];
	}
	return a;
}

- (void) addSubview:(UIView *)view
{
	[super addSubview:view];
	view.keepInsets.min      = 0;
	view.keepSize.equal      = KeepFitting(1);
}

- (void) showIfTrue:(BOOL)show view:(UIView *)view
{
	if (show)
	{
		[self showView:view];
	}
	else
	{
		[self hideView:view];
	}
}

- (void) hideView:(UIView *)view
{
	if ([_retainedHiddenViews containsObject:view] || !view)
	{
		return; // Already hidden
	}

	[_retainedHiddenViews addObject:view];
	NSArray *constraints = [self constraintsAffectingView:view];
	[_savedConstraintsForHiddenViews addObjectsFromArray:constraints];
	[self removeConstraints:constraints];

	view.alpha                  = 0;
	view.userInteractionEnabled = NO;
}

- (void) showView:(UIView *)view
{
	if (![_retainedHiddenViews containsObject:view] || !view)
	{
		return; // Already shown
	}

	view.alpha                  = 1;
	view.userInteractionEnabled = YES;

	[_retainedHiddenViews removeObject:view];

	[_savedConstraintsForHiddenViews bk_performSelect:^BOOL(NSLayoutConstraint *constraint) {
		UIView *first  = constraint.firstItem;
		UIView *second = constraint.secondItem;
		if (([first isEqual:view] || [second isEqual:view]) && !([_retainedHiddenViews containsObject:first] || [_retainedHiddenViews containsObject:second]))
		{
			[self addConstraint:constraint];
			return NO;
		}
		return YES;
	}];
}
@end