//
//  AnyCancellable.h
//  Hypori-MH
//
//  Created by Milen Halachev on 23.07.21.
//

#import <Foundation/Foundation.h>
#import "Cancellable.h"

NS_ASSUME_NONNULL_BEGIN

/**
 A type-erasing cancellable object that executes a provided closure when canceled.
 
 An `AnyCancellable` instance automatically calls cancel() when deinitialized.
 */

@interface AnyCancellable: NSObject<Cancellable>

-(instancetype)initWithCancelHandler:(void(^)(void))cancelHandler;
-(instancetype)initWithOther:(id<Cancellable>)other;

@end

NS_ASSUME_NONNULL_END
