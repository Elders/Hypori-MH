//
//  StarWarsAPI+Mock.m
//  Hypori-MHTests
//
//  Created by Milen Halachev on 24.07.21.
//

#import "StarWarsAPI+Mock.h"
#import "MockNetworkClient.h"

@implementation StarWarsAPI (Mock)

+(instancetype)mockSuccess {

    NSURL *baseURL = [[NSBundle bundleWithURL:[[NSBundle bundleForClass:[MockNetworkClient class]] URLForResource:@"APIMocks" withExtension:@"bundle"]] bundleURL];
    
    return [[[self class] alloc] initWithNetworkClient:[MockNetworkClient success] baseURL:baseURL];
}

+(instancetype)mockFailing {
    
    return [[[self class] alloc] initWithNetworkClient:[MockNetworkClient failing]];
}

+(instancetype)mockFailingWithError:(NSError *)error {
    
    return [[[self class] alloc] initWithNetworkClient:[MockNetworkClient failingWithError:error]];
}

@end
