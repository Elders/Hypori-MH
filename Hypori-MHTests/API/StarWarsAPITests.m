//
//  StarWarsAPITests.m
//  Hypori-MHTests
//
//  Created by Milen Halachev on 24.07.21.
//

#import <XCTest/XCTest.h>
#import "StarWarsAPI+Mock.h"

@interface StarWarsAPITests: XCTestCase

@end

@implementation StarWarsAPITests

- (void)testGetFilms {
    
    XCTestExpectation *e = [self expectationWithDescription:NSStringFromSelector(_cmd)];
    
    [[StarWarsAPI mockSuccess] getFilmsWithCompletionHandler:^(Page<Film *> * _Nullable page, NSError * _Nullable error) {
        
        XCTAssertNotNil(page);
        XCTAssertNil(error);
        
        XCTAssertEqualObjects(page.count, @6);
        XCTAssertEqualObjects(page.next, [NSURL URLWithString:@"https://swapi.dev/api/films/?page=2"]);
        XCTAssertNil(page.previous);
        XCTAssertEqual(page.results.count, 1);
        
        XCTAssertEqualObjects(page.results.firstObject.title, @"A New Hope");
        XCTAssertEqualObjects(page.results.firstObject.episodeID, @4);
        XCTAssertEqualObjects(page.results.firstObject.openingCrawl, @"It is a period of civil war.\r\nRebel spaceships, striking\r\nfrom a hidden base, have won\r\ntheir first victory against\r\nthe evil Galactic Empire.\r\n\r\nDuring the battle, Rebel\r\nspies managed to steal secret\r\nplans to the Empire's\r\nultimate weapon, the DEATH\r\nSTAR, an armored space\r\nstation with enough power\r\nto destroy an entire planet.\r\n\r\nPursued by the Empire's\r\nsinister agents, Princess\r\nLeia races home aboard her\r\nstarship, custodian of the\r\nstolen plans that can save her\r\npeople and restore\r\nfreedom to the galaxy....");
        XCTAssertEqualObjects(page.results.firstObject.director, @"George Lucas");
        XCTAssertEqualObjects(page.results.firstObject.producer, @"Gary Kurtz, Rick McCallum");

        XCTAssertEqualObjects(page.results.firstObject.characters, @[[NSURL URLWithString:@"https://swapi.dev/api/people/1/"]]);
        XCTAssertEqualObjects(page.results.firstObject.planets, @[[NSURL URLWithString:@"https://swapi.dev/api/planets/1/"]]);
        XCTAssertEqualObjects(page.results.firstObject.starships, @[[NSURL URLWithString:@"https://swapi.dev/api/starships/2/"]]);
        XCTAssertEqualObjects(page.results.firstObject.vehicles, @[[NSURL URLWithString:@"https://swapi.dev/api/vehicles/4/"]]);
        XCTAssertEqualObjects(page.results.firstObject.species, @[[NSURL URLWithString:@"https://swapi.dev/api/species/1/"]]);
        XCTAssertEqualObjects(page.results.firstObject.url, [NSURL URLWithString:@"https://swapi.dev/api/films/1/"]);
        
        
        NSDateFormatter *releaseDateFormatter = [[NSDateFormatter alloc] init];
        [releaseDateFormatter setDateFormat:@"yyyy-MM-dd"];
        
        XCTAssertEqualObjects([releaseDateFormatter stringFromDate:page.results.firstObject.releaseDate], @"1977-05-25");
        
        NSISO8601DateFormatter *isoDateFormatter = [[NSISO8601DateFormatter alloc] init];
  
        XCTAssertEqualObjects([isoDateFormatter stringFromDate:page.results.firstObject.created], @"2014-12-10T14:23:31Z");
        XCTAssertEqualObjects([isoDateFormatter stringFromDate:page.results.firstObject.edited], @"2014-12-20T19:49:45Z");
        
        [e fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:2 handler:nil];
}

@end
