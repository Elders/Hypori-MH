//
//  MockNetworkClient.h
//  Hypori-MHTests
//
//  Created by Milen Halachev on 24.07.21.
//

#import <Foundation/Foundation.h>
#import <Hypori-MH/NetworkClient.h>

NS_ASSUME_NONNULL_BEGIN

@interface MockNetworkClient: NSObject<NetworkClient>

@property(nonatomic, strong) NSError *error;

+(instancetype)success;
+(instancetype)failing;
+(instancetype)failingWithError:(NSError*)error;

-(instancetype)initWithError:(nullable NSError *)error;

@end

NS_ASSUME_NONNULL_END
