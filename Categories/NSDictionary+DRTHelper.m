//
// Created by ASPCartman on 29/03/15.
// Copyright (c) 2015 ASPCartman. All rights reserved.
//

#import "NSDictionary+DRTHelper.h"

@implementation NSDictionary (DRTHelper)
- (NSDictionary *) dictionaryByAddingKeysAndValuesFromDictionary:(NSDictionary*)dict
{
	NSMutableDictionary *d = [self mutableCopy];
	[d addEntriesFromDictionary:dict];
	return d;
}
@end