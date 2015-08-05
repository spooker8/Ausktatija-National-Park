//
//  PopularLakesModel.h
//  Ausktatija National Park
//
//  Created by Anand Kumar on 8/5/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PopularLakesModel : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *image;
@property (strong, nonatomic) NSString *size;
@property (strong, nonatomic) NSString *depth;

-(instancetype)initWithName:(NSString*)name
                  WithImage:(NSString*)image
                   WithSize:(NSString*)size
                  WithDepth:(NSString*)depth;


@end
