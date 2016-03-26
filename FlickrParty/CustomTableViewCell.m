//
//  CustomTableViewCell.m
//  FlickrParty
//
//  Created by Mohamed Alsadek on 3/26/16.
//  Copyright © 2016 Mohamed Alsadek. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell 


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.backgroundColor = [UIColor clearColor] ;
        [self configureImageViewLayout] ;
        [self configurePreviewImage] ;
        [self configureTitleLabel] ;
        self.selectionStyle = UITableViewCellSelectionStyleNone ;
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


#pragma  mark - UI and Autolayout
- (void)configureImageViewLayout {
    self.viewImage = [[UIView alloc] init] ;
    self.viewImage.backgroundColor = [UIColor clearColor] ;
    [self.viewImage setClipsToBounds:YES] ;
    
    /// Set width and height
    [LayoutManager setConstraintHeightForView:self.viewImage WithConstant:80] ;
    [LayoutManager setConstraintWidthForView:self.viewImage WithConstant:80] ;
    [self.contentView addSubview:self.viewImage] ;
    
    /// Set places
    [LayoutManager setConstraintLeftView:self.viewImage toView:self.contentView AndSuperView:self.contentView withConstant:10] ;
    [LayoutManager setConstraintTopView:self.viewImage toView:self.contentView AndSuperView:self.contentView withConstant:0] ;
    [LayoutManager setConstraintBottomView:self.viewImage toView:self.contentView AndSuperView:self.contentView withConstant:0] ;
}


- (void)configurePreviewImage {
    self.imageViewPreview = [[UIImageView alloc] init] ;
    self.imageViewPreview.backgroundColor = [UIColor clearColor] ;
    self.imageViewPreview.contentMode = UIViewContentModeScaleAspectFill ;
    self.imageViewPreview.clipsToBounds = YES ;

    [LayoutManager setConstraintHeightForView:self.imageViewPreview WithConstant:65] ;
    [LayoutManager setConstraintWidthForView:self.imageViewPreview WithConstant:80] ;
    [self.viewImage addSubview:self.imageViewPreview] ;
    
    [LayoutManager setConstraintCenterForView:self.imageViewPreview andView2:self.viewImage inView:self.contentView] ;
}

- (void)configureTitleLabel {
    self.labelTitle = [UIBuilder generalLabel];
    [self.contentView addSubview:self.labelTitle] ;

    //set places
    [LayoutManager setConstraintLeftView:self.labelTitle toView:self.contentView AndSuperView:self.contentView withConstant:93] ;
    
    [LayoutManager setConstraintRightView:self.labelTitle toView:self.contentView AndSuperView:self.contentView withConstant:0] ;
    [LayoutManager setConstraintTopView:self.labelTitle toView:self.contentView AndSuperView:self.contentView withConstant:0] ;
    [LayoutManager setConstraintBottomView:self.labelTitle toView:self.contentView AndSuperView:self.contentView withConstant:0] ;
}

#pragma mark - updateUI
- (void)setupCellWithData:(Photo *)photo {
    // set main image
    [self setMainImageWithObject:photo] ;
    
    // set photo label
    [self setTitleWithObject:photo] ;
}

- (void)setMainImageWithObject:(Photo *)photo {
    
    NSURL *imageURL = [photo photoURL] ;
    if (imageURL) {
        [self.imageViewPreview setImageWithURL:imageURL placeholderImage:nil usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray] ;
    }
}

- (void)setTitleWithObject:(Photo *)photo {
    self.labelTitle.text = photo.title ;
}

@end
