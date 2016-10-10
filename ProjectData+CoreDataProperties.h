//
//  ProjectData+CoreDataProperties.h
//  
//
//  Created by Uri Fuholichev on 10/10/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ProjectData.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProjectData (CoreDataProperties)

@property (nullable, nonatomic, retain) NSData *allRequestedData;
@property (nullable, nonatomic, retain) NSData *downloadedImages;

@end

NS_ASSUME_NONNULL_END
