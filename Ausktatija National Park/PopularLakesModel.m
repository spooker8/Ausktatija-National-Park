//
//  PopularLakesModel.m
//  Ausktatija National Park
//
//  Created by Anand Kumar on 8/5/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "PopularLakesModel.h"

@implementation PopularLakesModel


-(instancetype)initWithName:(NSString *)name WithImage:(NSString *)image WithSize:(NSString *)size WithDepth:(NSString *)depth
{
    
    self = [self init];
    if(self)
        
    {
        self.name = name;
        self.image = image;
        self.size = size;
        self.depth = depth;
        
        
    }
    return self;
    
}

@end
