//
// Created by ASPCartman on 12/01/14.
// Copyright (c) 2014 ASPCartman. All rights reserved.
//

#import "UIColor+RGB.h"

@implementation UIColor (RGB)
+ (UIColor *) colorWith255Gray:(NSUInteger)gray
{
	return [self colorWithRGB255Red:gray green:gray blue:gray];
}

+ (UIColor *) colorWithRGB255Red:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue
{
	return [self colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
}

- (UIColor *) lighterColor
{
	CGFloat h, s, b, a;
	if (![self getHue:&h saturation:&s brightness:&b alpha:&a])
	{
		return nil;
	}
	return [UIColor colorWithHue:h
					  saturation:s
					  brightness:MIN(b * 1.5, 1.0)
						   alpha:a];
}
@end