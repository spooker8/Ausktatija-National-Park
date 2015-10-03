//
//  NationalParkMapViewController.m
//  Ausktatija National Park
//
//  Created by Anand Kumar on 8/31/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "NationalParkMapViewController.h"
#import "SWRevealViewController.h"

@interface NationalParkMapViewController ()

@end

@implementation NationalParkMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.title = NSLocalizedString(@"National Park Map", nil);
    
    [self revealMenuInit];
    

    
    
}



-(void)revealMenuInit
{
    
    SWRevealViewController *revealController = [self revealViewController];
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    
    UIBarButtonItem *revealButtonIteam = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reveal-icon.png"] style:UIBarButtonItemStylePlain target:revealController action:@selector(revealToggle:)];
    
    self.navigationItem.leftBarButtonItem = revealButtonIteam;
    
    
}



- (IBAction)imageMapButtonItemPressed:(id)sender {
    
    [self performSegueWithIdentifier:@"imagemapsegue" sender:nil];
    
    
}

- (IBAction)GPSMapButtonItemPressed:(id)sender {
    
    [self performSegueWithIdentifier:@"gpsmapsegue" sender:nil];
    
    
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
