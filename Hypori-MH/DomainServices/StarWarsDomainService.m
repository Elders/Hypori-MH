//
//  StarWarsDomainService.m
//  Hypori-MH
//
//  Created by Milen Halachev on 25.07.21.
//

#import "StarWarsDomainService.h"
#import "StarWarsDomainServiceInMemoryState.h"

@interface StarWarsDomainService ()

@property(nonatomic, strong) StarWarsAPI *api;
@property(strong, readwrite) id<StarWarsDomainServiceState> state;

@end

@implementation StarWarsDomainService

- (instancetype)init
{
    id<StarWarsDomainServiceState> state = [[StarWarsDomainServiceInMemoryState alloc] init];
    StarWarsAPI *api = [[StarWarsAPI alloc] init];
    
    return [self initWithState:state api:api];
}

- (instancetype)initWithState:(id<StarWarsDomainServiceState>)state api:(StarWarsAPI *)api {
    self = [super init];
    if (self) {
        _state = state;
        _api = api;
    }
    return self;
}

- (id<Cancellable>)loadFilmsWithCompletionHandler:(void (^)(NSArray<Film *> * _Nullable, NSError * _Nullable))completionHandler {
    
    return [self.api getFilmsWithCompletionHandler:^(Page<Film *> * _Nullable page, NSError * _Nullable error) {
        
        if (!error && page.results) {
        
            self.state.films = page.results;
        }
        
        completionHandler(page.results, error);
    }];
}

@end
