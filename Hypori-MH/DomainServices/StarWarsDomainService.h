//
//  StarWarsDomainService.h
//  Hypori-MH
//
//  Created by Milen Halachev on 25.07.21.
//

#import <Foundation/Foundation.h>
#import "StarWarsDomainServiceState.h"
#import "StarWarsAPI.h"
#import "Cancellable.h"

NS_ASSUME_NONNULL_BEGIN

@interface StarWarsDomainService: NSObject

@property(strong, readonly) id<StarWarsDomainServiceState> state;

-(instancetype)initWithState:(id<StarWarsDomainServiceState>)state api:(StarWarsAPI*)api;

-(id<Cancellable>)loadFilmsWithCompletionHandler:(void(^)(NSArray<Film*> * _Nullable films, NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END
