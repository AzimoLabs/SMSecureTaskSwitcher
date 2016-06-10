//
// Created by Mateusz Kuźnik on 26/05/16.
// Copyright (c) 2016 Azimo Ltd. All rights reserved.
//

@import UIKit;
#import "SMSecureTaskSwitcherConfiguration.h"

@interface SMSecureTaskSwitcherBlurredConfiguration : NSObject <SMSecureTaskSwitcherConfiguration>

/**
 * @discussion By default <b>5</b>.
 */
@property(nonatomic, assign) CGFloat blurWithRadius;

/**
 * @discussion By default <b>[UIColor clearColor]</b>.
 */
@property(nonatomic, strong) UIColor *tintColor;

/**
 * @discussion By default <b>1</b>.
 */
@property(nonatomic, assign) CGFloat saturationDeltaFactor;

/**
 * @discussion By default <b>nil</b>.
 */
@property(nonatomic, assign) UIImage *maskImage;

@end