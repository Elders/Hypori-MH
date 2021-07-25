//
//  InCodeMappingProvider+ISO8601.h
//  Hypori-MH
//
//  Created by Milen Halachev on 25.07.21.
//

#import <OCMapper/OCMapper.h>

NS_ASSUME_NONNULL_BEGIN

@interface InCodeMappingProvider (ISO8601)

- (void)mapISO8601DateFromDictionaryKey:(NSString*)dictionaryKey toPropertyKey:(NSString*)propertyKey forClass:(Class)cls;

@end

NS_ASSUME_NONNULL_END
