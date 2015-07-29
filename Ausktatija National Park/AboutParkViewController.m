//
//  AboutParkViewController.m
//  Ausktatija National Park
//
//  Created by Anand Kumar on 7/29/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "AboutParkViewController.h"
#import "SWRevealViewController.h"

@interface AboutParkViewController ()

@end

@implementation AboutParkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _barButton.target = self.revealViewController;
    _barButton.action = @selector(revealToggle:);
    
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    
    
    
    // Do any additional setup after loading the view.
    

    
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
