//
//  AnyCancellable.m
//  Hypori-MH
//
//  Created by Milen Halachev on 23.07.21.
//

#import "AnyCancellable.h"
#import "Cancellable.h"

@interface AnyCancellable ()

@property(nonatomic, copy, nullable) BOOL (^cancelHandler)(void);

@end

@implementation AnyCancellable

- (instancetype)initWithCancelHandler:(void (^)(void))cancelHandler
{
    self = [super init];
    if (self) {
        _cancelHandler = [cancelHandler copy];
    }
    return self;
}

-(instancetype)initWithOther:(id<Cancellable>)other {
    
    return [self initWithCancelHandler:^{
        
        [other cancel];
    }];
}

- (void)dealloc
{
    [self cancel];
}

-(void)cancel {
    
    if (self.cancelHandler) {
        
        self.cancelHandler();
    }
    
    self.cancelHandler = NULL;
}

@end
