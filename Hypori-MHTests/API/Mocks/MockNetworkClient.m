//
//  MockNetworkClient.m
//  Hypori-MHTests
//
//  Created by Milen Halachev on 24.07.21.
//

#import "MockNetworkClient.h"
#import "AnyCancellable.h"

@implementation MockNetworkClient

- (instancetype)initWithError:(NSError *)error
{
    self = [super init];
    if (self) {
        _error = error;
    }
    return self;
}

+ (instancetype)success {
    
    return [[[self class] alloc] initWithError:nil];
}

+(instancetype)failing {
    
    NSError *error = [[NSError alloc] initWithDomain:@"MockNetworkClient" code:0 userInfo:nil];
    return [[[self class] alloc] initWithError:error];
}

+(instancetype)failingWithError:(NSError *)error {
    
    return [[[self class] alloc] initWithError:error];
}

- (id<Cancellable>)performRequest:(NSURLRequest *)request completionHandler:(void (^)(NSData * _Nullable, NSURLResponse * _Nullable, NSError * _Nullable))completionHandler {
    
    if (self.error) {
        
        completionHandler(nil, nil, self.error);
    }
    else {
        
        NSData *data = [NSData dataWithContentsOfURL:request.URL];
        NSURLResponse *response = [[NSHTTPURLResponse alloc] initWithURL:request.URL statusCode:200 HTTPVersion:nil headerFields:nil];
        completionHandler(data, response, nil);
    }
    
    return [[AnyCancellable alloc] init];
}

@end
