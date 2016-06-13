#import <Kiwi/Kiwi.h>

@import SMSecureTaskSwitcher;

@interface SMSecureTaskSwitcher (Testing)

@property(nonatomic, strong, nonnull) UIWindow *secureWindow;

- (nonnull instancetype)initWithConfiguration:(nonnull id <SMSecureTaskSwitcherConfiguration>)configuration
                           notificationCenter:(NSNotificationCenter *_Nonnull)notificationCenter
                                       screen:(UIScreen *)screen;

@end

SPEC_BEGIN(SecureTaskSwitcherTests)


describe(@"SecureTaskSwitcherTests", ^{
    __block NSObject <SMSecureTaskSwitcherConfiguration> *configuration = nil;
    __block SMSecureTaskSwitcher *sut = nil;
        let(notificationCenter, ^{
            NSNotificationCenter *notificationCenter = [[NSNotificationCenter alloc] init];
            return notificationCenter;
        });
        let(mainScreenMock, ^{ // Occurs before each enclosed "it"
            UIScreen *screen = [UIScreen mock];
            [[screen should] beMemberOfClass:[UIScreen class]];
            CGRect bounds = CGRectMake(0, 0, 100, 100);
            [[screen should] receive:@selector(bounds) andReturn:theValue(bounds) withCountAtLeast:0];
            return screen;
        });
    
        beforeEach(^{
            configuration = [KWMock mockForProtocol:@protocol(SMSecureTaskSwitcherConfiguration)];
            sut = [[SMSecureTaskSwitcher alloc] initWithConfiguration:configuration
                                                   notificationCenter:notificationCenter
                                                               screen:mainScreenMock];
        });
        
        it(@"init", ^{
            
            [[sut.secureWindow shouldNot] beNil];
            [[sut.secureWindow should] beKindOfClass:[UIWindow class]];
            
            [[theValue(sut.secureWindow.bounds) should] equal:theValue(CGRectMake(0, 0, 100, 100))];
            [[theValue(sut.secureWindow.hidden) should] equal:theValue(YES)];
            [[theValue(sut.secureWindow.windowLevel) should] equal:theValue(UIWindowLevelAlert + 10)];
            
        });
    
        context(@"when application enter background", ^{
            it(@"secure window should be show", ^{
                
                [configuration stub:@selector(secureViewForFrame:) andReturn:[[UIView alloc] init]];
                
                [sut applicationDidEnterBackground];
                [[theValue(sut.secureWindow.hidden) should] beNo];
                [[sut.secureWindow.rootViewController shouldNot] beNil];
                [[sut.secureWindow.rootViewController.view shouldNot] beNil];
                [[theValue([sut.secureWindow.rootViewController.view subviews].count) should] beGreaterThan:theValue(0)];
                
            });
        });
    
        context(@"when application enter foreground", ^{
            
            it(@"secure window should be hiden", ^{
                [notificationCenter postNotificationName:UIApplicationWillEnterForegroundNotification object:nil];
                
                [configuration stub:@selector(secureViewForFrame:) andReturn:[[UIView alloc] init]];
                [[expectFutureValue(theValue(sut.secureWindow.hidden)) should] beYes];
            });
        });
    
    });

SPEC_END