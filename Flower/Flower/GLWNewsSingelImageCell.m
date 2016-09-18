//
//  GLWNewsSingelImageCell.m
//  Flower
//
//  Created by glw on 16/5/6.
//  Copyright © 2016年 glw. All rights reserved.
//

#import "GLWNewsSingelImageCell.h"
#import "GLWNewsModel.h"
#import <UIImageView+WebCache.h>
@interface GLWNewsSingelImageCell ()
@property (weak, nonatomic) IBOutlet UILabel *ttLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *fromLabel;
@property (weak, nonatomic) IBOutlet UILabel *updateTimeLabel;


@end

@implementation GLWNewsSingelImageCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(GLWNewsModel *)model{

    _model = model;
    self.ttLabel.text = model.title;
    self.fromLabel.text = model.from;
    self.updateTimeLabel.text = model.update_time;
    NSURL *imageURL = [NSURL URLWithString:model.picurl];
    [self.imgView sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"placeholder_banner"]];
    [self layoutIfNeeded];
    model.cellHeight = CGRectGetMaxY(self.imgView.frame) + self.fromLabel.frame.size.height + 20;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
