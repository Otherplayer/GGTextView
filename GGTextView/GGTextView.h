//
//  GGTextView.h
//  GGTextView
//
//  Created by __无邪_ on 15/9/9.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MARGIN 5
#define PLACEHOLDERFONTSIZE 13

@interface GGTextView : UITextView

@property (nonatomic, assign)  NSUInteger maxNumberLimited;
@property (nonatomic, copy)    NSString *placeholder;




@end
