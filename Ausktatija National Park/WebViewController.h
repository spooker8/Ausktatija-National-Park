//
//  WebViewController.h
//  Ausktatija National Park
//
//  Created by Anand Kumar on 8/4/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController <UIWebViewDelegate>
{
    
    UIWebView *webView;
  //  NSString *websiteURL;
    
    
}



@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property (weak, nonatomic) NSString *websiteURL;



@end
