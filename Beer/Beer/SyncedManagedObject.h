//
//  SyncedManagedObject.h
//  Beer
//
//  Created by Jean-Baptiste Bayle on 4/2/15.
//  Copyright (c) 2015 Beer Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

extern NSString * const SyncedManagedObjectEntityName;
extern NSString * const SyncedManagedObjectSyncStateAttributeName;
extern NSString * const SyncedManagedObjectDateCreatedAttributeName;
extern NSString * const SyncedManagedObjectDateModifiedAttributeName;
extern NSString * const SyncedManagedobjectDateDeletedAttributeName;


typedef NS_ENUM(int16_t, SyncState) {
    SyncStateInSync,
    SyncStateInserted,
    SyncStateModified,
    SyncStateDeleted
};


@interface SyncedManagedObject : NSManagedObject

@property (nonatomic) SyncState syncState;

@property (nonatomic, retain) NSDate * dateCreated;
@property (nonatomic, retain) NSDate * dateModified;
@property (nonatomic, retain) NSDate * dateDeleted;

@end
