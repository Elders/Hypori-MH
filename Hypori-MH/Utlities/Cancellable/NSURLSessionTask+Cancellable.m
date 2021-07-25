//
//  NSURLSessionTask+Cancellable.m
//  Hypori-MH
//
//  Created by Milen Halachev on 23.07.21.
//

#import "NSURLSessionTask+Cancellable.h"
#import "AnyCancellable.h"

@implementation NSURLSessionTask (Cancellable)

- (id<Cancellable>)resumeAutoCancellable {
    
    [self resume];
    return [[AnyCancellable alloc] initWithOther:self];
}
@end
