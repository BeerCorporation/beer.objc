//
//  Bar.h
//  Beer
//
//  Created by Jean-Baptiste Bayle on 3/30/15.
//  Copyright (c) 2015 Beer Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <MapKit/MapKit.h>
#import "SyncedManagedObject.h"

extern NSString * const BarEntityName;
extern NSString * const BarNameAttributeName;
extern NSString * const BarLocationAttributeName;
extern NSString * const BarInvitationsAttributeName;


@interface Bar : SyncedManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic) CLLocationCoordinate2D location;

@property (nonatomic, retain) NSSet *invitations;

@end


@interface Bar (CoreDataGeneratedAccessors)

- (void)addInvitationsObject:(NSManagedObject *)value;
- (void)removeInvitationsObject:(NSManagedObject *)value;
- (void)addInvitations:(NSSet *)values;
- (void)removeInvitations:(NSSet *)values;

@end
