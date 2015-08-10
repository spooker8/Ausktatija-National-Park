//
//  FlickrModel.m
//  Ausktatija National Park
//
//  Created by Anand Kumar on 8/6/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "FlickrModel.h"
#import "PhotosCollectionViewCell.h"
#import "JSON/JSON.h"


@implementation FlickrModel


-(instancetype)initWithphotoNames:(NSMutableArray*)photoNames
          WithphotoSmallImageData:(NSMutableArray*)photoSmallImageData
                    WithphotoURLs:(NSMutableArray*)photoURLs


{
    self = [super init];
    if(self)
        
    {
        // Initialize our arrays
        photoNames = [[NSMutableArray alloc] init];
        photoSmallImageData = [[NSMutableArray alloc] init];
        photoURLs= [[NSMutableArray alloc] init];
        
        [self loadFlickrPhotos];
        
    }
    
    return self;

    
    
    
}


NSString *const FlickrAPIKey = @"5cc923d34e732dab392d7cb0285acf31";


-(void)loadFlickrPhotos

{
    
    // 1. Build your Flickr API request w/Flickr API key in FlickrAPIKey.h
    NSString *urlString = [NSString stringWithFormat:@"http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=%@&tags=%@&per_page=10&format=json&nojsoncallback=1", FlickrAPIKey, @"mayan2012"];
    NSURL *url = [NSURL URLWithString:urlString];
    
    
    // 2. Get URLResponse string & parse JSON to Foundation objects.
    NSString *jsonString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSDictionary *results = [jsonString JSONValue];
    
    
    // 3. Pick thru results and build our arrays
    NSArray *photos = [[results objectForKey:@"photos"] objectForKey:@"photo"];
    for (NSDictionary *photo in photos) {
    
        
        // 3.a Get title for e/ photo
        NSString *title = [photo objectForKey:@"title"];
        [_photoNames addObject:(title.length > 0 ? title : @"Untitled")];
        
        
        // 3.b Construct URL for e/ photo.
        NSString *photoURLString = [NSString stringWithFormat:@"http://farm%@.static.flickr.com/%@/%@_%@_s.jpg", [photo objectForKey:@"farm"], [photo objectForKey:@"server"], [photo objectForKey:@"id"], [photo objectForKey:@"secret"]];
        [_photoURLs addObject:[NSURL URLWithString:photoURLString]];
    }
    
    
    
    
    
}



@end
