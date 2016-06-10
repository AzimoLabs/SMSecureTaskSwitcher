//
// Created by Mateusz Kuźnik on 25/05/16.
// Copyright (c) 2016 Azimo Ltd. All rights reserved.
//

@import Foundation;

@protocol SMSecureTaskSwitcherConfiguration;


@interface SMSecureTaskSwitcher : NSObject

@property(nonatomic, strong, nonnull) id<SMSecureTaskSwitcherConfiguration> configuration;

- (void)applicationDidEnterBackground;

@end