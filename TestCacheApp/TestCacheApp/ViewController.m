//
//  ViewController.m
//  TestCacheApp
//
//  Created by huangchengdu on 2019/6/14.
//  Copyright © 2019 huangchengdu. All rights reserved.
//

#import "ViewController.h"

static NSString *imageUrl = @"https://img.alicdn.com/imgextra/i2/2200775048178/O1CN01hpd2MS2AHZYcvYjXu_!!2200775048178.jpg";

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     NSLog(@"========>>>%@",NSHomeDirectory());
}

- (IBAction)loadImage:(id)sender {
    NSURL *url = [NSURL URLWithString:[imageUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    request.cachePolicy = NSURLRequestUseProtocolCachePolicy;
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = [UIImage imageWithData:data];
        });
    }];
    [dataTask resume];
}

@end
