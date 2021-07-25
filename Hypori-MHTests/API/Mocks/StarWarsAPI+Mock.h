//
//  StarWarsAPI+Mock.h
//  Hypori-MHTests
//
//  Created by Milen Halachev on 24.07.21.
//

#import "StarWarsAPI.h"

NS_ASSUME_NONNULL_BEGIN

@interface StarWarsAPI (Mock)

+(instancetype)mockSuccess;
+(instancetype)mockFailing;
+(instancetype)mockFailingWithError:(NSError*)error;

@end

NS_ASSUME_NONNULL_END
