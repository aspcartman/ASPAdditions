//
// Created by ASPCartman on 01/12/14.
// Copyright (c) 2014 ASPCartman. All rights reserved.
//

#import "UILabel+ASPTextSize.h"

@implementation UILabel (ASPTextSize)
- (CGFloat) ASP_textSize
{
	return self.font.pointSize;
}

- (void) setASP_textSize:(CGFloat)ASP_textSize
{
	self.font = [self.font fontWithSize:ASP_textSize];
}
@end