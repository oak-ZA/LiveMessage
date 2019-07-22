//
//  YYLabel+ZAImage.h
//  LiveMessage
//
//  Created by 张奥 on 2019/7/22.
//  Copyright © 2019年 张奥. All rights reserved.
//

#import "YYLabel.h"
#import "MessageModel.h"
@interface YYLabel (ZAImage)
-(void)liveMessageTextModel:(MessageModel*)model changeColor:(UIColor*)color range:(NSRange)range;
@end
