//
//  InCodeMappingProvider+ISO8601.m
//  Hypori-MH
//
//  Created by Milen Halachev on 25.07.21.
//

#import "InCodeMappingProvider+ISO8601.h"

@implementation InCodeMappingProvider (ISO8601)

- (void)mapISO8601DateFromDictionaryKey:(NSString*)dictionaryKey toPropertyKey:(NSString*)propertyKey forClass:(Class)cls {
    
    [self mapFromDictionaryKey:dictionaryKey toPropertyKey:propertyKey forClass:cls withTransformer:^id(id currentNode, id parentNode) {
        
        NSISO8601DateFormatter *formatter = [[NSISO8601DateFormatter alloc] init];
        formatter.formatOptions = formatter.formatOptions | NSISO8601DateFormatWithFractionalSeconds;
        return [formatter dateFromString:currentNode];
    }];
}

@end
