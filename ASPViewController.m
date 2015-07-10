//
// Created by ASPCartman on 17/06/14.
// Copyright (c) 2014 ASPCartman. All rights reserved.
//

#import <TPKeyboardAvoiding/TPKeyboardAvoidingScrollView.h>
#import <KeepLayout/KeepView.h>
#import <KeepLayout/KeepAttribute.h>
#import <KeepLayout/UIViewController+KeepLayout.h>
#import "ASPViewController.h"
#import "ASPLayoutView.h"

@implementation ASPViewController
{
	NSDate *_openedTime;
}

- (void) loadView
{
	UIView *mainView = [UIView new];
	mainView.backgroundColor = [UIColor whiteColor];
	self.view = mainView;
	_mainView = mainView;

	TPKeyboardAvoidingScrollView *scrollView = [TPKeyboardAvoidingScrollView new];
	scrollView.backgroundColor = [UIColor whiteColor];
	[mainView addSubview:scrollView];
	scrollView.keepInsets.equal = 0;
	_scrollView = scrollView;

	ASPLayoutView *layout = [ASPLayoutView new];
	[scrollView addSubview:layout];
	layout.keepInsets.equal = 0;
	layout.keepWidth.equal = [UIScreen mainScreen].bounds.size.width;
	layout.keepHeight.min = [UIScreen mainScreen].bounds.size.height - 60 - 4;
	_layout = layout;
}

- (void) viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];

	_openedTime = [NSDate new];
//	[DrLogger logEvent:[NSString stringWithFormat:@"%@%@", NSStringFromClass([self class]), EVENT_DID_APPEAR]
//			 withParameters:self.controllerLoggingParams];
}

- (void) viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];

//	[DrLogger logEvent:[NSString stringWithFormat:@"%@%@", NSStringFromClass([self class]), EVENT_DID_DISAPPEAR] withParameters:self.controllerLoggingParams];
}

- (NSDictionary *) controllerLoggingParams
{
	NSArray *vcs = self.navigationController.viewControllers;
	return @{
			@"Controller" : NSStringFromClass([self class]),
			@"TimeSpentBeforeEvent" : @([NSDate new].timeIntervalSince1970 - _openedTime.timeIntervalSince1970),
			@"CameFrom" : vcs.count > 1 ? NSStringFromClass([vcs[vcs.count-2] class]) : @"Root or no navigation controller",
//			@"isPremium" : @([[DRTInAppManager sharedManager] isPremium])
	};
}

- (void) logEvent:(NSString *)event params:(NSDictionary *)params
{
	NSMutableDictionary *dictionary = [self.controllerLoggingParams mutableCopy];
	[dictionary addEntriesFromDictionary:params];
//	[DrLogger logEvent:event withParameters:dictionary];
}

- (void) logAndSendEvent:(NSString *)event params:(NSDictionary *)params
{
	NSMutableDictionary *dictionary = [self.controllerLoggingParams mutableCopy];
	[dictionary addEntriesFromDictionary:params];
//	[DrLogger logAndSendEvent:event withParameters:dictionary];
}
@end