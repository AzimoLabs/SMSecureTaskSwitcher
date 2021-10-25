//
// Created by Mateusz Kuźnik on 25/05/16.
// Copyright (c) 2016 Azimo Ltd. All rights reserved.
//

@import UIKit;
#import "SMSecureTaskSwitcher.h"
#import "SMSecureTaskSwitcherConfiguration.h"
#import "SMSecureTaskSwitcherBlurredConfiguration.h"

@interface SMSecureTaskSwitcher ()

@property(nonatomic, strong, nonnull) UIWindow *secureWindow;
@property(nonatomic, strong, nonnull) NSNotificationCenter *notificationCenter;
@property(nonatomic, strong, nonnull) UIScreen *mainScreen;

@end

@implementation SMSecureTaskSwitcher

- (nonnull instancetype)init {
    return [self initWithConfiguration:[SMSecureTaskSwitcherBlurredConfiguration new]];
}

- (nonnull instancetype)initWithConfiguration:(nonnull id <SMSecureTaskSwitcherConfiguration>)configuration {
    return [self initWithConfiguration:configuration notificationCenter:[NSNotificationCenter defaultCenter] screen:[UIScreen mainScreen]];
}

- (nonnull instancetype)initWithConfiguration:(nonnull id <SMSecureTaskSwitcherConfiguration>)configuration
                           notificationCenter:(NSNotificationCenter *_Nonnull)notificationCenter
                                       screen:(UIScreen *)screen {
    if (self = [super init]) {
        _configuration = configuration;
        _notificationCenter = notificationCenter;
        _mainScreen = screen;
        
        CGRect screenBounds = [self screenBounds];
        [self createAndConfigureSecureWindowWithRect:screenBounds];
        [self createViewController];
        [self setupObservers];
    }
    return self;
}

- (void)dealloc {
    [self.notificationCenter removeObserver:self];
}

- (void)createAndConfigureSecureWindowWithRect:(CGRect)frame {
    self.secureWindow = [[UIWindow alloc] initWithFrame:frame];
    self.secureWindow.windowLevel = UIWindowLevelAlert + 10;
    self.secureWindow.backgroundColor = [UIColor clearColor];
    self.secureWindow.hidden = YES;
}

- (void)createViewController {
    self.secureWindow.rootViewController = [self securedViewController];
}

- (UIViewController *)securedViewController {
    UIViewController *rootViewController = [[UIViewController alloc] init];
    rootViewController.view.backgroundColor = [UIColor clearColor];
    return rootViewController;
}

- (void)setupObservers {
    [self.notificationCenter addObserver:self selector:@selector(applicationWillEnterForeground) name:UIApplicationWillEnterForegroundNotification object:nil];
}

#pragma mark public methods

- (void)applicationDidEnterBackground {
    [self updateSecureView];
    self.secureWindow.hidden = NO;
}

- (void)applicationWillEnterForeground {
    self.secureWindow.hidden = YES;
}

- (void)updateSecureView {
    CGRect screenBounds = [self screenBounds];
    [self removeSubViewsFromView:self.secureWindow.rootViewController.view];
    [self.secureWindow.rootViewController.view addSubview:[self.configuration secureViewForFrame:screenBounds]];
}

#pragma mark helpers

- (void)removeSubViewsFromView:(UIView *)view {
    [view.subviews enumerateObjectsUsingBlock:^(UIView *subview, NSUInteger idx, BOOL *stop) {
        [subview removeFromSuperview];
    }];
}

- (CGRect)screenBounds {
    return self.mainScreen.bounds;
}

@end
