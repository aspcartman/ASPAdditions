//
// Created by ASPCartman on 07/04/14.
// Copyright (c) 2014 ASPCartman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASPButton : UIView
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) void    (^action)();
@property (nonatomic, assign) BOOL    enabled;
@end