//
//  Image.m
//  InstaKilo
//
//  Created by Alex on 2015-11-04.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "Image.h"

@implementation Image

+(NSMutableArray *)getAllImages
{
    Image *image1 = [[Image alloc] initWithLocation:@"Canada" andCategory:@"My Self" andImage:[UIImage imageNamed:@"alexCutNose"]];
    Image *image2 = [[Image alloc] initWithLocation:@"Canada" andCategory:@"My Self" andImage:[UIImage imageNamed:@"alexInTheSaltFlats"]];
    Image *image3 = [[Image alloc] initWithLocation:@"USA" andCategory:@"My Self" andImage:[UIImage imageNamed:@"alexInWinter"]];
    Image *image4 = [[Image alloc] initWithLocation:@"Canada" andCategory:@"My Self" andImage:[UIImage imageNamed:@"tiredAlex"]];
    Image *image5 = [[Image alloc] initWithLocation:@"Mexico" andCategory:@"My Self" andImage:[UIImage imageNamed:@"guitarAndNiece"]];
    Image *image6 = [[Image alloc] initWithLocation:@"Mexico" andCategory:@"My Friends" andImage:[UIImage imageNamed:@"friendsInBolivia"]];
    Image *image7 = [[Image alloc] initWithLocation:@"Canada" andCategory:@"My Friends" andImage:[UIImage imageNamed:@"shoeShiner"]];
    Image *image8 = [[Image alloc] initWithLocation:@"Zimbabwe" andCategory:@"My Friends" andImage:[UIImage imageNamed:@"Timo"]];
    Image *image9 = [[Image alloc] initWithLocation:@"Canada" andCategory:@"My Dog" andImage:[UIImage imageNamed:@"fuzzyKirby"]];
    Image *image10 = [[Image alloc] initWithLocation:@"USA" andCategory:@"My Dog" andImage:[UIImage imageNamed:@"Kirby"]];

    NSMutableArray *allImages = [@[image1, image2, image3, image4, image5, image6, image7, image8, image9, image10] mutableCopy];

    return allImages;
}


- (instancetype)initWithLocation:(NSString *)location andCategory:(NSString *)category andImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        _location = location;
        _category = category;
        _image = image;
    }
    return self;
}

+ (NSMutableArray *)sortImagesByLocation:(NSMutableArray *)images
{
    
    NSMutableArray *sortedDictionaryOfImages = [NSMutableArray new];
    NSDictionary *categoryAndImages = [NSDictionary new];
    NSMutableArray *categories = [NSMutableArray new];
    
    //find and store all categories
    for (Image *image in images) {
        if (![categories containsObject:image.location]) {
            [categories addObject:image.location];
        }
    }
    
    //find corresponding images for each location, story in array, add location/images to dictionary, add to sorted array
    for (NSString *category in categories) {
        NSMutableArray *filteredImages = [NSMutableArray new];
        for (Image *image in images) {
            if ([image.location isEqualToString:category]) {
                [filteredImages addObject:image.image];
            }
        }
        categoryAndImages = @{@"location":category, @"images":filteredImages};
        [sortedDictionaryOfImages addObject:categoryAndImages];
    }
    
    return sortedDictionaryOfImages;
    
}

+ (NSMutableArray *)sortImagesByCategory:(NSMutableArray *)images
{
    
    NSMutableArray *sortedDictionaryOfImages = [NSMutableArray new];
    NSDictionary *categoryAndImages = [NSDictionary new];
    NSMutableArray *categories = [NSMutableArray new];
    
    //find and store all categories
    for (Image *image in images) {
        if (![categories containsObject:image.category]) {
            [categories addObject:image.category];
        }
    }
    
    //find corresponding images for each location, story in array, add location/images to dictionary, add to sorted array
    for (NSString *category in categories) {
        NSMutableArray *filteredImages = [NSMutableArray new];
        for (Image *image in images) {
            if ([image.category isEqualToString:category]) {
                [filteredImages addObject:image.image];
            }
        }
        categoryAndImages = @{@"category":category, @"images":filteredImages};
        [sortedDictionaryOfImages addObject:categoryAndImages];
    }
    
    return sortedDictionaryOfImages;
    
}

@end
