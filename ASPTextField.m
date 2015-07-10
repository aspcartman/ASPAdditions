//
// Created by ASPCartman on 07/04/14.
// Copyright (c) 2014 ASPCartman. All rights reserved.
//

#import "KeepLayout.h"
#import "ASPTextField.h"

@implementation ASPTextField
{
}
- (id) init
{
	self = [super init];
	if (self)
	{
		UITextField *field = [UITextField new];
		field.text = nil;
		field.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
		[self addSubview:field];
		field.keepInsets.equal = 0;
		field.keepHeight.equal = 30;
		field.keepWidth.min        = 100;
		field.keepBottomInset.equal = 5;
		_field = field;

		UIView *separator = [UIView new];
		separator.backgroundColor = [UIColor grayColor];
		[self addSubview:separator];
		separator.keepHorizontalInsets.equal = 0;
		separator.keepBottomInset.equal      = 0;
		separator.keepHeight.equal           = 1;
		_separator = separator;

	}
	return self;
}


@end