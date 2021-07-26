//
//  StarWarsAPI.h
//  Hypori-MH
//
//  Created by Milen Halachev on 23.07.21.
//

#import <Foundation/Foundation.h>
#import "NetworkClient.h"
#import "Page.h"
#import "Film.h"

NS_ASSUME_NONNULL_BEGIN

@interface StarWarsAPI : NSObject

-(instancetype)initWithNetworkClient:(id<NetworkClient>)networkClient;
-(instancetype)initWithNetworkClient:(id<NetworkClient>)networkClient baseURL:(NSURL*)baseURL;

-(id<Cancellable>)getFilmsWithCompletionHandler:(void(^)(Page<Film*> * _Nullable page, NSError * _Nullable error))completionHandler;

/*
 Dev Notes:
 This can be updated with other endpoints as well.
 */

@end

NS_ASSUME_NONNULL_END
