#import "Product.h"
#import <MagicalRecord/CoreData+MagicalRecord.h>

@interface Product ()

// Private interface goes here.

@end

@implementation Product

+ (Product *) createIfNotExistFromDic:(NSDictionary*)dic inContext:(NSManagedObjectContext*)context{
    Product * p = [Product MR_findFirstByAttribute:@"uid" withValue:[dic objectForKey:@"id"] inContext:context];
    if (!p) {
        p = [Product MR_createInContext:context];
    }
    
    p.uid = [dic objectForKey:@"id"];
    p.name = [[dic objectForKey:@"data"] objectForKey:@"name"];
    p.price = [[dic objectForKey:@"data"] objectForKey:@"price"];
    p.brand = [[dic objectForKey:@"data"] objectForKey:@"brand"];
    p.imageUrl = [[[dic objectForKey:@"images"] firstObject] objectForKey:@"url"];
    
    return p;
}

@end
