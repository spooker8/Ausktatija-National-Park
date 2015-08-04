//
//  WebViewController.h
//  Ausktatija National Park
//
//  Created by Anand Kumar on 8/4/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HowToGetThereViewController.h"

@interface WebViewController : UIViewController <UIWebViewDelegate>
{
    
      IBOutlet UIWebView *webView;
                UIView *loadingView;
    
    
 //   NSString *websiteURL;
    
    
}


    
@property (weak, nonatomic) NSString *websiteURL;



@end
