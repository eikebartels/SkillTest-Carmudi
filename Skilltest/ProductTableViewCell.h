//
//  ProductTableViewCell.h
//  Skilltest
//
//  Created by Eike Bartels on 1/06/2015.
//  Copyright (c) 2015 Eike Bartels. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLb;
@property (weak, nonatomic) IBOutlet UILabel *priceLb;
@property (weak, nonatomic) IBOutlet UILabel *brandLb;
@property (weak, nonatomic) IBOutlet UIImageView *logoIV;

@end
