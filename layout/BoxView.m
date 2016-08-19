//
//  BoxView.m
//  layout
//
//  Created by qianjn on 16/8/19.
//  Copyright © 2016年 SF. All rights reserved.
//

#import "BoxView.h"
#import "UIView+Layout.h"
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define FMFont(x) [UIFont systemFontOfSize:x]
@interface BoxView ()
@property (nonatomic, assign) BOOL isMe;
@end

@implementation BoxView

- (instancetype)init
{
    self = [super initWithFrame:CGRectMake(0, 0, 367, 677)];
    if (self) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI
{
    self.backgroundColor = [UIColor grayColor];
    CGFloat kHeight = 0;
    if (kScreenWidth > 320) {
        kHeight = 340;
    } else {
        kHeight = 360;
    }

    UIView *backWhiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth - 33*2, kHeight)];
    backWhiteView.layer.cornerRadius = 4.0;
    backWhiteView.layer.masksToBounds = YES;
    backWhiteView.center = self.center;
    backWhiteView.backgroundColor = [UIColor whiteColor];
    [self addSubview:backWhiteView];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [backWhiteView addSubview:imageView];
    if (_isMe) {
        imageView.image = [UIImage imageNamed:@"buyerProtection"];
    } else {
        imageView.image = [UIImage imageNamed:@"buyerProtection8"];
    }
    
    [imageView setReference:backWhiteView
             RelativeAlignX:Relative_AlignX_LL
             RelativeAlignY:Relative_AlignY_TT
                alignOffset:CGPointMake(10, 10)
                       size:CGSizeMake(backWhiteView.frame.size.width - 20, 120)];
    
    
    imageView.backgroundColor = [UIColor redColor];
    
    UILabel *titlelabel = [[UILabel alloc] init];
    [backWhiteView addSubview:titlelabel];
    if (_isMe) {
        titlelabel.text = NSLocalizedString(@"Get Paid by 5miles", nil);
    } else {
        titlelabel.text = NSLocalizedString(@"5miles Buyer Protection", nil);
    }
    titlelabel.textColor = [UIColor blackColor];
    titlelabel.numberOfLines = 1;
    titlelabel.font = FMFont(17);
    [titlelabel sizeToFit];
    [titlelabel setReference:imageView
             RelativeAlignX:Relative_AlignX_LL
             RelativeAlignY:Relative_AlignY_TB
                alignOffset:CGPointMake(10, 10)
                       size:CGSizeMake(imageView.frame.size.width - 4, 20)];
    
    [titlelabel sizeToFit];
    
    UILabel *label1 = [[UILabel alloc] init];
    [backWhiteView addSubview:label1];
    if (_isMe) {
        label1.text = NSLocalizedString(@"1. 5miles will notify you when your item is paid by buyers.", nil);
    } else {
        label1.text = NSLocalizedString(@"1. 5miles will notify you when your item is delivered.", nil);
    }
    label1.numberOfLines = 0;
    label1.font = FMFont(14);
    [label1 setReference:titlelabel
              RelativeAlignX:Relative_AlignX_LL
              RelativeAlignY:Relative_AlignY_TB
                 alignOffset:CGPointMake(0, 14)
                        size:CGSizeMake(titlelabel.frame.size.width , 10)];
    [label1 sizeToFit];
    
    
    UILabel *label2 = [[UILabel alloc] init];
    [backWhiteView addSubview:label2];
    if (_isMe) {
        label2.text = NSLocalizedString(@"2. Schedule a date to meetup and gain the money.", nil);
    } else {
        label2.text = NSLocalizedString(@"2. Use 5miles Payment for exchange.", nil);
    }
    label2.numberOfLines = 0;
    label2.font = FMFont(14);
    [label2 setReferenceX:titlelabel ReferenceY:label1 RelativeAlignX:Relative_AlignX_LL RelativeAlignY:Relative_AlignY_TB alignOffset:CGPointMake(0, 14) size:CGSizeMake(titlelabel.frame.size.width , 10)];
    [label2 sizeToFit];
    
    
    UILabel *label3 = [[UILabel alloc] init];
    [backWhiteView addSubview:label3];
    if (_isMe) {
        label3.text = NSLocalizedString(@"3. Receive your gains directly to your bank account.", nil);
    } else {
        label3.text = NSLocalizedString(@"3. 5miles will monitor and protect users against fraud.", nil);
    }
    label3.numberOfLines = 0;
    label3.font = FMFont(14);
    
    [label3 setReference:label2
          RelativeAlignX:Relative_AlignX_LL
          RelativeAlignY:Relative_AlignY_TB
             alignOffset:CGPointMake(0, 14)
                    size:CGSizeMake(titlelabel.frame.size.width , 10)];
    [label3 sizeToFit];
    
    
    UIButton *learnMore = [UIButton buttonWithType:UIButtonTypeCustom];
     [backWhiteView addSubview:learnMore];
    learnMore.titleLabel.font = FMFont(14);
    [learnMore setTitle:NSLocalizedString(@"Learn More", nil) forState:UIControlStateNormal];
    [learnMore setReference:self
          RelativeAlignX:Relative_AlignX_LL
          RelativeAlignY:Relative_AlignY_BB
             alignOffset:CGPointMake(0, 14)
                    size:CGSizeMake(100 , 16)];
   
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(learnMore)];
    [learnMore addGestureRecognizer:tap];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backWhiteView addSubview:btn];
    btn.titleLabel.font = FMFont(14);
    [btn setTitle:NSLocalizedString(@"OK", nil) forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(tapClick) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setReference:self
             RelativeAlignX:Relative_AlignX_RR
             RelativeAlignY:Relative_AlignY_BB
                alignOffset:CGPointMake(0, 14)
                       size:CGSizeMake(-10 , -12)];
    btn.bounds = CGRectMake(0, 0, kScreenWidth > 320 ? 137 : 120, 32);
    
    
    
}
@end
