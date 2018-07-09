//
//  ulibgsmmapTests.m
//  ulibgsmmapTests
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//

#import <ulib/ulib.h>
#import <XCTest/XCTest.h>
#import "UMGSMMAP_SupportedCamelPhases.h"

@interface ulibgsmmapTests : XCTestCase

@end

@implementation ulibgsmmapTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}


- (void)testCamelPhases
{
    UMGSMMAP_SupportedCamelPhases *scp = [[UMGSMMAP_SupportedCamelPhases alloc]initWithString:@"1,2"];
    NSData *d = [scp berEncoded];

    NSString *hex = [d hexString];

    BOOL b = [hex isEqualToString:@"030206C0"];
    XCTAssert(b, @"CamelPhase encoding error");

}
@end
