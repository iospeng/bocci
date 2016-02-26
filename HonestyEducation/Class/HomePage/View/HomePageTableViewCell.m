//
//  HomePageTableViewCell.m
//  HonestyEducation
//
//  Created by bocweb on 16/2/24.
//  Copyright © 2016年 bocweb. All rights reserved.
//

#import "HomePageTableViewCell.h"

@interface HomePageTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *avartView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation HomePageTableViewCell

- (void)setModel:(HomePageModel *)model {
    _model = model;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
