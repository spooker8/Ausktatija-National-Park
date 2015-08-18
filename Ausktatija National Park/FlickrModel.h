//
//  FlickrModel.h
//  Ausktatija National Park
//
//  Created by Anand Kumar on 8/6/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FlickrModel : NSObject


@property (strong, nonatomic) NSMutableArray *photoTitles;  //image title
@property (strong, nonatomic) NSMutableArray *photoSmallImageData; //image thumbnail
@property (strong, nonatomic) NSMutableArray *photoURLsLargeImage; //large image
@property (strong, nonatomic) NSMutableArray *photoURLs; //URL to large image

@property (strong, nonatomic) NSMutableArray *allFlickrArray; 


-(instancetype)initWithphotoNames:(NSMutableArray*)photoTitles
          WithphotoSmallImageData:(NSMutableArray*)photoSmallImageData
          photoURLsLargeImageData:(NSMutableArray*)photoURLsLargeImage
                    WithphotoURLs:(NSMutableArray*)photoURLs;


//-(void)loadFlickrPhotos;
-(void)searchFlickrPhotos;




@end
