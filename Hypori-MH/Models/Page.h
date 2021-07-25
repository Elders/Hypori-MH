//
//  Page.h
//  Hypori-MH
//
//  Created by Milen Halachev on 24.07.21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Page<T>: NSObject

@property(nonatomic, strong) NSNumber *count;
@property(nonatomic, strong, nullable) NSURL *next;
@property(nonatomic, strong, nullable) NSURL *previous;
@property(nonatomic, strong) NSMutableArray<T> *results;

-(instancetype)initWithCount:(NSNumber *)count next:(nullable NSURL *)next previous:(nullable NSURL *)previous results:(NSMutableArray<T> *)results;

@end

NS_ASSUME_NONNULL_END
