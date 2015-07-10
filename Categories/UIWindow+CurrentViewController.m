//
// Created by ASPCartman on 11/03/14.
// Copyright (c) 2014 ASPCartman. All rights reserved.
//

#import <SWRevealViewController/SWRevealViewController.h>
#import "UIWindow+CurrentViewController.h"

@implementation UIWindow (CurrentViewController)
- (UIViewController *) visibleViewController
{
	UIViewController *rootViewController = self.rootViewController;
	return [UIWindow getVisibleViewControllerFrom:rootViewController];
}

+ (UIViewController *) getVisibleViewControllerFrom:(UIViewController *)vc
{
	if ([vc isKindOfClass:[UINavigationController class]])
	{
		return [self getVisibleViewControllerFrom:[((UINavigationController *) vc) visibleViewController]];
	}
	else if ([vc isKindOfClass:[UITabBarController class]])
	{
		return [self getVisibleViewControllerFrom:[((UITabBarController *) vc) selectedViewController]];
	}
		else if ([vc isKindOfClass:[SWRevealViewController class]])
	{
		return [self getVisibleViewControllerFrom:[((SWRevealViewController *)vc) frontViewController]];
	}
	else
	{
		if (vc.presentedViewController)
		{
			return [UIWindow getVisibleViewControllerFrom:vc.presentedViewController];
		}
		else
		{
			return vc;
		}
	}
}
@end