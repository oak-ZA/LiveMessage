//
//  MessageModel.h
//  LiveMessage
//
//  Created by 张奥 on 2019/7/22.
//  Copyright © 2019年 张奥. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MessageModel : NSObject
//图片数组
@property (nonatomic,copy) NSArray *images;
//文本消息
@property (nonatomic,copy) NSString *text;
//cell高度
@property (nonatomic,assign) CGFloat cellHeight;
//cell宽度
@property (nonatomic,assign) CGFloat cellWidth;
@end
