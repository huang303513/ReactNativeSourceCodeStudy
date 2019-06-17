//
//  RNSImageLoadManager.h
//  socialeshop
//
//  Created by huangchengdu on 2019/6/15.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTImageLoader.h>

NS_ASSUME_NONNULL_BEGIN

@class RCTBridge;
@class RCTImageSource;

typedef void (^RNSImageLoaderCompletionBlock)(NSError *error, UIImage *image, RCTImageSource *resouce);

@interface RNSImageLoadManager : NSObject

+ (instancetype)shareManager;

/*
 
 */
- (void)setBridge:(RCTBridge *)bridge;

- (void)loadImageWithParams:(NSDictionary *)params callback:(RCTImageLoaderCompletionBlock)callback;

/*
 * 只有RN资源图片才能获取到正确的size
 */
- (void)loadImageWithParams:(NSDictionary *)params resourceCallback:(RNSImageLoaderCompletionBlock)resourceCallback;

@end

NS_ASSUME_NONNULL_END
