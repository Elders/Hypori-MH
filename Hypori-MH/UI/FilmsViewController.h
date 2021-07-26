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

/*
 Dev Notes:
 This can be updated to accept collection of film URLs and fetch them. This would allow to handle links from the API.
 */

@end

NS_ASSUME_NONNULL_END
