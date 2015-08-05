//
//  PopularLakesDetailViewController.h
//  Ausktatija National Park
//
//  Created by Anand Kumar on 8/5/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "ViewController.h"
#import "PopularLakesModel.h"

@interface PopularLakesDetailViewController : ViewController

@property (strong, nonatomic)PopularLakesModel *lakeInfo;

@property (weak, nonatomic) IBOutlet UIImageView *lakeImage;

@property (weak, nonatomic) IBOutlet UILabel *lakeName;

@property (weak, nonatomic) IBOutlet UILabel *lakeSize;

@property (weak, nonatomic) IBOutlet UILabel *lakeDepth;

@property (weak, nonatomic) IBOutlet UIButton *howToGetThereButton;



@end
