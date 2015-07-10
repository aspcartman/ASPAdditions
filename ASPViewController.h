//
// Created by ASPCartman on 17/06/14.
// Copyright (c) 2014 ASPCartman. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ASPLayoutView;

@interface ASPViewController : UIViewController
{
@protected
	UIView *_mainView;
	UIScrollView *_scrollView;
	ASPLayoutView *_layout;
}

- (NSDictionary *) controllerLoggingParams;
- (void) logEvent:(NSString *)event params:(NSDictionary *)params;
- (void) logAndSendEvent:(NSString *)string params:(NSDictionary *)params;
@end