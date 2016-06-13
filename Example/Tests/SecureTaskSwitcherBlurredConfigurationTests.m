//
//  SecureTaskSwitcherBlurredConfigurationTests.m
//  SMSecureTaskSwitcher
//
//  Created by Mateusz Kuźnik on 13/06/16.
//  Copyright © 2016 Mateusz Kuźnik. All rights reserved.
//
#import <Kiwi/Kiwi.h>

@import SMSecureTaskSwitcher;

SPEC_BEGIN(SecureTaskSwitcherBlurredConfigurationTests)

describe(@"", ^{
    __block SMSecureTaskSwitcherBlurredConfiguration *sut = nil;
    
    beforeEach(^{
        sut = [SMSecureTaskSwitcherBlurredConfiguration new];
    });
    
    context(@"when object is initialised", ^{
        it(@"configuration is set on default values", ^{
            [[theValue(sut.blurWithRadius) should] equal:theValue(5)];
            [[sut.tintColor should] equal:[UIColor clearColor]];
            [[theValue(sut.saturationDeltaFactor) should] equal:theValue(1)];
            [[sut.maskImage should] beNil];
        });
    });
});

SPEC_END
