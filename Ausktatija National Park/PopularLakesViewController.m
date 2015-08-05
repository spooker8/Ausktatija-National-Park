//
//  PopularLakesViewController.m
//  Ausktatija National Park
//
//  Created by Anand Kumar on 8/3/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "PopularLakesViewController.h"
#import "SWRevealViewController.h"
#import "PopularLakesModel.h"
#import "PlistToModelConverter.h"
#import "PopularLakesCollectionViewCollectionViewCell.h"


@interface PopularLakesViewController ()  <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic)NSArray *lakes;
@property (strong, nonatomic)NSIndexPath *selectedIndexPath;



@end

@implementation PopularLakesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.title = NSLocalizedString(@"Popular Lakes", nil);
    
    SWRevealViewController *revealController = [self revealViewController];
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    // [self.navigationController.navigationBar addGestureRecognizer:revealController.panGestureRecognizer];
    
    UIBarButtonItem *revealButtonIteam = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reveal-icon.png"] style:UIBarButtonItemStylePlain target:revealController action:@selector(revealToggle:)];
    
    self.navigationItem.leftBarButtonItem = revealButtonIteam;
    
    self.lakes = [PlistToModelConverter convertPopularLakesPlistToPopularLakesArray];
    NSLog(@"loading");

    
}

#pragma mark Datasource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return 1;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
   
    return self.lakes.count;r
    
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    

    PopularLakesCollectionViewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LakeCell" forIndexPath:indexPath];
    
    
    PopularLakesModel *lakes = self.lakes[indexPath.section];
    cell.lakeName.text = lakes.name;
    NSLog(@"Lake Name %@",lakes.name);
    cell.lakeImage.image = [UIImage imageNamed:lakes.image];
   
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
