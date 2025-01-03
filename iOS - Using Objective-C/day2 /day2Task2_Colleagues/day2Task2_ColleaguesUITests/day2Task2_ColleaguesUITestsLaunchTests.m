//
//  day2Task2_ColleaguesUITestsLaunchTests.m
//  day2Task2_ColleaguesUITests
//
//  Created by Uef on 18/12/2024.
//

#import <XCTest/XCTest.h>

@interface day2Task2_ColleaguesUITestsLaunchTests : XCTestCase

@end

@implementation day2Task2_ColleaguesUITestsLaunchTests

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
