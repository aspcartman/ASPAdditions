//
// Created by ASPCartman on 28/02/15.
// Copyright (c) 2015 ASPCartman. All rights reserved.
//

#import <objc/runtime.h>
#import "NSDictionary+ASPInverse.h"

#pragma clang diagnostic push
#pragma ide diagnostic ignored "OCLegacyObjCLiteralInspection"
@implementation NSDictionary (ASPInverse)
- (NSDictionary *) inverse
{
	id inverse = objc_getAssociatedObject(self, @selector(inverse));
	if (inverse == nil)
	{
		inverse = [NSDictionary dictionaryWithObjects:self.allKeys forKeys:self.allValues];
		[self setInverse:inverse];
		[inverse setInverse:self];
	}
	return inverse;
}

- (void) setInverse:(NSDictionary *)dict
{
	objc_setAssociatedObject(self, @selector(inverse), dict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
#pragma clang diagnostic pop