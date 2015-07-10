//
// Created by ASPCartman on 07/04/14.
// Copyright (c) 2014 ASPCartman. All rights reserved.
//

#import <KeepLayout.h>
#import <BlocksKit/UIView+BlocksKit.h>
#import "ASPButton.h"
#import "UIColor+RGB.h"

@implementation ASPButton
- (id) init
{
	self = [super init];
	if (self)
	{
		self.translatesAutoresizingMaskIntoConstraints = NO;
		self.layer.cornerRadius                        = 18;
		self.layer.masksToBounds                       = YES;

		UILabel *label = [UILabel new];
		label.backgroundColor = [UIColor clearColor];
		[self addSubview:label];
		[label keepCentered];
		label.keepVerticalInsets.equal   = 5;
		label.keepHorizontalInsets.equal = 20;
		_label = label;

		[self bk_whenTapped:^{
			if (_action)
			{
				_action();
			}
			UIColor *originalColor = self.backgroundColor;
			self.backgroundColor = [originalColor colorWithAlphaComponent:0.2];
			[UIView animateWithDuration:0.165
								  delay:0
								options:UIViewAnimationOptionCurveEaseOut
							 animations:^() {
								 self.backgroundColor = originalColor;
							 }
							 completion:nil];
		}];

		self.enabled = YES;
	}

	return self;
}

- (CGSize) intrinsicContentSize
{
	CGSize sise = super.intrinsicContentSize;
	return CGSizeMake(sise.width, 36);
}

- (void) setEnabled:(BOOL)enabled
{
	self.backgroundColor        = enabled ? [UIColor colorWithRGB255Red:255 green:222 blue:146] : [UIColor grayColor];
	self.label.textColor        = enabled ? [UIColor colorWithRGB255Red:158 green:41 blue:0] : [UIColor darkGrayColor];
	self.userInteractionEnabled = enabled;
	_enabled = enabled;
}
@end