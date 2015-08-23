//
//  PhotosViewController.m
//  Ausktatija National Park
//
//  Created by Anand Kumar on 8/3/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "PhotosViewController.h"
#import "SWRevealViewController.h"
#import "PhotosCollectionViewCell.h"
#import "DetailPhotoViewController.h"
#import "FlickrModel.h"



@interface PhotosViewController ()  <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>


@property (strong, nonatomic)UICollectionView *collectionView;
@property (strong, nonatomic)NSMutableArray *flickrPhotosTitle;
@property (strong, nonatomic)NSMutableArray *flickrPhotosImageSmall;
@property (strong, nonatomic)NSMutableArray *flickrPhotosImageLarge;
@property (strong, nonatomic)NSMutableArray *flickrPhotosUrls;
@property (strong, nonatomic)NSIndexPath *selectedIndexPath;
@property (strong, nonatomic)UIActivityIndicatorView *activityIndicator;


@end



@implementation PhotosViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    
    self.title = NSLocalizedString(@"Photos of the Park", nil);
    
    [self revealMenuInit];
    
 
    
}




-(void)viewWillAppear:(BOOL)animated

{
    
    self.activityIndicator = [[UIActivityIndicatorView alloc] init];
    
    [self.view addSubview:self.activityIndicator];
    
    
  
    [self flickerInit];
    
    NSLog(@"photoTitle 2 : %@\n\n", self.flickrPhotosTitle);
    
   
   
    
}

-(void)revealMenuInit
{
    
    SWRevealViewController *revealController = [self revealViewController];
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
   
    UIBarButtonItem *revealButtonIteam = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reveal-icon.png"] style:UIBarButtonItemStylePlain target:revealController action:@selector(revealToggle:)];
    
    self.navigationItem.leftBarButtonItem = revealButtonIteam;

    
}



-(void)flickerInit
{
    
  //    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
    
    
    
    FlickrModel *flickerinfo = [[FlickrModel alloc] init];
    
    
    
    [flickerinfo searchFlickrPhotos];
    
  //   dispatch_async(dispatch_get_main_queue(), ^{
    
    self.flickrPhotosTitle = flickerinfo.photoTitles;
    self.flickrPhotosImageSmall = flickerinfo.photoSmallImageData;
    self.flickrPhotosImageLarge = flickerinfo.photoURLsLargeImage;
        
         
  //   });
//});


    
    
    

    
}

#pragma mark Datasource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return 1;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    
        
        NSLog(@"count: %@",self.flickrPhotosTitle);
        
        return [self.flickrPhotosTitle count];
   

    
    
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    PhotosCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PHOTOCELL" forIndexPath:indexPath];
    
   
    
    cell.layer.shouldRasterize = YES;
    cell.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    
    
    cell.photoName.text = [self.flickrPhotosTitle objectAtIndex:indexPath.row];
    
    NSLog(@"photo title 4 : %@", cell.photoName.text);
    
   //  Load image in background  --
     dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
    
        
    NSData *imageData = [self.flickrPhotosImageSmall objectAtIndex:indexPath.row];
    
     dispatch_async(dispatch_get_main_queue(), ^{
    
    cell.parkPhoto.image = [UIImage imageWithData:imageData];
        
        NSLog(@"uicollectionview 5: %@",cell.parkPhoto.image);
    
});
        
       });
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: Select Item
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: Deselect item
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
