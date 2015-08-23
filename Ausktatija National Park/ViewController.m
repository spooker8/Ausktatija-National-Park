//
//  ViewController.m
//  Ausktatija National Park
//
//  Created by Anand Kumar on 7/28/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"
#import "InternetCheck.h"


@interface ViewController ()

{
    Reachability *internetReachableFoo;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _barButton.target = self.revealViewController;
    _barButton.action = @selector(revealToggle:);

    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    [self testInternetConnection];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}



// Checks if we have an internet connection or not
- (void)testInternetConnection
{
    internetReachableFoo = [Reachability reachabilityWithHostname:@"www.google.com"];
    
    // Internet is reachable
    internetReachableFoo.reachableBlock = ^(Reachability*reach)
    {
        // Update the UI on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Yayyy, we have the interwebs!");
        });
    };
    
    // Internet is not reachable
    internetReachableFoo.unreachableBlock = ^(Reachability*reach)
    {
        // Update the UI on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Someone broke the internet :(");
        });
    };
    
    [internetReachableFoo startNotifier];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
