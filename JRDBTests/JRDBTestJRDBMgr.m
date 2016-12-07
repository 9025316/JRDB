//
//  JRDBTestJRDBMgr.m
//  JRDB
//
//  Created by JMacMini on 16/6/7.
//  Copyright © 2016年 Jrwong. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JRDB.h"
#import "Person.h"
#import "JRDBChain.h"

@interface JRDBTestJRDBMgr : XCTestCase

@end

@implementation JRDBTestJRDBMgr

- (void)setUp {
    [super setUp];
    [[JRDBMgr shareInstance] setDefaultDatabasePath:@"/Users/mac/Desktop/test.sqlite"];
    [[JRDBMgr shareInstance] registerClazzes:@[
                                               [Person class],
                                               [Card class],
                                               [Money class],
                                               ]];
    NSLog(@"%@", [[JRDBMgr shareInstance] registeredClazz]);
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
//    [[JRDBMgr defaultDB] close];
    [super tearDown];
    
}

- (void)testCreateTable {
    J_CreateTable(Person);
}

- (void)testDeleteDB {
    
    [[JRDBMgr shareInstance] deleteDatabaseWithPath:[JRDBMgr shareInstance].defaultDatabasePath];
}

- (void)testUpdateDB {
    
}

- (void)testClearMidRubbishData {
}

@end
