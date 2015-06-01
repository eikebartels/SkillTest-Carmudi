//
//  ProductTableViewController.m
//  Skilltest
//
//  Created by Eike Bartels on 1/06/2015.
//  Copyright (c) 2015 Eike Bartels. All rights reserved.
//

#import "ProductTableViewController.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"

#import <MagicalRecord/CoreData+MagicalRecord.h>

#import "Product.h"
#import "ProductTableViewCell.h"

@interface ProductTableViewController ()

@property (nonatomic,strong) NSArray * data;

@end

@implementation ProductTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchProducts:^(NSArray *products) {
        self.data = products;
        [self.tableView reloadData];
        
    }];
    
}

/// Fetch All Products
- (void)fetchProducts:(void (^)(NSArray* products))finished {
    // fetch and get back cached products
    NSArray * cachedProducts = [Product MR_findAll];
    finished(cachedProducts);
    
    [[AFHTTPRequestOperationManager manager] GET:@"https://www.carmudi.com.bd/api/cars/" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSManagedObjectContext * context = [NSManagedObjectContext MR_context];
        for (id product in [[responseObject objectForKey:@"metadata"] objectForKey:@"results"]){
            [Product createIfNotExistFromDic:product inContext:context];
        }

        [context MR_saveToPersistentStoreAndWait];
        finished([Product MR_findAll]);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        finished([Product MR_findAll]);
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Product * p = [self.data objectAtIndex:indexPath.row];
    
    ProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductCell" forIndexPath:indexPath];
    cell.nameLb.text = p.name;
    cell.priceLb.text = p.price;
    cell.brandLb.text = p.brand;
    
    /// If image exist load in IV if not download and save to data storage
    if(p.image){
        cell.logoIV.image = p.image;
    }else{
        [cell.logoIV setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:p.imageUrl]] placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
            
            cell.logoIV.image = image;
            [cell setNeedsLayout];
            
            p.image = image;
            [p.managedObjectContext MR_saveToPersistentStoreWithCompletion:nil];
            
        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
            
        }];
    
    }
    
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
