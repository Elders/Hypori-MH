//
//  Film.h
//  Hypori-MH
//
//  Created by Milen Halachev on 24.07.21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Film : NSObject

@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSNumber *episodeID;
@property(nonatomic, strong) NSString *openingCrawl;
@property(nonatomic, strong) NSString *director;
@property(nonatomic, strong) NSString *producer;
@property(nonatomic, strong) NSDate *releaseDate;
@property(nonatomic, strong) NSMutableArray<NSURL*> *characters;
@property(nonatomic, strong) NSMutableArray<NSURL*> *planets;
@property(nonatomic, strong) NSMutableArray<NSURL*> *starships;
@property(nonatomic, strong) NSMutableArray<NSURL*> *vehicles;
@property(nonatomic, strong) NSMutableArray<NSURL*> *species;
@property(nonatomic, strong) NSDate *created;
@property(nonatomic, strong) NSDate *edited;
@property(nonatomic, strong) NSURL *url;

@end

NS_ASSUME_NONNULL_END
