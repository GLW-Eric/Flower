//
//  GLWEncyViewCell.m
//  Flower
//
//  Created by glw on 16/5/8.
//  Copyright © 2016年 glw. All rights reserved.
//

#import "GLWEncyViewCell.h"
#import "GLWEncyClassModel.h"
#import <UIImageView+WebCache.h>
@interface GLWEncyViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end

@implementation GLWEncyViewCell

- (void)awakeFromNib {
    // Initialization code
    self.titleLabel.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
}

-(void)setModel:(GLWEncyClassModel *)model{
    _model = model;
    NSURL *url = [NSURL URLWithString:model.image_url];
    [self.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeholder_banner"]];
    self.titleLabel.text = model.title;
}



@end
