//
//  NSObject+Mappable.m
//  Hypori-MH
//
//  Created by Milen Halachev on 25.07.21.
//

#import "NSObject+Mappable.h"

@implementation NSObject (Mappable)

+ (id)objectFromDictionary:(NSDictionary *)dictionary {
    
    ObjectMapper *mapper = [[ObjectMapper alloc] init];
    InCodeMappingProvider *mappingProvider = [[InCodeMappingProvider alloc] init];
    mapper.mappingProvider = mappingProvider;
    
    [[self class] configureMappingProvider:mappingProvider];
    
    return [mapper objectFromSource:dictionary toInstanceOfClass:[self class]];
}

+ (id)objectFromDictionary:(NSDictionary *)dictionary withGenericObjectType:(Class)generic {
    
    ObjectMapper *mapper = [[ObjectMapper alloc] init];
    InCodeMappingProvider *mappingProvider = [[InCodeMappingProvider alloc] init];
    mapper.mappingProvider = mappingProvider;
    
    [[self class] configureMappingProvider:mappingProvider withGenericObjectType:generic];
    
    return [mapper objectFromSource:dictionary toInstanceOfClass:[self class]];
}

+(void)configureMappingProvider:(InCodeMappingProvider*)mappingProvider; {
    
    //this does nothing by itself
    //override to customize mapping
}

+ (void)configureMappingProvider:(InCodeMappingProvider *)mappingProvider withGenericObjectType:(Class)generic {
    
    //this does nothing by itself
    //override to customize mapping
    
    [self configureMappingProvider:mappingProvider];
}

@end
