//
//  StarWarsDomainServiceInMemoryState.h
//  Hypori-MH
//
//  Created by Milen Halachev on 25.07.21.
//

#import <Foundation/Foundation.h>
#import "StarWarsDomainServiceState.h"

NS_ASSUME_NONNULL_BEGIN

@interface StarWarsDomainServiceInMemoryState: NSObject <StarWarsDomainServiceState>

@property(strong) NSArray *films;

@end

NS_ASSUME_NONNULL_END
