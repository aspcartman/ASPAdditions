//
// Created by ASPCartman on 01/12/14.
// Copyright (c) 2014 ASPCartman. All rights reserved.
//

#import "UILabel+DRTTextSize.h"

@implementation UILabel (DRTTextSize)
- (CGFloat) DRT_textSize
{
	return self.font.pointSize;
}

- (void) setDRT_textSize:(CGFloat)DRT_textSize
{
	self.font = [self.font fontWithSize:DRT_textSize];
}
@end