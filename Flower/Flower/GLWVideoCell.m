//
//  GLWVideoCell.m
//  Flower
//
//  Created by glw on 16/5/7.
//  Copyright © 2016年 glw. All rights reserved.
//

#import "GLWVideoCell.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "GLWVideoModel.h"
@interface GLWVideoCell ()
@property (weak, nonatomic) IBOutlet UIImageView *videoImageView;
@property (weak, nonatomic) IBOutlet UILabel *videotitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *videoSourceLabel;
@property(nonatomic,strong) UILabel *videoTimeLabel;


@end

@implementation GLWVideoCell

- (void)awakeFromNib {
    // Initialization code
    self.videoTimeLabel = [[UILabel alloc] init];
    [self.videoImageView addSubview:self.videoTimeLabel];
    [self.videoTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.videoImageView);
        make.bottom.mas_equalTo(self.videoImageView);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(10);
    }];
    self.videoTimeLabel.font = [UIFont systemFontOfSize:10.0];
    self.videoTimeLabel.textColor = [UIColor whiteColor];
    self.videoTimeLabel.backgroundColor = [UIColor colorWithRed:10 / 255.0 green:10 / 255.0 blue:10 / 255.0 alpha:0.3];
}

-(void)setModel:(GLWVideoModel *)model{
    _model = model;
    self.videoTimeLabel.text = model.time;
    NSURL *imageURL = [NSURL URLWithString:model.picurl];
    [self.videoImageView sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"placeholder_banner"]];
    self.videoSourceLabel.text = model.source;
    self.videotitleLabel.text = model.title;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
