//
//  YYLabel+ZAImage.m
//  LiveMessage
//
//  Created by 张奥 on 2019/7/22.
//  Copyright © 2019年 张奥. All rights reserved.
//

#import "YYLabel+ZAImage.h"
#import "YYKit.h"
@implementation YYLabel (ZAImage)
-(void)liveMessageTextModel:(MessageModel*)model changeColor:(UIColor*)color range:(NSRange)range{
    NSString *string = model.text;
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] init];
    attStr.alignment = NSTextAlignmentJustified;
    //图片
    for (int i=0; i<model.images.count; i++) {
        UIImage *image = model.images[i];
        YYAnimatedImageView *imageView1 = [[YYAnimatedImageView alloc] initWithImage:image];
        NSMutableAttributedString *attachText = [NSMutableAttributedString attachmentStringWithContent:image contentMode:UIViewContentModeScaleAspectFit attachmentSize:CGSizeMake(imageView1.bounds.size.width, imageView1.bounds.size.height) alignToFont:[UIFont systemFontOfSize:13.f] alignment:YYTextVerticalAlignmentCenter];
        [attStr appendAttributedString:attachText];
        [attStr appendAttributedString:[[NSAttributedString alloc] initWithString:@"  "]];
    }
    [attStr appendAttributedString:[[NSAttributedString alloc] initWithString:string]];
    [attStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13.f] range:NSMakeRange(0, attStr.length)];
    [attStr setLineSpacing:10 range:NSMakeRange(0, attStr.length)];
    NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:color, NSForegroundColorAttributeName,nil];
    [attStr setAttributes:attrs range:NSMakeRange(attStr.length-range.length, range.length)];
    self.attributedText = attStr;
}
@end
