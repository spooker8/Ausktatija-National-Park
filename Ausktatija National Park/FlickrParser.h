//
//  FlickrParser.h
//  Ausktatija National Park
//
//  Created by Anand Kumar on 8/25/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FlickrModel2;

@interface FlickrParser : NSObject

@property (strong, nonatomic) NSMutableArray *photoTitles;  //image title
@property (strong, nonatomic) NSMutableArray *photoSmallImageData; //image thumbnail
@property (strong, nonatomic) NSMutableArray *photoURLsLargeImage; //large image
@property (strong, nonatomic) NSMutableArray *photoURLs; //URL to large image



-(FlickrModel2 *)flickrPhotosWithData:(NSData *)flickrData;



@end
