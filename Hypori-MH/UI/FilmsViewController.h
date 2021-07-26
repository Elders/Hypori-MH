//
//  FilmsViewController.h
//  Hypori-MH
//
//  Created by Milen Halachev on 23.07.21.
//

#import <UIKit/UIKit.h>
#import "StarWarsDomainService.h"

NS_ASSUME_NONNULL_BEGIN

@interface FilmsViewController : UITableViewController

@property(nonatomic, strong) StarWarsDomainService *service;

@end

NS_ASSUME_NONNULL_END
