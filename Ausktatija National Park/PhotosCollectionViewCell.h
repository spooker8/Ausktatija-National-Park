//
//  PhotosCollectionViewCell.h
//  Ausktatija National Park
//
//  Created by Anand Kumar on 8/6/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PhotosCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *parkPhoto;

@property (weak, nonatomic) IBOutlet UILabel *photoName;


@end
