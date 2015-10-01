//
//  ImageMapViewController.m
//  Ausktatija National Park
//
//  Created by Anand Kumar on 8/31/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "ImageMapViewController.h"

@interface ImageMapViewController ()

@end

@implementation ImageMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self imageScroller];
    // Do any additional setup after loading the view.
}




-(void)imageScroller
{
    
    UIImageView *nationalParkMapImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"anp_map"]];
    
    nationalParkMapImage.frame = self.scrollView.bounds;
    
    self.nationalParkMapImage = nationalParkMapImage;
    
    
    
  //  self.scrollView.contentSize = self.nationalParkMapImage.frame.size;
    
   
    self.scrollView.maximumZoomScale = nationalParkMapImage.image.size.width / self.scrollView.frame.size.width;
    self.scrollView.minimumZoomScale = 0.5;
    self.scrollView.zoomScale = 1.0;
    
   
     [self.scrollView addSubview:self.nationalParkMapImage];
    
    
}



-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    
    
    return self.nationalParkMapImage;
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
