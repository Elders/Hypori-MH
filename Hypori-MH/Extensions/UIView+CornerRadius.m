//
//  UIView+CornerRadius.m
//  Hypori-MH
//
//  Created by Milen Halachev on 26.07.21.
//

#import "UIView+CornerRadius.h"

@implementation UIView (CornerRadius)

-(CGFloat)cornerRadius {
    
    return self.layer.cornerRadius;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    
    self.layer.cornerRadius = cornerRadius;
}

@end
