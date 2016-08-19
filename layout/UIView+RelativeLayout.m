//
//  UIView+RelativeLayout.m
//  layout
//
//  Created by qianjn on 16/8/19.
//  Copyright © 2016年 SF. All rights reserved.
//

#import "UIView+RelativeLayout.h"

@implementation UIView (RelativeLayout)

-(void)setReference:(UIView *)refeView
     RelativeAlignX:(RelativeAlignX)relaX
     RelativeAlignY:(RelativeAlignY)relaY
        alignOffset:(CGPoint)offset
               size:(CGSize)size {
    
    if ([self.superview isEqual:refeView]) {
        [self setSuperReference:refeView
                 RelativeAlignX:relaX
                 RelativeAlignY:relaY
                    alignOffset:offset
                           size:size];
    } else {
        [self setParallelReference:refeView
                    RelativeAlignX:relaX
                    RelativeAlignY:relaY
                       alignOffset:offset
                              size:size];
    }
    
    
}


- (void)setReferenceX:(UIView *)refeXView
           ReferenceY:(UIView *)refeYView
       RelativeAlignX:(RelativeAlignX)relaX
       RelativeAlignY:(RelativeAlignY)relaY
          alignOffset:(CGPoint)offset
                 size:(CGSize)size {
    if ([self.superview isEqual:refeXView]) {
        [self setSuperReferenceX:refeXView
                 SuperReferenceY:refeYView
                  RelativeAlignX:relaX
                  RelativeAlignY:relaY
                     alignOffset:offset
                            size:size];
        
    } else {
        [self setParallelReferenceX:refeXView
                         ReferenceY:refeYView
                     RelativeAlignX:relaX
                     RelativeAlignY:relaY
                        alignOffset:offset
                               size:size];
    }

}


#pragma mark - 平行关系
- (void)setParallelReference:(UIView *)refeView
              RelativeAlignX:(RelativeAlignX)relaX
              RelativeAlignY:(RelativeAlignY)relaY
                 alignOffset:(CGPoint)offset
                        size:(CGSize)size {
    
    CGFloat TX = [self getParallelTXWithReferenceX:refeView RelativeAlignX:relaX size:size];
    
    CGFloat TY = [self getParallelTYWithReferenceY:refeView RelativeAlignY:relaY size:size];
    
    [self setUpFrameWithX:TX Y:TY offset:offset size:size];
    
}


- (void)setParallelReferenceX:(UIView *)refeXView
                   ReferenceY:(UIView *)refeYView
               RelativeAlignX:(RelativeAlignX)relaX
               RelativeAlignY:(RelativeAlignY)relaY
                  alignOffset:(CGPoint)offset
                         size:(CGSize)size  {
    
    CGFloat TX = [self getParallelTXWithReferenceX:refeXView RelativeAlignX:relaX size:size];

    CGFloat TY = [self getParallelTYWithReferenceY:refeYView RelativeAlignY:relaY size:size];
    
    [self setUpFrameWithX:TX Y:TY offset:offset size:size];
    
}


- (CGFloat)getParallelTXWithReferenceX:(UIView *)refeXView
                        RelativeAlignX:(RelativeAlignX)relaX
                                  size:(CGSize)size {
    
    CGFloat TX = 0;
    switch (relaX) {
        case Relative_AlignX_LL:
            TX = CGRectGetMinX(refeXView.frame);
            break;
        case Relative_AlignX_LR:
            TX = CGRectGetMaxX(refeXView.frame);
            break;
        case Relative_AlignX_LC:
            TX = CGRectGetMinX(refeXView.frame) + refeXView.frame.size.width/2;
            break;
        case Relative_AlignX_CL:
            TX = CGRectGetMinX(refeXView.frame) - size.width/2;
            break;
        case Relative_AlignX_CR:
            TX = CGRectGetMaxX(refeXView.frame) - size.width/2;
            break;
        case Relative_AlignX_CC:
            TX = CGRectGetMinX(refeXView.frame) + refeXView.frame.size.width/2 - (size.width/2);
            break;
        case Relative_AlignX_RL:
            TX = CGRectGetMinX(refeXView.frame) - size.width;
            break;
        case Relative_AlignX_RR:
            TX = CGRectGetMaxX(refeXView.frame) - size.width;
            break;
        case Relative_AlignX_RC:
            TX = CGRectGetMinX(refeXView.frame) + refeXView.frame.size.width/2 - size.width;
            break;
    }
    return TX;
}

