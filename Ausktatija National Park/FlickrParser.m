//
//  FlickrParser.m
//  Ausktatija National Park
//
//  Created by Anand Kumar on 8/25/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "FlickrParser.h"
#import "FlickrModel2.h"



@implementation FlickrParser



-(FlickrModel2 *)flickrPhotosWithData:(NSData *)flickrData

{
    
    NSError *error;
    
    NSDictionary *results = [NSJSONSerialization JSONObjectWithData:flickrData options:kNilOptions  error:&error];
    
    
    
    // Build an array from the dictionary for easy access to each entry
    
     FlickrModel2 *flickrModel2Instance = [[FlickrModel2 alloc]init];
   
    
    NSArray *photos = [[results objectForKey:@"photos"] objectForKey:@"photo"];
    
  //  NSLog(@"Photos in the array : %@",photos);
    
    // Loop through each entry in the dictionary...
    for (NSDictionary *photo in photos)
    {
        // Get title of the image
        NSString *title = [photo objectForKey:@"title"];
     
        
        // Save the title to the photo titles array
        
        [self.photoTitles addObject:(title.length > 0 ? title : @"Untitled")];
        
        self.photoTitles = [[NSMutableArray alloc ] initWithArray:self.photoTitles];
        
        flickrModel2Instance.photoTitles = self.photoTitles;
     //    NSLog(@"Title test : %@",flickrModel2Instance.photoTitles);
        
     
        // Build the URL to where the image is stored (see the Flickr API)
        // In the format http://farmX.static.flickr.com/server/id_secret.jpg
        // Notice the "_s" which requests a "small" image 75 x 75 pixels
        NSString *photoURLString =
        [NSString stringWithFormat:@"http://farm%@.static.flickr.com/%@/%@_%@_s.jpg",
         [photo objectForKey:@"farm"], [photo objectForKey:@"server"],
         [photo objectForKey:@"id"], [photo objectForKey:@"secret"]];
        
   
      
        
        // The performance (scrolling) of the table will be much better if we
        // build an array of the image data here, and then add this data as
        // the cell.image value (see cellForRowAtIndexPath:)
    
         [self.photoSmallImageData addObject:[NSData dataWithContentsOfURL:[NSURL URLWithString:photoURLString]]];
        
        self.photoSmallImageData = [[NSMutableArray alloc ]initWithArray:self.photoSmallImageData];
        
        flickrModel2Instance.photoSmallImageData = self.photoSmallImageData;

        
        // Build and save the URL to the large image so we can zoom
        // in on the image if requested
        photoURLString =
        [NSString stringWithFormat:@"http://farm%@.static.flickr.com/%@/%@_%@_z.jpg",
         [photo objectForKey:@"farm"], [photo objectForKey:@"server"],
         [photo objectForKey:@"id"], [photo objectForKey:@"secret"]];
      
          [self.photoURLsLargeImage addObject:[NSURL URLWithString:photoURLString]];
        
        
            self.photoURLsLargeImage = [[NSMutableArray alloc] initWithArray:self.photoURLsLargeImage];
      
            flickrModel2Instance.photoURLsLargeImage = self.photoURLsLargeImage;
    
    
    }

    return flickrModel2Instance;
    
}




@end
