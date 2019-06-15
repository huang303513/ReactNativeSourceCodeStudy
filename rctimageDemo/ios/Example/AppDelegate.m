/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "AppDelegate.h"

#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import <React/RCTConvert.h>
#import <React/RCTImageSource.h>
#import <React/RCTImageLoader.h>
#import <React/RCTImageView.h>
#import <React/RCTImageViewManager.h>
#import "RCTImageView+RNS.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  
  NSURLCache *URLCache = [[NSURLCache alloc] initWithMemoryCapacity:50 * 1024 * 1024
                                                       diskCapacity:100 * 1024 * 1024
                                                           diskPath:nil];
  [NSURLCache setSharedURLCache:URLCache];
  
  NSURL *jsCodeLocation;

  jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];

  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"rctimageDemo"
                                               initialProperties:nil
                                                   launchOptions:launchOptions];
  rootView.backgroundColor = [UIColor blackColor];
  
  NSLog(@"========>>>%@",NSHomeDirectory());
  

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIViewController *rootViewController = [UIViewController new];
  rootViewController.view = rootView;
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
  
  
  NSDictionary *dic= @{@"__packager_asset":@(true),@"width":@(30),@"height":@(30),@"uri":@"http://10.105.17.43:8081/assets/source/miaobi@3x.gif?platform=ios&hash=c4c089d6d8d77e1a9bf3f6eb04eb7096",@"scale":@(3)};
  
  dic = @{@"url": @"https://s2.ax1x.com/2019/06/15/VIgGKU.gif"};
  
//  RCTImageViewManager *manager = [[RCTImageViewManager alloc]init];
//  RCTImageSource *resource = [RCTConvert RCTImageSource:dic];
//  RCTImageView *imageView = [manager view];
//  imageView.frame = CGRectMake(0, 50, 50, 50);
//  [rootView addSubview:imageView];
//  [manager.bridge.imageLoader loadImageWithURLRequest:resource.request callback:^(NSError *error, UIImage *image) {
//      dispatch_async(dispatch_get_main_queue(), ^{
//        imageView.image = image;
//        if (image.reactKeyframeAnimation) {
//          [imageView.layer addAnimation:image.reactKeyframeAnimation forKey:@"contents"];
//        } else {
//          [imageView.layer removeAnimationForKey:@"contents"];
//          imageView.image = image;
//        }
//      });
//  }];
  
    RCTImageView *imageView = [[RCTImageView alloc]initWithFrame:CGRectMake(0, 50, 50, 50)];
    [rootView addSubview:imageView];

  RCTImageSource *resource = [RCTConvert RCTImageSource:dic];
  [rootView.bridge.imageLoader loadImageWithURLRequest:resource.request callback:^(NSError *error, UIImage *image) {
    dispatch_async(dispatch_get_main_queue(), ^{
      imageView.image = image;
      if (image.reactKeyframeAnimation) {
        [imageView.layer addAnimation:image.reactKeyframeAnimation forKey:@"contents"];
      } else {
        [imageView.layer removeAnimationForKey:@"contents"];
        imageView.image = image;
      }

    });
  }];
  
  
//3  UIImage *image = [RCTConvert UIImage:dic];

  
  
  return YES;
}

@end
