//
//  FilmViewController.h
//  Hypori-MH
//
//  Created by Milen Halachev on 26.07.21.
//

#import <UIKit/UIKit.h>
#import "Film.h"

NS_ASSUME_NONNULL_BEGIN

@interface FilmViewController : UIViewController

@property(nonatomic, strong) Film *film;

/*
 Dev Notes:
 This can be updated to accept a film URL and fetch it. This would allow to handle links from the API.
 */

@end

NS_ASSUME_NONNULL_END
