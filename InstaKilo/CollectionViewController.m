//
//  CollectionViewController.m
//  InstaKilo
//
//  Created by Alex on 2015-11-04.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "CollectionViewController.h"
#import "ImageCollectionViewCell.h"
#import "HeaderCollectionReusableView.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Do any additional setup after loading the view.
    
    self.images = [@[
                    @{@"category":@"My Self", @"images": @[[UIImage imageNamed:@"alexCutNose"],
                                                         [UIImage imageNamed:@"alexInTheSaltFlats"],
                                                         [UIImage imageNamed:@"alexInWinter"],
                                                         [UIImage imageNamed:@"tiredAlex"],
                                                         [UIImage imageNamed:@"guitarAndNiece"]]},
    
                    @{@"category":@"My Friends", @"images": @[[UIImage imageNamed:@"friendsInBolivia"],
                                                             [UIImage imageNamed:@"shoeShiner"],
                                                             [UIImage imageNamed:@"Timo"]]},

                    @{@"category":@"My Dog", @"images": @[[UIImage imageNamed:@"fuzzyKirby"],
                                                         [UIImage imageNamed:@"Kirby"]]},

                    ] mutableCopy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return [self.images count];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    NSDictionary *category = self.images[section];
    
    NSArray *images = [category objectForKey:@"images"];
    
    return [images count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    NSDictionary *category = self.images[indexPath.section];
    NSArray *images = [category objectForKey:@"images"];
    
    cell.photoView.image = images[indexPath.item];
    
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionHeader) {
        
        HeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        
        NSDictionary *category = self.images[indexPath.section];
        NSString *categoryName = [category objectForKey:@"category"];
        
        headerView.headerLabel.text = [NSString stringWithFormat:@"%@", categoryName];
        
        return headerView;
    }
    
    return nil;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
