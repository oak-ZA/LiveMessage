//
//  LiveMessageCell.h
//  LiveMessage
//
//  Created by 张奥 on 2019/7/22.
//  Copyright © 2019年 张奥. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"
@interface LiveMessageCell : UITableViewCell
@property (nonatomic,strong) MessageModel *model;
//计算cell的高度
+(CGSize)caculateCellSizeModel:(MessageModel*)model;
@end
