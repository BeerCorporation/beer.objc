//
//  Friend.f
//  Beer
//
//  Created by Jean-Baptiste Bayle on 3/30/15.
//  Copyright (c) 2015 Beer Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "SyncedManagedObject.h"


extern NSString * const UserEntityName;
extern NSString * const UserNameAttributeName;
extern NSString * const UserSentInvitationsAttributeName;
extern NSString * const UserReceivedInvitationsAttributeName;


@interface Friend : SyncedManagedObject

@property (nonatomic, retain) NSString * name;

@property (nonatomic, retain) NSSet *sentInvitations;
@property (nonatomic, retain) NSSet *receivedInvitations;

@end


@interface Friend (CoreDataGeneratedAccessors)

- (void)addSentInvitationsObject:(NSManagedObject *)value;
- (void)removeSentInvitationsObject:(NSManagedObject *)value;
- (void)addSentInvitations:(NSSet *)values;
- (void)removeSentInvitations:(NSSet *)values;

- (void)addReceivedInvitationsObject:(NSManagedObject *)value;
- (void)removeReceivedInvitationsObject:(NSManagedObject *)value;
- (void)addReceivedInvitations:(NSSet *)values;
- (void)removeReceivedInvitations:(NSSet *)values;

@end
