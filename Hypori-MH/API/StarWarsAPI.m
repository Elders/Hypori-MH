//
//  StarWarsAPI.m
//  Hypori-MH
//
//  Created by Milen Halachev on 23.07.21.
//

#import "StarWarsAPI.h"
#import "NSError+API.h"
#import "NSArray+Map.h"
#import "NSObject+Mappable.h"
@import OCMapper;

@interface StarWarsAPI()

@property(nonatomic, strong) id<NetworkClient> networkClient;
@property(nonatomic, strong) NSURL *baseURL;

@end

@implementation StarWarsAPI

- (instancetype)initWithNetworkClient:(id<NetworkClient>)networkClient {
    
    return [self initWithNetworkClient:networkClient baseURL:[[NSURL alloc] initWithString:@"https://swapi.dev/api"]];
}

- (instancetype)initWithNetworkClient:(id<NetworkClient>)networkClient baseURL:(nonnull NSURL *)baseURL {
    
    self = [super init];
    if (self) {
        _networkClient = networkClient;
        _baseURL = baseURL;
    }
    return self;
}

- (id<Cancellable>)getFilmsWithCompletionHandler:(void (^)(Page<Film *> * _Nullable, NSError * _Nullable))completionHandler {
    
    NSURL *url = [self.baseURL URLByAppendingPathComponent:@"films"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    return [self.networkClient performRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            
            completionHandler(nil, error);
            return;
        }
        
        if (!data) {
            
            completionHandler(nil, [NSError noDataError]);
            return;
        }
        
        NSError *parseError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
        
        if (parseError) {
           
            completionHandler(nil, parseError);
            return;
        }
        
        Page<Film *> *page =  [Page<Film*> objectFromDictionary:dictionary withGenericObjectType:[Film class]];
        
        completionHandler(page, nil);
    }];
}

@end
