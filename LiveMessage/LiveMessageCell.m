//
//  LiveMessageCell.m
//  LiveMessage
//
//  Created by 张奥 on 2019/7/22.
//  Copyright © 2019年 张奥. All rights reserved.
//

#import "LiveMessageCell.h"
#import "YYKit.h"
#import "Masonry.h"
#import "YYLabel+ZAImage.h"
#define SCREEN_Width [UIScreen mainScreen].bounds.size.width
#define SCREEN_Height [UIScreen mainScreen].bounds.size.height
@interface LiveMessageCell()
@property (nonatomic,strong)YYLabel *label;
@end
@implementation LiveMessageCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}
-(void)createUI{
    CGFloat labelWidth = (280.f / 375.f)*SCREEN_Width;
    YYLabel *label = [[YYLabel alloc] init];
    label.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    label.numberOfLines = 0;
    label.preferredMaxLayoutWidth = labelWidth;
    label.textContainerInset = UIEdgeInsetsMake(0, 5, 0, 5);
    label.font = [UIFont systemFontOfSize:13.f];
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius = 4.f;
    label.textColor = [UIColor whiteColor];
    self.label = label;
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.mas_leading).with.offset(10);
        make.bottom.equalTo(self.mas_bottom).with.offset(-2);
        make.top.equalTo(self.mas_top).with.offset(2);
        make.width.mas_equalTo(labelWidth);
    }];
}
-(void)setModel:(MessageModel *)model{
    _model = model;
    [self.label liveMessageTextModel:model changeColor:[UIColor redColor] range:NSMakeRange(0, 5)];
    [self.label mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(model.cellWidth);
    }];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//计算cell的高度
+(CGSize)caculateCellSizeModel:(MessageModel*)model{
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
    CGSize maxSize = CGSizeMake((275.f/375.f)*SCREEN_Width, MAXFLOAT);
    //计算文本宽高
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:maxSize text:attStr];
    CGFloat introHeigth = layout.textBoundingSize.height;
    CGFloat introWidth = layout.textBoundingSize.width;
    return CGSizeMake(introWidth+10, introHeigth+10);
}
@end
