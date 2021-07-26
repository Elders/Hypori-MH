//
//  AppDelegate.h
//  Hypori-MH
//
//  Created by Milen Halachev on 23.07.21.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property(nonatomic, strong) UIWindow * window;

@end

/*
 Dev Notes:
 I would never ever use Objective-C by default anymore, but these were the requirements.
 The JSON mapping is so inconvenient, compared to Swift's Codable.
 SwiftUI is the best approach.
 */
