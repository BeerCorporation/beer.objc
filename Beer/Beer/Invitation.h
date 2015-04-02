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
#import "SyncedManagedObject.h"
#import "Friend.h"


typedef NS_ENUM(int16_t, InvitationStatus) {
    InvitationStatusPending = 0,
    InvitationStatusDeclined,
    InvitationStatusAccepted
};

typedef NS_ENUM(int16_t, InvitationAppearance) {
    InvitationAppearanceUnknown = -1,
    InvitationAppearanceWaitingForAnswer,
    InvitationAppearancePendingIncomingRequest,
    InvitationAppearanceAccepted
};


extern NSString * const InvitationEntityName;
extern NSString * const InvitationStatusAttributeName;
extern NSString * const InvitationSenderLocationAttributeName;
extern NSString * const InvitationRecipientLocationAttributeName;
extern NSString * const InvitationSenderAttributeName;
extern NSString * const InvitationRecipientAttributeName;
extern NSString * const InvitationBarAttributeName;


@class Bar, Friend;

@interface Invitation : SyncedManagedObject

@property (nonatomic) InvitationStatus status;

@property (nonatomic) CLLocationCoordinate2D senderLocation;
@property (nonatomic) CLLocationCoordinate2D recipientLocation;

@property (nonatomic, retain) Friend *sender;
@property (nonatomic, retain) Friend *recipient;
@property (nonatomic, retain) Bar *bar;

- (InvitationAppearance)invitationAppearanceForCurrentUser:(Friend *)currentUser;

@end
