#import "_Product.h"

@interface Product : _Product {}
// Custom logic goes here.

+ (Product *) createIfNotExistFromDic:(NSDictionary*)dic inContext:(NSManagedObjectContext*)context;

@end
