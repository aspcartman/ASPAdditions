//
// Created by ASPCartman on 28/02/15.
// Copyright (c) 2015 ASPCartman. All rights reserved.
//

#import "NSSet+DRTWTFSet.h"

@implementation NSSet (DRTWTFSet)
- (NSSet*)setByRemovingObject:(id)object
{
	NSMutableSet *set = [self mutableCopy];
	[set removeObject:object];
	return set;
}
@end