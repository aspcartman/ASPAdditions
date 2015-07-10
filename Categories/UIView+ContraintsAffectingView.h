//
// Created by ASPCartman on 16/04/14.
// Copyright (c) 2014 ASPCartman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ContraintsAffectingView)
- (NSArray *) constraintsAffectingView:(UIView *)view;
- (NSArray *) constraintsAffectingViews:(NSArray *)views;
@end