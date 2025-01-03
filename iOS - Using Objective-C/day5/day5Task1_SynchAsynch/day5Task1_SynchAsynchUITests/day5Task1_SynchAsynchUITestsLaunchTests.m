//
//  day5Task1_SynchAsynchUITestsLaunchTests.m
//  day5Task1_SynchAsynchUITests
//
//  Created by Uef on 23/12/2024.
//

#import <XCTest/XCTest.h>

@interface day5Task1_SynchAsynchUITestsLaunchTests : XCTestCase

@end

@implementation day5Task1_SynchAsynchUITestsLaunchTests

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
