//
//  PopularLakesDetailViewController.m
//  Ausktatija National Park
//
//  Created by Anand Kumar on 8/5/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "PopularLakesDetailViewController.h"
#import "PopularLakesViewController.h"
#import "SWRevealViewController.h"
#import "PopularLakesModel.h"
#import "PlistToModelConverter.h"
#import "PopularLakesViewController.h"



@interface PopularLakesDetailViewController ()

@end

@implementation PopularLakesDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.lakeImage.image = [UIImage imageNamed:self.lakeInfo.image];
    self.lakeName.text = self.lakeInfo.name;
    self.lakeSize.text = self.lakeInfo.size;
    self.lakeDepth.text = self.lakeInfo.depth;
    
    
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
