//
//  ImageMapViewController.h
//  Ausktatija National Park
//
//  Created by Anand Kumar on 8/31/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageMapViewController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) UIImageView *nationalParkMapImage;

@end
