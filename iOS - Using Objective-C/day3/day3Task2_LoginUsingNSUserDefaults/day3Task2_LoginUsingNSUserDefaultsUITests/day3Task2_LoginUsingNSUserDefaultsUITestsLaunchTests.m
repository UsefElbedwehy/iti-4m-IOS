//
//  day3Task2_LoginUsingNSUserDefaultsUITestsLaunchTests.m
//  day3Task2_LoginUsingNSUserDefaultsUITests
//
//  Created by Uef on 19/12/2024.
//

#import <XCTest/XCTest.h>

@interface day3Task2_LoginUsingNSUserDefaultsUITestsLaunchTests : XCTestCase

@end

@implementation day3Task2_LoginUsingNSUserDefaultsUITestsLaunchTests

+ (BOOL)runsForEachTargetApplicationUIConfiguration {
    return YES;
}

- (void)setUp {
    self.continueAfterFailure = NO;
}

- (void)testLaunch {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    // Insert steps here to perform after app launch but before taking a screenshot,
    // such as logging into a test account or navigating somewhere in the app

    XCTAttachment *attachment = [XCTAttachment attachmentWithScreenshot:XCUIScreen.mainScreen.screenshot];
    attachment.name = @"Launch Screen";
    attachment.lifetime = XCTAttachmentLifetimeKeepAlways;
    [self addAttachment:attachment];
}

@end
