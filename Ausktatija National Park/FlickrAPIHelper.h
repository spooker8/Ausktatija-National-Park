//
//  FlickrAPIHelper.h
//  Ausktatija National Park
//
//  Created by Anand Kumar on 8/25/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlickrAPIHelper : NSObject


-(void)flickrPhotosWithCompletionBlock:(void (^)(NSData *resultData))completionBlock;



@end
