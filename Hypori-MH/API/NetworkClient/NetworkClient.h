//
//  NetworkClient.h
//  Hypori-MH
//
//  Created by Milen Halachev on 23.07.21.
//

#import <Foundation/Foundation.h>
#import "Cancellable.h"

NS_ASSUME_NONNULL_BEGIN

@protocol NetworkClient<NSObject>

@required
-(id<Cancellable>)performRequest:(NSURLRequest*)request completionHandler:(void(^)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))completionHandler;

@end

@interface NetworkClient: NSObject<NetworkClient>

-(instancetype)init;
-(instancetype)initWithSession:(NSURLSession*)session;

@end

NS_ASSUME_NONNULL_END
