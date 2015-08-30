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
//#import "FlickrModel.h"


#import "FlickrModel2.h"
#import "FlickrAPIHelper.h"
#import "FlickrParser.h"
#import "FlickrImageDownloader.h"


@interface PhotosViewController ()  <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>


@property (strong, nonatomic)IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic)NSMutableArray *flickrPhotosTitle;
@property (strong, nonatomic)NSMutableArray *flickrPhotosImageSmall;
@property (strong, nonatomic)NSMutableArray *flickrPhotosImageLarge;
@property (strong, nonatomic)NSMutableArray *flickrPhotosUrls;
@property (strong, nonatomic)NSIndexPath *selectedIndexPath;
@property (strong, nonatomic)UIActivityIndicatorView *activityIndicator;




@end



@implementation PhotosViewController


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self downloadFlickrData];
    
    [self.collectionView reloadData];
    
    [self.collectionView layoutIfNeeded];
    
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    self.title = NSLocalizedString(@"Photos of the Park", nil);
  
    [self revealMenuInit];
  

    
    
    
    
    
}




// -(void)viewWillAppear:(BOOL)animated

//{
    
  
 //   [self flickerInit];
    
 //   NSLog(@"photoTitle 2 : %@\n\n", self.flickrPhotosTitle);
   
    
// }

-(void)revealMenuInit
{
    
    SWRevealViewController *revealController = [self revealViewController];
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
   
    UIBarButtonItem *revealButtonIteam = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reveal-icon.png"] style:UIBarButtonItemStylePlain target:revealController action:@selector(revealToggle:)];
    
    self.navigationItem.leftBarButtonItem = revealButtonIteam;

    
}


-(void)downloadFlickrData

{

     [self.activityIndicator startAnimating];
    
    
    
    FlickrAPIHelper *flickrAPIHelper = [[FlickrAPIHelper alloc] init];
    
    //Use blocks
    
    [flickrAPIHelper flickrPhotosWithCompletionBlock:^(NSData *resultData) {
       
        //Create flickr download parser
        FlickrParser *parser = [[FlickrParser alloc] init];
        
        //pass NSData to it from the APIHelper
        
        FlickrModel2 *flickrPhotos = [parser flickrPhotosWithData:resultData];
        
        self.flickrPhotosTitle = flickrPhotos.photoTitles;
        self.flickrPhotosImageSmall = flickrPhotos.photoSmallImageData;
      //  self.flickrPhotosImageLarge = flickrPhotos.photoURLsLargeImage;
        
        NSLog(@" data check from downloadFlickrData method %@",self.flickrPhotosTitle);
        
         [self.collectionView reloadData];
        
         [self.activityIndicator stopAnimating];
        
    }];
    

    
}



//-(void)flickerInit
//{
//    
// 
//    
//    
//    FlickrModel *flickerinfo = [[FlickrModel alloc] init];
//    
//    
//    
//    [flickerinfo searchFlickrPhotos];
//
//    self.flickrPhotosTitle = flickerinfo.photoTitles;
//    self.flickrPhotosImageSmall = flickerinfo.photoSmallImageData;
//    self.flickrPhotosImageLarge = flickerinfo.photoURLsLargeImage;
//    
//    
//}

#pragma mark Datasource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return 1;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    
 if([self.flickrPhotosTitle count])
 {
        return [self.flickrPhotosTitle count];
   
}

    return 0;

    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    PhotosCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PHOTOCELL" forIndexPath:indexPath];
    
   
    
    cell.layer.shouldRasterize = YES;
    cell.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    
  
    
    cell.photoName.text = [self.flickrPhotosTitle objectAtIndex:indexPath.row];
    
    
    NSData *imageData = [self.flickrPhotosImageSmall objectAtIndex:indexPath.row];
    cell.parkPhoto.image = [UIImage imageWithData:imageData];
        
    NSLog(@"uicollectionview 5: %@",cell.parkPhoto.image);
    
    
    
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
