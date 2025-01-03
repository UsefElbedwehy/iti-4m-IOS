//
//  day3Task1_CombinedTabbedAndNavigaionBrUITestsLaunchTests.m
//  day3Task1_CombinedTabbedAndNavigaionBrUITests
//
//  Created by Uef on 19/12/2024.
//

#import <XCTest/XCTest.h>

@interface day3Task1_CombinedTabbedAndNavigaionBrUITestsLaunchTests : XCTestCase

@end

@implementation day3Task1_CombinedTabbedAndNavigaionBrUITestsLaunchTests

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
