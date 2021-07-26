//
//  Cancellable.h
//  Hypori-MH
//
//  Created by Milen Halachev on 23.07.21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*
 Dev Notes:
 This is based on Combine.framework
 */


@protocol Cancellable <NSObject>

-(void)cancel;

@end

NS_ASSUME_NONNULL_END
