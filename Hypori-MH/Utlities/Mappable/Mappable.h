//
//  Mappable.h
//  Hypori-MH
//
//  Created by Milen Halachev on 25.07.21.
//

#import <Foundation/Foundation.h>
@import OCMapper;

NS_ASSUME_NONNULL_BEGIN

@protocol Mappable <NSObject>

+ (id)objectFromDictionary:(NSDictionary *)dictionary;
+ (id)objectFromDictionary:(NSDictionary *)dictionary withGenericObjectType:(Class)generic;

+(void)configureMappingProvider:(InCodeMappingProvider*)mappingProvider;
+(void)configureMappingProvider:(InCodeMappingProvider*)mappingProvider withGenericObjectType:(Class)generic;

@end

NS_ASSUME_NONNULL_END
