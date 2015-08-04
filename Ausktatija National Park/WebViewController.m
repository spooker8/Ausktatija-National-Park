//
//  WebViewController.m
//  Ausktatija National Park
//
//  Created by Anand Kumar on 8/4/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "WebViewController.h"
#import "HowToGetThereViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

@synthesize websiteURL;

- (void)viewDidLoad {
    [super viewDidLoad];

   [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:websiteURL]]];
    
   
    
    NSLog(@"url: %@",websiteURL);
    
    
    //    NSString *urlString = @"http://www.yahoo.com";
    //    NSURL *url = [NSURL URLWithString:urlString];
    //    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    //    [webView loadRequest:urlRequest];
    
    
    
    // Do any additional setup after loading the view.
}


-(void)webViewDidStartLoad:(UIWebView *)webView
{
    
    NSLog(@"page is loading");
    
}


-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    NSLog(@"finished loading");
    
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
