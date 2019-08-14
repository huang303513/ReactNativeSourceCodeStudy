//
//  RNSImageLoadManager.m
//  socialeshop
//
//  Created by huangchengdu on 2019/6/15.
//  Copyright © 2019 Facebook. All rights reserved.
//

#import "RNSImageLoadManager.h"
#import <React/RCTBridge.h>
#import <React/RCTImageSource.h>
#import <React/RCTImageView.h>

static RNSImageLoadManager * manager = nil;

@interface RNSImageLoadManager ()
@property (nonatomic, strong) RCTBridge *bridge;
@property (nonatomic, strong) RCTImageLoader *imageLoader;
@property (nonatomic, strong) dispatch_queue_t imageLoadQueue;
@end


@implementation RNSImageLoadManager

+ (void)load{
    //配置缓存大小
    NSURLCache *URLCache = [[NSURLCache alloc] initWithMemoryCapacity:50 * 1024 * 1024
                                                         diskCapacity:100 * 1024 * 1024
                                                             diskPath:nil];
    [NSURLCache setSharedURLCache:URLCache];
}

+ (instancetype)shareManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        self.imageLoadQueue = dispatch_queue_create("com.xihu.xyz", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}

- (void)setBridge:(RCTBridge *)bridge{
    _bridge = bridge;
    self.imageLoader = bridge.imageLoader;
}

- (void)loadImageWithParams:(NSDictionary *)params callback:(RCTImageLoaderCompletionBlock)callback{
    dispatch_async(self.imageLoadQueue, ^{
        RCTImageSource *resource = [RCTConvert RCTImageSource:params];
        [self.imageLoader loadImageWithURLRequest:resource.request callback:^(NSError *error, UIImage *image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(error, image);
            });
        }];
    });
}

- (void)loadImageWithParams:(NSDictionary *)params resourceCallback:(RNSImageLoaderCompletionBlock)resourceCallback{
    dispatch_async(self.imageLoadQueue, ^{
        RCTImageSource *resource = [RCTConvert RCTImageSource:params];
        [self.imageLoader loadImageWithURLRequest:resource.request callback:^(NSError *error, UIImage *image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                resourceCallback(error, image, resource);
            });
        }];
    });
}


@end
