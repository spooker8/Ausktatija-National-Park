//
//  FlickrAPIHelper.m
//  Ausktatija National Park
//
//  Created by Anand Kumar on 8/25/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "FlickrAPIHelper.h"

@implementation FlickrAPIHelper

NSString *const FlickrAPIKey = @"5cc923d34e732dab392d7cb0285acf31";

-(void)flickrPhotosWithCompletionBlock:(void (^)(NSData *resultData))completionBlock
{
    
    // Build the string to call the Flickr API
    NSString *urlString = [NSString stringWithFormat:@"https://api.flickr.com/services/rest/?format=json&method=flickr.photos.search&tags=%@&tag_mode=all&sort=date-taken-desc&api_key=%@&per_page=10&format=json&nojsoncallback=1", @"ignalina" ,FlickrAPIKey];
    
    
    // Create NSURL string from formatted string
    NSURL *url = [NSURL URLWithString:urlString];
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSHTTPURLResponse *HTTPResponce = (NSHTTPURLResponse *)response;
        
        //Minimum checking of error conditions
        if(HTTPResponce.statusCode == 200){
            if(!error){
                
                completionBlock(data);
                
            }else{
                
                NSAssert(NO, @"Error retrieving data");
                
            }
        }else{
            
            NSAssert(NO, @"Server data error");
            
        }
        
    }] resume];
    

    

    
    
}





@end
