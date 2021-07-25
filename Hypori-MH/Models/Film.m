//
//  Film.m
//  Hypori-MH
//
//  Created by Milen Halachev on 24.07.21.
//

#import "Film.h"
#import "NSObject+Mappable.h"
#import "InCodeMappingProvider+URL.h"
#import "InCodeMappingProvider+ISO8601.h"

@implementation Film

+ (void)configureMappingProvider:(InCodeMappingProvider *)mappingProvider {
    
    [mappingProvider mapURLArrayFromDictionaryKey:@"characters" toPropertyKey:@"characters" forClass:[self class]];
    [mappingProvider mapURLArrayFromDictionaryKey:@"planets" toPropertyKey:@"planets" forClass:[self class]];
    [mappingProvider mapURLArrayFromDictionaryKey:@"starships" toPropertyKey:@"starships" forClass:[self class]];
    [mappingProvider mapURLArrayFromDictionaryKey:@"vehicles" toPropertyKey:@"vehicles" forClass:[self class]];
    [mappingProvider mapURLArrayFromDictionaryKey:@"species" toPropertyKey:@"species" forClass:[self class]];
    [mappingProvider mapURLFromDictionaryKey:@"url" toPropertyKey:@"url" forClass:[self class]];
    [mappingProvider mapISO8601DateFromDictionaryKey:@"created" toPropertyKey:@"created" forClass:[self class]];
    [mappingProvider mapISO8601DateFromDictionaryKey:@"edited" toPropertyKey:@"edited" forClass:[self class]];
}

@end
