//
//  Image.h
//  InstaKilo
//
//  Created by Alex on 2015-11-04.
//  Copyright © 2015 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Image : NSObject

@property (nonatomic) NSString *location;
@property (nonatomic) NSString *category;
@property (nonatomic) UIImage *image;

+ (NSMutableArray *)getAllImages;

- (instancetype)initWithLocation:(NSString *)location andCategory:(NSString *)category andImage:(UIImage *)image;

+ (NSMutableArray *)sortImagesByLocation:(NSMutableArray *)images;
+ (NSMutableArray *)sortImagesByCategory:(NSMutableArray *)images;

@end
