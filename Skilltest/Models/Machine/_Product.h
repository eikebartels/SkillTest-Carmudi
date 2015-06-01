// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Product.h instead.

#import <CoreData/CoreData.h>

extern const struct ProductAttributes {
	__unsafe_unretained NSString *brand;
	__unsafe_unretained NSString *image;
	__unsafe_unretained NSString *imageUrl;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *price;
	__unsafe_unretained NSString *uid;
} ProductAttributes;

extern const struct ProductUserInfo {
	__unsafe_unretained NSString *relatedByAttribute;
} ProductUserInfo;

@class NSObject;

@interface ProductID : NSManagedObjectID {}
@end

@interface _Product : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) ProductID* objectID;

@property (nonatomic, strong) NSString* brand;

//- (BOOL)validateBrand:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) id image;

//- (BOOL)validateImage:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* imageUrl;

//- (BOOL)validateImageUrl:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* price;

//- (BOOL)validatePrice:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* uid;

//- (BOOL)validateUid:(id*)value_ error:(NSError**)error_;

@end

@interface _Product (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveBrand;
- (void)setPrimitiveBrand:(NSString*)value;

- (id)primitiveImage;
- (void)setPrimitiveImage:(id)value;

- (NSString*)primitiveImageUrl;
- (void)setPrimitiveImageUrl:(NSString*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSString*)primitivePrice;
- (void)setPrimitivePrice:(NSString*)value;

- (NSString*)primitiveUid;
- (void)setPrimitiveUid:(NSString*)value;

@end
