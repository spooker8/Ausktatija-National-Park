//
//  PopularLakesViewController.m
//  Ausktatija National Park
//
//  Created by Anand Kumar on 8/3/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "PopularLakesViewController.h"
#import "SWRevealViewController.h"

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
