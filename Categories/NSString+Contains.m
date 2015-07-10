//
// Created by ASPCartman on 31/12/13.
// Copyright (c) 2013 ASPCartman. All rights reserved.
//

#import "NSString+Contains.h"

@implementation NSString (Contains)
- (BOOL) contains:(NSString *)string
{
	NSRange rng = [self rangeOfString:string options:0];
	return rng.location != NSNotFound;
}
@end