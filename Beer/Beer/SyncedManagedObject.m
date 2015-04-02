//
//  SyncedManagedObject.m
//  Beer
//
//  Created by Jean-Baptiste Bayle on 4/2/15.
//  Copyright (c) 2015 Beer Corporation. All rights reserved.
//

#import "SyncedManagedObject.h"

NSString * const SyncedManagedObjectEntityName = @"SyncedManagedObject";
NSString * const SyncedManagedObjectSyncStateAttributeName = @"syncState";
NSString * const SyncedManagedObjectDateCreatedAttributeName = @"dateCreated";
NSString * const SyncedManagedObjectDateModifiedAttributeName = @"dateModified";
NSString * const SyncedManagedObjectDateDeletedAttributeName = @"dateDeleted";


@implementation SyncedManagedObject

@dynamic syncState;
@dynamic dateCreated;
@dynamic dateModified;
@dynamic dateDeleted;

- (void)awakeFromInsert {
    [super awakeFromInsert];

    self.dateCreated = [NSDate date];
    self.dateModified = [NSDate date];
}

@end
