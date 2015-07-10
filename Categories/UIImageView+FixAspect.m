//
// Created by ASPCartman on 22/11/14.
// Copyright (c) 2014 ASPCartman. All rights reserved.
//

#import "UIImageView+FixAspect.h"
#import "KeepLayout.h"

@implementation UIImageView (FixAspect)
- (void) keepSizeToImage
{
	[self keepSize:self.image.size];
}

- (void) keepAspectToImage
{
	self.keepAspectRatio.equal = self.image.size.width / self.image.size.height;
}
@end