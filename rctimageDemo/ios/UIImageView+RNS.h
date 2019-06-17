//
//  RCTImageView+RNS.h
//  socialeshop
//
//  Created by huangchengdu on 2019/6/15.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (RNS)
- (void)rns_setImage:(id)params placeholderImage:(UIImage *)image;
@end

NS_ASSUME_NONNULL_END
