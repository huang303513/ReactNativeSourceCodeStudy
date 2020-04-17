//
//  RNButtonManager.m
//  AwesomeTSProject
//
//  Created by huangchengdu on 2020/4/16.
//

#import "RNButtonManager.h"
#import "RNButton.h"

@implementation RNButtonManager

RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(title, NSString);
RCT_EXPORT_VIEW_PROPERTY(onClick, RCTDirectEventBlock);

- (RNButton *)view
{
  return [[RNButton alloc] init];
}

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

+ (BOOL)requiresMainQueueSetup
{
    return YES;
}

@end
