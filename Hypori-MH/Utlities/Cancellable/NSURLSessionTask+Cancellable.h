//
//  NSURLSessionTask+Cancellable.h
//  Hypori-MH
//
//  Created by Milen Halachev on 23.07.21.
//

#import <Foundation/Foundation.h>
#import "Cancellable.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSURLSessionTask(Cancellable) <Cancellable>

///Resumes the receiver and returns a Cancellable instance that cancels intself automatically when deallocated
-(id<Cancellable>)resumeAutoCancellable;

@end

NS_ASSUME_NONNULL_END
