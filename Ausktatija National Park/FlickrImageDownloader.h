//
//  FlickrImageDownloader.h
//  Ausktatija National Park
//
//  Created by Anand Kumar on 8/25/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FlickrImageDownloader : NSObject



+(void)imageWithURL:(NSString *)url completionBlock:(void (^)(UIImage *image))completionBlock;



@end
