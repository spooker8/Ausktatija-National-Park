//
//  PlistToModelConverter.m
//  Ausktatija National Park
//
//  Created by Anand Kumar on 8/5/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "PlistToModelConverter.h"
#import "PopularLakesModel.h"

#define kKeyLakeName    @"Name"
#define kKeyImage       @"Image"
#define kKeySize        @"Size"
#define kKeyDepth       @"Depth"


@implementation PlistToModelConverter

+(NSArray*)convertPopularLakesPlistToPopularLakesArray
{
    
    NSArray *popularLakesArrayFromFile = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]
                                pathForResource:@"PopularLakes" ofType:@"plist"]];
                                  
    
    NSMutableArray *popularLakesArray = [[NSMutableArray alloc] init];
    
    for(NSDictionary *showDict in popularLakesArrayFromFile)
        
    {
        
        NSString *lakeName = showDict[kKeyLakeName];
        NSString *lakeImage = showDict[kKeyImage];
        NSString *lakeSize = showDict[kKeySize];
        NSString *lakeDepth =showDict[kKeyDepth];
    
    
        PopularLakesModel *popularLakes = [[PopularLakesModel alloc] initWithName:lakeName WithImage:lakeImage WithSize:lakeSize WithDepth:lakeDepth];
        
        [popularLakesArray addObject:popularLakes];
    }
    
    return popularLakesArray;
}


@end
