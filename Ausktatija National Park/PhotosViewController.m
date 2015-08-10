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

@property (strong, nonatomic)NSArray *photos;
@property (strong, nonatomic)NSIndexPath *selectedIndexPath;


@end

@implementation PhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = NSLocalizedString(@"Photos of the Park", nil);
    
    SWRevealViewController *revealController = [self revealViewController];
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    // [self.navigationController.navigationBar addGestureRecognizer:revealController.panGestureRecognizer];
    
    UIBarButtonItem *revealButtonIteam = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reveal-icon.png"] style:UIBarButtonItemStylePlain target:revealController action:@selector(revealToggle:)];
    
    self.navigationItem.leftBarButtonItem = revealButtonIteam;
    
    
   
    
    
}


#pragma mark Datasource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return 1;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    FlickrModel *flickArray = [[FlickrModel alloc] init];
    return [flickArray.photoNames count];
  
    
    
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    PhotosCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PHOTOCELL" forIndexPath:indexPath];
    
    
    FlickrModel *lakes = self.photos[indexPath.row];
    cell.photoName.text = photo
    
    cell.parkPhoto.image = [UIImage imageNamed:pho.image];
    
    return cell;
}

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndexPath = indexPath;
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    return YES;
    
    
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
