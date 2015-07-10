//
// Created by ASPCartman on 07/04/14.
// Copyright (c) 2014 ASPCartman. All rights reserved.
//

#import "ASPInterfaceProvider.h"
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
		field.font      = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
		field.textColor = [ASPInterfaceProvider textColor];
		field.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
		[self addSubview:field];
		field.keepHorizontalInsets.equal = 0;
		field.keepHeight.equal = 30;
		field.keepWidth.min        = 100;
		field.keepBottomInset.equal = 5;

		_field = field;

		UIView *separator = [UIView new];
		separator.backgroundColor = [ASPInterfaceProvider separatorColor];
		[self addSubview:separator];
		separator.keepHorizontalInsets.equal = 0;
		separator.keepBottomInset.equal      = 0;
		separator.keepHeight.equal           = 1;

	}
	return self;
}

- (CGSize) intrinsicContentSize
{
	return CGSizeMake([ASPInterfaceProvider screenSize].width, 44);
}

@end