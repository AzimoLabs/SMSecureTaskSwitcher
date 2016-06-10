//
// Created by Mateusz Kuźnik on 26/05/16.
// Copyright (c) 2016 Azimo Ltd. All rights reserved.
//

@import Foundation;

@protocol SMSecureTaskSwitcherConfiguration <NSObject>

- (UIView *_Nonnull)secureViewForFrame:(CGRect)frame;

@end