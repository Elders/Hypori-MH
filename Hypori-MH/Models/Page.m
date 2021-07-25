//
//  Page.m
//  Hypori-MH
//
//  Created by Milen Halachev on 24.07.21.
//

#import "Page.h"
#import "NSObject+Mappable.h"
#import "InCodeMappingProvider+URL.h"

@implementation Page

- (instancetype)initWithCount:(NSNumber *)count next:(NSURL *)next previous:(NSURL *)previous results:(NSMutableArray *)results
{
    self = [super init];
    if (self) {
        _count = count;
        _next = next;
        _previous = previous;
        _results = results;
    }
    return self;
}

+ (void)configureMappingProvider:(InCodeMappingProvider *)mappingProvider {
    
    [super configureMappingProvider: mappingProvider];
    
    [mappingProvider mapURLFromDictionaryKey:@"next" toPropertyKey:@"next" forClass:[self class]];
    [mappingProvider mapURLFromDictionaryKey:@"previous" toPropertyKey:@"previous" forClass:[self class]];
}

+ (void)configureMappingProvider:(InCodeMappingProvider *)mappingProvider withGenericObjectType:(nonnull Class)generic {
    
    [super configureMappingProvider:mappingProvider withGenericObjectType:generic];
    
    [mappingProvider mapFromDictionaryKey:@"results" toPropertyKey:@"results" withObjectType:generic forClass:[self class]];
    
    [generic configureMappingProvider:mappingProvider];
}

@end
