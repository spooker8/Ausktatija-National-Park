//
//  HowToGetThereViewController.m
//  Ausktatija National Park
//
//  Created by Anand Kumar on 8/3/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "HowToGetThereViewController.h"
#import "SWRevealViewController.h"
#import "WebViewController.h"
#import <UIKit/UIKit.h>

#define DRIVING_DIRECTION @"http://www.google.com";
#define BUS_DIRECTION @"http://www.autobusubilietai.lt";
#define TRAIN_DIRECTION @"http://www.yahoo.com";
#define CAR_RENTAL_ADMITTA @"http://www.yahoo.com";
#define CAR_RENTAL_TRUSTICAR @"http://www.yahoo.com";
#define CAR_RENTAL_HERTZ @"http://www.yahoo.com";
#define CAR_RENTAL_GREENMOTION @"http://www.yahoo.com";

@interface HowToGetThereViewController ()

@end

@implementation HowToGetThereViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = NSLocalizedString(@"How to get there", nil);
    
    SWRevealViewController *revealController = [self revealViewController];
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    // [self.navigationController.navigationBar addGestureRecognizer:revealController.panGestureRecognizer];
    
    UIBarButtonItem *revealButtonIteam = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reveal-icon.png"] style:UIBarButtonItemStylePlain target:revealController action:@selector(revealToggle:)];
    
    self.navigationItem.leftBarButtonItem = revealButtonIteam;
    
    

}

- (IBAction)carDrivingDirectionButton:(UIButton *)sender {
    
   // [self performSegueWithIdentifier:@"myIdentifier" sender:sender];
    
    
}



- (IBAction)busWebsiteLinkButton:(UIButton *)sender {
}



- (IBAction)trainWebsiteLinkButton:(id)sender {
    
    
  //  [self performSegueWithIdentifier:@"myIdentifier" sender:sender];
    

    
}



- (IBAction)carRentalAdmittaLinkButton:(id)sender {
    
    
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.yahoo.com"]];
    
    
    
}

- (IBAction)carRentalTrustiCarLinkButton:(id)sender {
    
    
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.yahoo.com"]];
    
    
    
}


- (IBAction)carRentalHertzLinkButton:(id)sender {
    
    
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.yahoo.com"]];
    
    
}


- (IBAction)carRentalGreenMotionLinkButton:(id)sender {
    
    
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.yahoo.com"]];
    
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   
    WebViewController *secondVC = (WebViewController *)segue.destinationViewController;
    
   if ([sender tag] == 100)
        secondVC.websiteURL = DRIVING_DIRECTION;
    
    
    if ([sender tag] == 200)
        secondVC.websiteURL = BUS_DIRECTION;

   
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
