//
// Created by ASPCartman on 16/04/14.
// Copyright (c) 2014 ASPCartman. All rights reserved.
//

#import <BlocksKit/NSArray+BlocksKit.h>
#import "UIView+ContraintsAffectingView.h"

@implementation UIView (ContraintsAffectingView)
- (NSArray *) constraintsAffectingView:(UIView *)view
{
	return [self.constraints bk_select:^BOOL(NSLayoutConstraint *constraint) {
		return constraint.firstItem == view || constraint.secondItem == view;
	}];
}

- (NSArray *) constraintsAffectingViews:(NSArray *)views
{
	return [self.constraints bk_select:^BOOL(NSLayoutConstraint *constraint) {
		return [views containsObject:constraint.firstItem] || [views containsObject:constraint.secondItem];
	}];
}
@end