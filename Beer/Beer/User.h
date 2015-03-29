//
//  User.h
//  Beer
//
//  Created by Jean-Baptiste Bayle on 3/30/15.
//  Copyright (c) 2015 Beer Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


static NSString *UserEntityName;
static NSString *UserNameAttributeName;
static NSString *UserSentInvitationsAttributeName;
static NSString *UserReceivedInvitationsAttributeName;


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * name;

@property (nonatomic, retain) NSSet *sentInvitations;
@property (nonatomic, retain) NSSet *receivedInvitations;

@end


@interface User (CoreDataGeneratedAccessors)

- (void)addSentInvitationsObject:(NSManagedObject *)value;
- (void)removeSentInvitationsObject:(NSManagedObject *)value;
- (void)addSentInvitations:(NSSet *)values;
- (void)removeSentInvitations:(NSSet *)values;

- (void)addReceivedInvitationsObject:(NSManagedObject *)value;
- (void)removeReceivedInvitationsObject:(NSManagedObject *)value;
- (void)addReceivedInvitations:(NSSet *)values;
- (void)removeReceivedInvitations:(NSSet *)values;

@end
