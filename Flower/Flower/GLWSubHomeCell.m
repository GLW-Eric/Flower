//
//  GLWSubHomeCell.m
//  Flower
//
//  Created by glw on 16/5/5.
//  Copyright © 2016年 glw. All rights reserved.
//

#import "GLWSubHomeCell.h"
#import "GLWSubHomeModel.h"
@interface GLWSubHomeCell ()
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UILabel *ttLabel;
@property (weak, nonatomic) IBOutlet UILabel *sumLabel;



@end

@implementation GLWSubHomeCell

- (void)awakeFromNib {
    // Initialization code
    self.bgView.layer.cornerRadius = 10;
    self.bgView.clipsToBounds = YES;
    self.sumLabel.numberOfLines = 0;
}


-(void)setModel:(GLWSubHomeModel *)model{
    _model = model;
    self.ttLabel.text = model.title;
    self.sumLabel.text = model.summary;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
