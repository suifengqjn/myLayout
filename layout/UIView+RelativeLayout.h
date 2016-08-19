//
//  UIView+RelativeLayout.h
//  layout
//
//  Created by qianjn on 16/8/19.
//  Copyright © 2016年 SF. All rights reserved.
//

#import <UIKit/UIKit.h>


//Relative_AlignX_LR :自己的左边 按照 参照物的右边局部
typedef enum {
    Relative_AlignX_LL      = 0,
    Relative_AlignX_LR      = 1,
    Relative_AlignX_LC      = 2,
    Relative_AlignX_CL      = 3,
    Relative_AlignX_CR      = 4,
    Relative_AlignX_CC      = 5,
    Relative_AlignX_RL      = 6,
    Relative_AlignX_RR      = 7,
    Relative_AlignX_RC      = 8
}RelativeAlignX;

//Relative_AlignX_TC :自己的顶部 按照 参照物的中间局部
typedef enum {
    Relative_AlignY_TT      = 0,
    Relative_AlignY_TB      = 1,
    Relative_AlignY_TC      = 2,
    Relative_AlignY_CT      = 3,
    Relative_AlignY_CB      = 4,
    Relative_AlignY_CC      = 5,
    Relative_AlignY_BT      = 6,
    Relative_AlignY_BB      = 7,
    Relative_AlignY_BC      = 8
}RelativeAlignY;

@interface UIView (RelativeLayout)

#pragma mark  一个参照物
- (void)setReference:(UIView *)refeView RelativeAlignX:(RelativeAlignX)relaX RelativeAlignY:(RelativeAlignY)relaY alignOffset:(CGPoint)offset size:(CGSize)size;

#pragma mark 两个参照物
- (void)setReferenceX:(UIView *)refeXView ReferenceY:(UIView *)refeYView RelativeAlignX:(RelativeAlignX)relaX RelativeAlignY:(RelativeAlignY)relaY alignOffset:(CGPoint)offset size:(CGSize)size;

@end
