//
//  FlickrModel.h
//  Ausktatija National Park
//
//  Created by Anand Kumar on 8/6/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FlickrModel : NSObject


@property (strong, nonatomic) NSMutableArray *photoNames;  //image title
@property (strong, nonatomic) NSMutableArray *photoSmallImageData; //image thumbnail
@property (strong, nonatomic) NSMutableArray *photoURLs; //URL to large image


-(instancetype)initWithphotoNames:(NSMutableArray*)photoNames
          WithphotoSmallImageData:(NSMutableArray*)photoSmallImageData
                    WithphotoURLs:(NSMutableArray*)photoURLs;


-(void)loadFlickrPhotos;



@end
