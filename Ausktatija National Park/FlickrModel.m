//
//  FlickrModel.m
//  Ausktatija National Park
//
//  Created by Anand Kumar on 8/6/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "FlickrModel.h"
#import "PhotosCollectionViewCell.h"


@implementation FlickrModel



-(instancetype)initWithphotoNames:(NSMutableArray*)photoTitles
          WithphotoSmallImageData:(NSMutableArray*)photoSmallImageData
          photoURLsLargeImageData:(NSMutableArray*)photoURLsLargeImage
                    WithphotoURLs:(NSMutableArray*)photoURLs


{
    self = [super init];
    if(self)
        
    {
        // Initialize our arrays
        photoTitles = [[NSMutableArray alloc] initWithArray:self.photoTitles];
        photoSmallImageData = [[NSMutableArray alloc] initWithArray:self.photoSmallImageData];
        photoURLsLargeImage = [[NSMutableArray alloc] initWithArray:self.photoURLsLargeImage];
        photoURLs= [[NSMutableArray alloc] initWithArray:self.photoURLs];
        
        
      [self searchFlickrPhotos];
    }
    
    return self;

    
    
    
}


NSString *const FlickrAPIKey = @"5cc923d34e732dab392d7cb0285acf31";


//-(void)loadFlickrPhotos
//
//{
//    
//    // 1. Build your Flickr API request w/Flickr API key in FlickrAPIKey.h
//    NSString *urlString = [NSString stringWithFormat:@"https://api.flickr.com/services/rest/?format=json&method=flickr.photos.search&tags=%@&tag_mode=all&sort=date-taken-desc&api_key=%@&per_page=10&format=json&nojsoncallback=1", @"ignalina" ,FlickrAPIKey];
//    NSURL *url = [NSURL URLWithString:urlString];
//    
//    
//    // 2. Get URLResponse string & parse JSON to Foundation objects.
//    NSData *jsonData = [NSData dataWithContentsOfURL:url];
//    NSError *error = nil;
//    NSDictionary *results = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
//    
//    
//    
//    
////    NSString *jsonString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
// //   NSDictionary *results = [jsonString JSONValue];
////
////    
//    // 3. Pick thru results and build our arrays
//    NSArray *photos = [[results objectForKey:@"photos"] objectForKey:@"photo"];
//    for (NSDictionary *photo in photos) {
//    
//        
//        // 3.a Get title for the photo
//        NSString *title = [photo objectForKey:@"title"];
//        [_photoTitles addObject:(title.length > 0 ? title : @"Untitled")];
//        
//        
//        // 3.b Construct URL for e/ photo.
//        NSString *photoURLString = [NSString stringWithFormat:@"http://farm%@.static.flickr.com/%@/%@_%@_s.jpg", [photo objectForKey:@"farm"], [photo objectForKey:@"server"], [photo objectForKey:@"id"], [photo objectForKey:@"secret"]];
//        [_photoURLs addObject:[NSURL URLWithString:photoURLString]];
//        NSLog(@"photo url %@", photoURLString);
//    }
//    
//     
//    

//}

-(void)searchFlickrPhotos

{
    
   
  
        // Build the string to call the Flickr API
    NSString *urlString = [NSString stringWithFormat:@"https://api.flickr.com/services/rest/?format=json&method=flickr.photos.search&tags=%@&tag_mode=all&sort=date-taken-desc&api_key=%@&per_page=10&format=json&nojsoncallback=1", @"ignalina" ,FlickrAPIKey];
   
    
    

    
    // Create NSURL string from formatted string
     NSURL *url = [NSURL URLWithString:urlString];
    
   //    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
    
    
    
    // 2. Get URLResponse string & parse JSON to Foundation objects.
    NSData *jsonData = [NSData dataWithContentsOfURL:url options:NSUTF8StringEncoding error:nil];
           
    
  //  dispatch_async(dispatch_get_main_queue(), ^{
   
           
   NSError *error = nil;
    NSDictionary *results = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers  error:&error];

        
       
    // Store incoming data into a string
  // NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    // Create a dictionary from the JSON string
  //  NSDictionary *results = [jsonString SBJson];
    
    // Build an array from the dictionary for easy access to each entry
    NSArray *photos = [[results objectForKey:@"photos"] objectForKey:@"photo"];
    
       
    // Loop through each entry in the dictionary...
    for (NSDictionary *photo in photos)
    {
        // Get title of the image
        NSString *title = [photo objectForKey:@"title"];
    //    NSLog(@"%@",title);
        
        // Save the title to the photo titles array
     
        
        [self.photoTitles addObject:(title.length > 0 ? title : @"Untitled")];
        
        
        
     //   NSLog(@"title:%@",self.photoTitles);
        
        // Build the URL to where the image is stored (see the Flickr API)
        // In the format http://farmX.static.flickr.com/server/id_secret.jpg
        // Notice the "_s" which requests a "small" image 75 x 75 pixels
        NSString *photoURLString =
        [NSString stringWithFormat:@"http://farm%@.static.flickr.com/%@/%@_%@_s.jpg",
         [photo objectForKey:@"farm"], [photo objectForKey:@"server"],
         [photo objectForKey:@"id"], [photo objectForKey:@"secret"]];
        
        
     //  NSLog(@"photoURLString: %@", photoURLString);
        
        // The performance (scrolling) of the table will be much better if we
        // build an array of the image data here, and then add this data as
        // the cell.image value (see cellForRowAtIndexPath:)
        [self.photoSmallImageData addObject:[NSData dataWithContentsOfURL:[NSURL URLWithString:photoURLString]]];
        
      
 
        
        // Build and save the URL to the large image so we can zoom
        // in on the image if requested
        photoURLString =
        [NSString stringWithFormat:@"http://farm%@.static.flickr.com/%@/%@_%@_z.jpg",
         [photo objectForKey:@"farm"], [photo objectForKey:@"server"],
         [photo objectForKey:@"id"], [photo objectForKey:@"secret"]];
        [self.photoURLsLargeImage addObject:[NSURL URLWithString:photoURLString]];
        
        
        
  
           
            self.photoTitles = [[NSMutableArray alloc] initWithArray:self.photoTitles copyItems:NO];
            
            self.photoSmallImageData = [[NSMutableArray alloc ]initWithArray:self.photoSmallImageData];
            
            self.photoURLsLargeImage = [[NSMutableArray alloc] initWithArray:self.photoURLsLargeImage];
            
        
      
        
       
        
        
       NSLog(@"photoURLsLareImage 1 : %@\n\n", photoURLString);
        
      
  }
    
        
 //   });
           
  //     });
    
    
    
}

@end
