//
//  GLWNewsCell.m
//  Flower
//
//  Created by glw on 16/5/6.
//  Copyright © 2016年 glw. All rights reserved.
//

#import "GLWNewsCell.h"
#import "GLWNewsModel.h"
#import <UIImageView+WebCache.h>
@interface GLWNewsCell ()
@property (weak, nonatomic) IBOutlet UILabel *ttlabel;
@property (weak, nonatomic) IBOutlet UIView *imageBackView;
@property (weak, nonatomic) IBOutlet UILabel *fromLabel;
@property (weak, nonatomic) IBOutlet UILabel *updateTimeLabel;


@end

@implementation GLWNewsCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(GLWNewsModel *)model{
    
    _model = model;
    self.imageBackView.hidden = NO;
    self.ttlabel.text = model.title;
    self.fromLabel.text = model.from;
    self.updateTimeLabel.text = model.update_time;
   
    if (model.pic_urls.count == 3) {
        NSArray *imageViewArr = self.imageBackView.subviews;
        for (int i = 0; i < model.pic_urls.count; i++) {
            UIImageView *imageView = imageViewArr[i];
            NSURL *imageURL = [NSURL URLWithString:model.pic_urls[i]];
            [imageView sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"placeholder_banner"]];
        }
    }
    
    else{
        
        self.imageBackView.hidden = YES;
    }
    
    
    [self layoutIfNeeded];
    //计算cell的高
    if (!self.imageBackView.hidden) {
        model.cellHeight = CGRectGetMaxY(self.imageBackView.frame) + self.fromLabel.frame.size.height + 20;
    }
    else{
        model.cellHeight = CGRectGetMaxY(self.ttlabel.frame) + self.fromLabel.frame.size.height + 20;
    }
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
