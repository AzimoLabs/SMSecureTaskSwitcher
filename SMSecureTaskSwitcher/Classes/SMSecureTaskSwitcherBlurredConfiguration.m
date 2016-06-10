//
// Created by Mateusz Kuźnik on 26/05/16.
// Copyright (c) 2016 Azimo Ltd. All rights reserved.
//

#import "SMSecureTaskSwitcherBlurredConfiguration.h"
#import "UIImage+ImageEffects.h"

@implementation SMSecureTaskSwitcherBlurredConfiguration

- (instancetype)init {
    if (self = [super init]) {
        _blurWithRadius = 5;
        _tintColor = [UIColor clearColor];
        _saturationDeltaFactor = 1;
    }
    return self;
}

- (UIView *)secureViewForFrame:(CGRect)frame {
    return [self blurredView];
}

- (UIView *)blurredView {
    UIImage *snapshot = [self snapshot:[UIApplication sharedApplication].keyWindow];
    UIImage *blurredImage = [snapshot applyBlurWithRadius:self.blurWithRadius
                                                tintColor:self.tintColor
                                    saturationDeltaFactor:self.saturationDeltaFactor
                                                maskImage:self.maskImage];
    return [[UIImageView alloc] initWithImage:blurredImage];
}

- (UIImage *)snapshot:(UIView *)view {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, 0);
    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

@end