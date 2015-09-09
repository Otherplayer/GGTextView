//
//  GGTextView.m
//  GGTextView
//
//  Created by __无邪_ on 15/9/9.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import "GGTextView.h"
#import "NSString+Category.h"


@interface GGTextView ()
@property (nonatomic, strong) UILabel *placeholderLabel;

@end


@implementation GGTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.placeholderLabel];
        self.delegate = self;
        self.maxNumberLimited = LONG_MAX;
    }
    return self;
}

#pragma mark - delegate
//通过判断表层TextView的内容来实现底层TextView的显示于隐藏
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    if(![text isEqualToString:@""]){
        [self.placeholderLabel setHidden:YES];
    }
    if([text isEqualToString:@""]&&range.length==1&&range.location==0){
        [self.placeholderLabel setHidden:NO];
    }
    
    
    if (textView.text.length >= self.maxNumberLimited && text.length > 0) {
        return NO;
    }
    
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView{
    if (textView.text.length > self.maxNumberLimited) {
        textView.text = [textView.text substringWithRange:NSMakeRange(0, self.maxNumberLimited)];
    }
    
    if(![textView.text isEqualToString:@""]){
        [self.placeholderLabel setHidden:YES];
    }else{
        [self.placeholderLabel setHidden:NO];
    }

}


#pragma mark - configure

-(void)setPlaceholder:(NSString *)placeholder{
    UIFont *font = [UIFont systemFontOfSize:PLACEHOLDERFONTSIZE];
    CGSize size = CGSizeMake(CGRectGetWidth(self.bounds) - MARGIN * 2, CGRectGetHeight(self.bounds) - MARGIN * 2);
    CGFloat height = [placeholder heightWithFont:font size:size];
    if (height < 20) {
        height = 20;
    }
    [self.placeholderLabel setText:placeholder];
    [self.placeholderLabel setFrame:CGRectMake(MARGIN, MARGIN, size.width, height)];
}


-(UILabel *)placeholderLabel{
    if (_placeholderLabel == nil) {
        _placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN, MARGIN, CGRectGetWidth(self.bounds) - MARGIN * 2, 0)];
        [_placeholderLabel setNumberOfLines:0];
        [_placeholderLabel setBackgroundColor:[UIColor cyanColor]];
        [_placeholderLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [_placeholderLabel setTextColor:[UIColor lightGrayColor]];//#cccccc
    }
    return _placeholderLabel;
}





@end
