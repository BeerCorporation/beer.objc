//
//  Invitation.h
//  Beer
//
//  Created by Jean-Baptiste Bayle on 3/30/15.
//  Copyright (c) 2015 Beer Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <MapKit/MapKit.h>
#import "User.h"


extern NSString * const InvitationEntityName;
extern NSString * const InvitationStatusAttributeName;
extern NSString * const InvitationSenderLocationAttributeName;
extern NSString * const InvitationRecipientLocationAttributeName;
extern NSString * const InvitationDateCreatedAttributeName;
extern NSString * const InvitationDateModifiedAttributeName;
extern NSString * const InvitationSenderAttributeName;
extern NSString * const InvitationRecipientAttributeName;
extern NSString * const InvitationBarAttributeName;


@class Bar, User;

@interface Invitation : NSManagedObject

@property (nonatomic, retain) NSNumber * status;

@property (nonatomic) CLLocationCoordinate2D senderLocation;
@property (nonatomic) CLLocationCoordinate2D recipientLocation;

@property (nonatomic, retain) NSDate * dateCreated;
@property (nonatomic, retain) NSDate * dateModified;

@property (nonatomic, retain) User *sender;
@property (nonatomic, retain) User *recipient;
@property (nonatomic, retain) Bar *bar;

@end
