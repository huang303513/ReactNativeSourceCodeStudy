//
//  RNButton.m
//  AwesomeTSProject
//
//  Created by huangchengdu on 2020/4/16.
//

#import "RNButton.h"
#import <Masonry/Masonry.h>

@interface RNButton ()
@property(nonatomic, copy) RCTDirectEventBlock onClick;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, strong) UIButton *button;
@end

@implementation RNButton

- (instancetype)init{
  self = [super init];
  if (self) {
    self.backgroundColor = [UIColor greenColor];
    _button = [[UIButton alloc]init];
    [_button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self addSubview:_button];
    [_button mas_makeConstraints:^(MASConstraintMaker *make) {
      make.edges.equalTo(self);
    }];
  }
  return self;
}

- (void)setTitle:(NSString *)title{
  _title = title;
  [self.button setTitle:title forState:UIControlStateNormal];
}

- (void)setOnClick:(RCTDirectEventBlock)onClick{
  _onClick = onClick;
  if (onClick) {
    [self.button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
  }
}

- (void)clickButton:(UIButton *)button{
  if (self.onClick) {
    NSDate *date = [NSDate new];
    self.onClick(@{@"time": [date description]});
  }
}
@end
