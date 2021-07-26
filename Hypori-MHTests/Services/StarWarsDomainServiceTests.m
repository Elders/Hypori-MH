//
//  StarWarsDomainServiceTests.m
//  Hypori-MHTests
//
//  Created by Milen Halachev on 25.07.21.
//

#import <XCTest/XCTest.h>
#import "StarWarsDomainService.h"
#import "StarWarsDomainServiceInMemoryState.h"
#import "StarWarsAPI+Mock.h"

@interface StarWarsDomainServiceTests : XCTestCase

@end

@implementation StarWarsDomainServiceTests

- (void)testLoadFilmsSuccess {
    
    XCTestExpectation *e = [self expectationWithDescription:NSStringFromSelector(_cmd)];
    
    StarWarsDomainServiceInMemoryState *state = [[StarWarsDomainServiceInMemoryState alloc] init];
    StarWarsAPI *api = [StarWarsAPI mockSuccess];
    StarWarsDomainService *service = [[StarWarsDomainService alloc] initWithState:state api:api];
    
    [service loadFilmsWithCompletionHandler:^(NSArray<Film *> * _Nullable films, NSError * _Nullable error) {
        
        XCTAssertNotNil(films);
        XCTAssertNil(error);
        
        [e fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:2 handler:nil];
    
    XCTAssertEqual(service.state.films.count, 1);
}

- (void)testLoadFilmsFailure {
    
    XCTestExpectation *e = [self expectationWithDescription:NSStringFromSelector(_cmd)];
    
    StarWarsDomainServiceInMemoryState *state = [[StarWarsDomainServiceInMemoryState alloc] init];
    state.films = @[[[Film alloc] init], [[Film alloc] init]];
    
    StarWarsAPI *api = [StarWarsAPI mockFailing];
    StarWarsDomainService *service = [[StarWarsDomainService alloc] initWithState:state api:api];
    
    [service loadFilmsWithCompletionHandler:^(NSArray<Film *> * _Nullable films, NSError * _Nullable error) {
        
        XCTAssertNil(films);
        XCTAssertNotNil(error);
        
        [e fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:2 handler:nil];
    
    XCTAssertEqual(service.state.films.count, 2);
}

@end

