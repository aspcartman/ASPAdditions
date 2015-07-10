//
// Created by ASPCartman on 12/01/14.
// Copyright (c) 2014 ASPCartman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIColor (RGB)
+ (UIColor *) colorWith255Gray:(NSUInteger)gray;
+ (UIColor *) colorWithRGB255Red:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue;
- (UIColor *) lighterColor;
@end