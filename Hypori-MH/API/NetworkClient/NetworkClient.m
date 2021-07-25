//
//  NetworkClient.m
//  Hypori-MH
//
//  Created by Milen Halachev on 23.07.21.
//

#import "NetworkClient.h"
#import "NSURLSessionTask+Cancellable.h"

@interface NetworkClient()

@property(nonatomic, strong) NSURLSession* session;

@end

@implementation NetworkClient

- (instancetype)init
{
    return [self initWithSession:NSURLSession.sharedSession];
}

- (instancetype)initWithSession:(NSURLSession *)session
{
    self = [super init];
    if (self) {
        
        _session = session;
    }
    return self;
}

- (void)dealloc
{
    [_session invalidateAndCancel];
}

- (id<Cancellable>)performRequest:(NSURLRequest *)request completionHandler:(void (^)(NSData * _Nullable, NSURLResponse * _Nullable, NSError * _Nullable))completionHandler {
    
    return [[self.session dataTaskWithRequest:request completionHandler:completionHandler] resumeAutoCancellable];
}

@end
