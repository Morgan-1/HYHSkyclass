//
//  HYHOpenCourseCell.m
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/8.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import "HYHOpenCourseCell.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"
#import "HYHOpenCourse.h"
@interface HYHOpenCourseCell ()

@property(nonatomic, strong) UIView *baseView;

@property(nonatomic, strong) UIImageView *pictureView;
@property(nonatomic, strong) UILabel *titleLabel;

@property(nonatomic, strong) UIView *descView;

@property(nonatomic, strong) UIImageView *personImageView;
@property(nonatomic, strong) UIImageView *timeImageView;

@property(nonatomic, strong) UILabel *nameLabel;
@property(nonatomic, strong) UILabel *timeLabel;

@end

@implementation HYHOpenCourseCell

- (void)setOpenCourse:(HYHOpenCourse *)openCourse{
    _openCourse = openCourse;
    NSLog(@"--------------subViews : %@", self.contentView.subviews);
    [self.contentView addSubview:self.baseView];
    self.contentView.backgroundColor = [UIColor colorWithWhite:0.933 alpha:1.000];
    
    [_pictureView sd_setImageWithURL:[NSURL URLWithString:self.openCourse.pictureUrl] placeholderImage:[UIImage imageNamed:@"icon"]];
    _pictureView.contentMode = UIViewContentModeScaleAspectFill;
    
    _titleLabel.text = openCourse.videoName;
    _nameLabel.text = openCourse.authorName;
    _timeLabel.text = [openCourse.createTime substringToIndex:[openCourse.createTime rangeOfString:@" "].location];
    
    if(openCourse.isWatched){
        _titleLabel.textColor = [UIColor lightGrayColor];
    }
    else{
        _titleLabel.textColor = [UIColor blackColor];
    }
    
    
    
    [self addAutoLayoutToCell];
}


- (UIView *)baseView{

    
    if (!_baseView) {
        _baseView = [[UIView alloc]init];
        _baseView.backgroundColor = [UIColor whiteColor];
        
        [_baseView addSubview:self.pictureView];
        [_baseView addSubview:self.timeLabel];
        [_baseView addSubview:self.descView];
    }
    return _baseView;
}
- (UIImageView *)pictureView{
    if (!_pictureView) {
        _pictureView = [[UIImageView alloc]initWithFrame:(CGRect){10,10,100,70}];
        _pictureView.contentMode = UIViewContentModeScaleToFill;
        //_pictureView.clipsToBounds = YES;
    }
    return _pictureView;
}
- (UIView *)descView{

    if (!_descView) {
        _descView = [[UIView alloc]init];
        [_descView addSubview:self.personImageView];
        [_descView addSubview:self.timeImageView];
        [_descView addSubview:self.nameLabel];
        [_descView addSubview:self.timeLabel];
    }
    return _descView;
}

-(UIImageView *)personImageView{

    if (!_personImageView) {
        _personImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 22, 22)];
        [_personImageView setImage:[UIImage imageNamed:@"course_teacher"]];
        _personImageView.contentMode = UIViewContentModeCenter;
    }
    return _personImageView;
}


- (UIImageView *)timeImageView{

    if (!_timeImageView) {
        _timeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 22, 22)];
        [_timeImageView setImage:[UIImage imageNamed:@"course_teacher"]];
        _personImageView.contentMode = UIViewContentModeCenter;
    }
    return _timeImageView;
}

- (UILabel *)nameLabel{

    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:11.f];
        _nameLabel.numberOfLines = 1;
        _nameLabel.textColor = [UIColor colorWithWhite:0.773 alpha:100];
    }
    return _nameLabel;
}

- (UILabel *)timeLabel{

    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:11.f];
        _timeLabel.numberOfLines = 1;
        _timeLabel.textColor = [UIColor colorWithWhite:0.773 alpha:1.000];
    }
    return _timeLabel;
}
- (void)addAutoLayoutToCell{

    CGFloat baseViewMargin = 5;
    CGFloat titleMargin = 10;
    CGFloat titleOffset = self.pictureView.width + titleMargin * 2;
    
    [self.baseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(baseViewMargin);
        make.left.equalTo(self.contentView.mas_left).offset(baseViewMargin);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(baseViewMargin);
        make.right.equalTo(self.contentView.mas_right).offset(baseViewMargin);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.baseView.mas_top).offset(titleMargin);
        make.left.equalTo(self.baseView.mas_left).offset(titleOffset);
        make.right.equalTo(self.baseView.mas_right).offset(-titleMargin);
    }];
    [self.descView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(titleMargin * 2);
        make.left.equalTo(self.baseView.mas_left).offset(titleOffset);
        make.bottom.equalTo(self.baseView.mas_bottom).offset(-titleMargin);
        make.right.equalTo(self.baseView.mas_right).offset(-titleMargin);
        make.height.mas_equalTo(25);
    }];
    [self.personImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.descView.mas_left).offset(0);
        make.size.mas_equalTo(CGSizeMake(22, 22));
        make.centerY.mas_equalTo(self.descView.centerY);
        
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.descView.mas_top).offset(0);
        make.left.equalTo(self.personImageView.mas_right).offset(baseViewMargin * 0.5);
        make.centerY.mas_equalTo(self.personImageView.mas_centerY);
        make.width.mas_equalTo(50);
    }];
    [self.timeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).offset(baseViewMargin);
        make.size.mas_equalTo(self.personImageView.bounds.size);
        make.centerY.mas_equalTo(self.personImageView.mas_centerY);
        
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.descView.mas_top).offset(0);
        make.left.equalTo(self.timeImageView.mas_right).offset(baseViewMargin * 0.5);
        make.right.equalTo(self.descView).offset(0);
        make.bottom.equalTo(self.descView.mas_bottom).offset(0);
    }];
    
}
@end
