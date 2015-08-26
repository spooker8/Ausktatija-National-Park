//
//  FlickrImageDownloader.m
//  Ausktatija National Park
//
//  Created by Anand Kumar on 8/25/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "FlickrImageDownloader.h"

@implementation FlickrImageDownloader


+(void)imageWithURL:(NSString *)url completionBlock:(void (^)(UIImage *image))completionBlock

{
    
    dispatch_queue_t download = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(download, ^{
        
        NSURL *urlDownload = [NSURL URLWithString:url];
        NSData *imageData = [NSData dataWithContentsOfURL:urlDownload];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            UIImage *image = [UIImage imageWithData:imageData];
            completionBlock(image);
            
            
        });
        
        
    });

    
    
    
}




@end
