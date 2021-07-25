//
//  NSError+API.m
//  Hypori-MH
//
//  Created by Milen Halachev on 24.07.21.
//

#import "NSError+API.h"

@implementation NSError (API)

+(NSError*)noDataError {
    
    return [NSError errorWithDomain:@"StarWarsAPI" code:0 userInfo:@{NSLocalizedDescriptionKey: NSLocalizedString(@"No data returned from the server", @"The error description when server returns no data.")}];
}


@end
