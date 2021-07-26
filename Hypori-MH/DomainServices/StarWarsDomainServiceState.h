//
//  StarWarsDomainServiceState.h
//  Hypori-MH
//
//  Created by Milen Halachev on 25.07.21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol StarWarsDomainServiceState <NSObject>

@property(strong) NSArray *films;

@end

NS_ASSUME_NONNULL_END

/*
 Dev Notes:
 StarWarsDomainServicePersistentState can be implemented in order to store and cache the data by dev's choice. I would use storing the data into JSON files.
 */
