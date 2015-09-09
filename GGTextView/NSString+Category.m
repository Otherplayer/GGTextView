//
//  NSString+Category.m
//  GGTextView
//
//  Created by __无邪_ on 15/9/9.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import "NSString+Category.h"

@implementation NSString (Category)
- (CGFloat)heightWithFont:(UIFont *)font size:(CGSize)size{
    NSStringDrawingOptions options =  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = NSLineBreakByTruncatingTail;
    
    NSDictionary *attributes = @{NSFontAttributeName : font};
    
    CGFloat height = [self boundingRectWithSize:size options:options attributes:attributes context:nil].size.height;
    //    if (height < 25) {
    //        height = 25;
    //    }
    return height;
}
@end
