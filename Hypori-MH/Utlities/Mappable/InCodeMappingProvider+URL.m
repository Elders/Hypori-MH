//
//  MappingProvider+URL.m
//  Hypori-MH
//
//  Created by Milen Halachev on 25.07.21.
//

#import "InCodeMappingProvider+URL.h"
#import "NSArray+Map.h"

@implementation InCodeMappingProvider (URL)

- (void)mapURLFromDictionaryKey:(NSString*)dictionaryKey toPropertyKey:(NSString*)propertyKey forClass:(Class)cls {
 
    [self mapFromDictionaryKey:dictionaryKey toPropertyKey:propertyKey forClass:cls withTransformer:^id(id currentNode, id parentNode) {
        
        if ([currentNode isEqual:[NSNull null]]) {
            
            return currentNode;
        }
        
        return [NSURL URLWithString:currentNode];
    }];
}

- (void)mapURLArrayFromDictionaryKey:(NSString*)dictionaryKey toPropertyKey:(NSString*)propertyKey forClass:(Class)cls {
    
    [self mapFromDictionaryKey:dictionaryKey toPropertyKey:propertyKey forClass:cls withTransformer:^id(id currentNode, id parentNode) {
        
        if ([currentNode isEqual:[NSNull null]]) {
            
            return currentNode;
        }

        return [[currentNode mapObjectsUsingBlock:^id _Nonnull(id  _Nonnull obj, NSUInteger idx) {
            return [NSURL URLWithString:obj];
        }] mutableCopy];
    }];
}

@end