- (CGFloat)getParallelTYWithReferenceY:(UIView *)refeYView
                        RelativeAlignY:(RelativeAlignY)relaY
                                  size:(CGSize)size {
    CGFloat TY = 0;
    switch (relaY) {
        case Relative_AlignY_TT:
            TY = CGRectGetMinY(refeYView.frame);
            break;
        case Relative_AlignY_TB:
            TY = CGRectGetMaxY(refeYView.frame);
            break;
        case Relative_AlignY_TC:
            TY = CGRectGetMinY(refeYView.frame) + refeYView.frame.size.height/2;
            break;
        case Relative_AlignY_CT:
            TY = CGRectGetMinY(refeYView.frame) - size.height/2;
            break;
        case Relative_AlignY_CB:
            TY = CGRectGetMaxY(refeYView.frame) - size.height/2;
            break;
        case Relative_AlignY_CC:
            TY = CGRectGetMinY(refeYView.frame) + refeYView.frame.size.height/2 - (size.height/2);
            break;
        case Relative_AlignY_BT:
            TY = CGRectGetMinY(refeYView.frame) - size.height;
            break;
        case Relative_AlignY_BB:
            TY = CGRectGetMaxY(refeYView.frame) - size.height;
            break;
        case Relative_AlignY_BC:
            TY = CGRectGetMinY(refeYView.frame) + refeYView.frame.size.height/2 - size.height;
            break;
    }
    return TY;
    
}

#pragma mark - 父子关系
- (void)setSuperReference:(UIView *)refeView
              RelativeAlignX:(RelativeAlignX)relaX
              RelativeAlignY:(RelativeAlignY)relaY
                 alignOffset:(CGPoint)offset
                        size:(CGSize)size {
    CGFloat TX = [self getSuperTXWithReferenceX:refeView RelativeAlignX:relaX size:size];
    
    CGFloat TY = [self getSuperTYWithReferenceY:refeView RelativeAlignY:relaY size:size];
    
    [self setUpFrameWithX:TX Y:TY offset:offset size:size];
    
}

- (void)setSuperReferenceX:(UIView *)SuperRefeXView
           SuperReferenceY:(UIView *)SuperRefeYView
            RelativeAlignX:(RelativeAlignX)relaX
            RelativeAlignY:(RelativeAlignY)relaY
               alignOffset:(CGPoint)offset
                      size:(CGSize)size {
    
    CGFloat TX = [self getSuperTXWithReferenceX:SuperRefeXView RelativeAlignX:relaX size:size];
    CGFloat TY = [self getSuperTYWithReferenceY:SuperRefeYView RelativeAlignY:relaY size:size];
    [self setUpFrameWithX:TX Y:TY offset:offset size:size];
    
}


- (CGFloat)getSuperTXWithReferenceX:(UIView *)SuperRefeXView
                        RelativeAlignX:(RelativeAlignX)relaX
                               size:(CGSize)size {
    CGFloat TX = 0;
    switch (relaX) {
        case Relative_AlignX_LL:
            TX = 0;
            break;
        case Relative_AlignX_LR:
            TX = SuperRefeXView.frame.size.width;
            break;
        case Relative_AlignX_LC:
            TX = SuperRefeXView.frame.size.width/2;
            break;
        case Relative_AlignX_CL:
            TX = - size.width/2;
            break;
        case Relative_AlignX_CR:
            TX = SuperRefeXView.frame.size.width - size.width/2;
            break;
        case Relative_AlignX_CC:
            TX = SuperRefeXView.frame.size.width/2 - (size.width/2);
            break;
        case Relative_AlignX_RL:
            TX = - size.width;
            break;
        case Relative_AlignX_RR:
            TX = SuperRefeXView.frame.size.width - size.width;
            break;
        case Relative_AlignX_RC:
            TX = SuperRefeXView.frame.size.width/2 - size.width;
            break;
    }
    return TX;
    
}


- (CGFloat)getSuperTYWithReferenceY:(UIView *)SuperRefeYView
                    RelativeAlignY:(RelativeAlignY)relaY
                                size:(CGSize)size {
    CGFloat TY = 0;
    switch (relaY) {
        case Relative_AlignY_TT:
            TY = 0;
            break;
        case Relative_AlignY_TB:
            TY = SuperRefeYView.frame.size.height;
            break;
        case Relative_AlignY_TC:
            TY =SuperRefeYView.frame.size.height/2;
            break;
        case Relative_AlignY_CT:
            TY = - size.height/2;
            break;
        case Relative_AlignY_CB:
            TY = SuperRefeYView.frame.size.height - size.height/2;
            break;
        case Relative_AlignY_CC:
            TY = SuperRefeYView.frame.size.height/2 - (size.height/2);
            break;
        case Relative_AlignY_BT:
            TY = - size.height;
            break;
        case Relative_AlignY_BB:
            TY = SuperRefeYView.frame.size.height - size.height;
            break;
        case Relative_AlignY_BC:
            TY = SuperRefeYView.frame.size.height/2 - size.height;
            break;
    }
    return TY;
    
}

- (void)setUpFrameWithX:(CGFloat)TX Y:(CGFloat)TY offset:(CGPoint)Toffset size:(CGSize)Tsize {
    
    CGFloat FX = TX + Toffset.x;
    CGFloat FY = TY + Toffset.y;
    self.frame = CGRectMake(FX, FY, Tsize.width, Tsize.height);

}




@end
