//
//  MappingProvider+URL.h
//  Hypori-MH
//
//  Created by Milen Halachev on 25.07.21.
//

#import <Foundation/Foundation.h>
@import OCMapper;

NS_ASSUME_NONNULL_BEGIN

@interface InCodeMappingProvider (URL)

- (void)mapURLFromDictionaryKey:(NSString*)dictionaryKey toPropertyKey:(NSString*)propertyKey forClass:(Class)cls;
- (void)mapURLArrayFromDictionaryKey:(NSString*)dictionaryKey toPropertyKey:(NSString*)propertyKey forClass:(Class)cls;

@end

NS_ASSUME_NONNULL_END
