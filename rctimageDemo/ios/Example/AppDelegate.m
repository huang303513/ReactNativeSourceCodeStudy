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
#import "RNSImageLoadManager.h"
#import "UIImageView+RNS.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  
  NSURL *jsCodeLocation;

  jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];

  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"rctimageDemo"
                                               initialProperties:nil
                                                   launchOptions:launchOptions];
  [[RNSImageLoadManager shareManager] setBridge:rootView.bridge];
  rootView.backgroundColor = [UIColor blackColor];
  
  NSLog(@"========>>>%@",NSHomeDirectory());
  

  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIViewController *rootViewController = [UIViewController new];
  rootViewController.view = rootView;
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
  
  
  NSDictionary *dic= @{@"__packager_asset":@(true),@"width":@(30),@"height":@(30),@"uri":@"http://10.105.17.43:8081/assets/source/miaobi@3x.gif?platform=ios&hash=c4c089d6d8d77e1a9bf3f6eb04eb7096",@"scale":@(3)};
  
  NSString *url = @"https://s2.ax1x.com/2019/06/15/VIgGKU.gif";

  
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 120, 50, 50)];
    [rootView addSubview:imageView];
  [imageView rns_setImage:dic placeholderImage:nil];
  
  UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 50, 50, 50)];
  [rootView addSubview:imageView1];
  [imageView1 rns_setImage:url placeholderImage:nil];
  
//  [[RNSImageLoadManager shareManager] loadImageWithParams:dic resourceCallback:^(NSError * _Nonnull error, UIImage * _Nonnull image, RCTImageSource * _Nonnull resouce) {
//
//  }];
  
  
//3  UIImage *image = [RCTConvert UIImage:dic];

  
  
  return YES;
}

@end
