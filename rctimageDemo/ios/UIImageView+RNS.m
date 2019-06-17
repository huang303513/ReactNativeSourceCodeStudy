//
//  RCTImageView+RNS.m
//  socialeshop
//
//  Created by huangchengdu on 2019/6/15.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "UIImageView+RNS.h"
#import "RNSImageLoadManager.h"


@implementation UIImageView (RNS)

- (void)rns_setImage:(id)params placeholderImage:(UIImage *)image{
    if (image) {
        self.image = image;
    }
    
    NSDictionary *json;
    if ([params isKindOfClass:[NSString class]]) {
        json = @{@"uri": params, @"cache":@"force-cache"};
    }else if ([params isKindOfClass:[NSDictionary class]]){
        json = params;
    }
    if (json != nil) {
        [[RNSImageLoadManager shareManager] loadImageWithParams:json callback:^(NSError *error, UIImage *image) {
            if (image) {
                self.image = image;
                if (image.reactKeyframeAnimation) {
                    [self.layer addAnimation:image.reactKeyframeAnimation forKey:@"contents"];
                } else {
                    [self.layer removeAnimationForKey:@"contents"];
                    self.image = image;
                }
            }
        }];
    }
}

@end
