//
//  Invitation.m
//  Beer
//
//  Created by Jean-Baptiste Bayle on 3/30/15.
//  Copyright (c) 2015 Beer Corporation. All rights reserved.
//

#import "Invitation.h"
#import "Bar.h"
#import "Friend.h"

NSString * const InvitationEntityName = @"Invitation";
NSString * const InvitationStatusAttributeName = @"status";
NSString * const InvitationSenderLocationAttributeName = @"senderLocation";
NSString * const InvitationRecipientLocationAttributeName = @"recipientLocation";
NSString * const InvitationSenderLocationLatitudeAttributeName = @"senderLocationLatitude";
NSString * const InvitationSenderLocationLongitudeAttributeName = @"senderLocationLongitude";
NSString * const InvitationRecipientLocationLatitudeAttributeName = @"recipientLocationLatitude";
NSString * const InvitationRecipientLocationLongitudeAttributeName = @"recipientLocationLongitude";
NSString * const InvitationDateCreatedAttributeName = @"dateCreated";
NSString * const InvitationDateModifiedAttributeName = @"dateModified";
NSString * const InvitationSenderAttributeName = @"sender";
NSString * const InvitationRecipientAttributeName = @"recipient";
NSString * const InvitationBarAttributeName = @"bar";


@interface Invitation ()

@property (nonatomic, retain) NSNumber * senderLocationLatitude;
@property (nonatomic, retain) NSNumber * recipientLocationLatitude;
@property (nonatomic, retain) NSNumber * senderLocationLongitude;
@property (nonatomic, retain) NSNumber * recipientLocationLongitude;

@end


@implementation Invitation

@dynamic status;
@dynamic senderLocationLatitude;
@dynamic recipientLocationLatitude;
@dynamic senderLocationLongitude;
@dynamic recipientLocationLongitude;
@dynamic dateCreated;
@dynamic dateModified;
@dynamic sender;
@dynamic recipient;
@dynamic bar;


- (CLLocationCoordinate2D)senderLocation {
    [self willAccessValueForKey:InvitationSenderLocationAttributeName];

    [self willAccessValueForKey:InvitationSenderLocationLatitudeAttributeName];
    CLLocationDegrees latitude = self.senderLocationLatitude.doubleValue;
    [self didAccessValueForKey:InvitationSenderLocationLatitudeAttributeName];

    [self willAccessValueForKey:InvitationSenderLocationLongitudeAttributeName];
    CLLocationDegrees longitude = self.senderLocationLongitude.doubleValue;
    [self didAccessValueForKey:InvitationSenderLocationLongitudeAttributeName];

    CLLocationCoordinate2D senderLocation = CLLocationCoordinate2DMake(latitude, longitude);
    [self didAccessValueForKey:InvitationSenderLocationAttributeName];

    return senderLocation;
}

- (void)setSenderLocation:(CLLocationCoordinate2D)senderLocation {
    [self willChangeValueForKey:InvitationSenderLocationAttributeName];

    [self willChangeValueForKey:InvitationSenderLocationLatitudeAttributeName];
    self.senderLocationLatitude = @(senderLocation.latitude);
    [self didChangeValueForKey:InvitationSenderLocationLatitudeAttributeName];

    [self willChangeValueForKey:InvitationSenderLocationLongitudeAttributeName];
    self.senderLocationLongitude = @(senderLocation.longitude);
    [self didChangeValueForKey:InvitationSenderLocationLongitudeAttributeName];

    [self didChangeValueForKey:InvitationSenderLocationAttributeName];
}

- (CLLocationCoordinate2D)recipientLocation {
    [self willAccessValueForKey:InvitationRecipientLocationAttributeName];

    [self willAccessValueForKey:InvitationRecipientLocationLatitudeAttributeName];
    CLLocationDegrees latitude = self.recipientLocationLatitude.doubleValue;
    [self didAccessValueForKey:InvitationRecipientLocationLatitudeAttributeName];

    [self willAccessValueForKey:InvitationRecipientLocationLongitudeAttributeName];
    CLLocationDegrees longitude = self.recipientLocationLongitude.doubleValue;
    [self didAccessValueForKey:InvitationRecipientLocationLongitudeAttributeName];

    CLLocationCoordinate2D recipientLocation = CLLocationCoordinate2DMake(latitude, longitude);
    [self didAccessValueForKey:InvitationRecipientLocationAttributeName];

    return recipientLocation;
}

- (void)setRecipientLocation:(CLLocationCoordinate2D)recipientLocation {
    [self willChangeValueForKey:InvitationRecipientLocationAttributeName];

    [self willChangeValueForKey:InvitationRecipientLocationLatitudeAttributeName];
    self.recipientLocationLatitude = @(recipientLocation.latitude);
    [self didChangeValueForKey:InvitationRecipientLocationLatitudeAttributeName];

    [self willChangeValueForKey:InvitationRecipientLocationLongitudeAttributeName];
    self.recipientLocationLongitude = @(recipientLocation.longitude);
    [self didChangeValueForKey:InvitationRecipientLocationLongitudeAttributeName];

    [self didChangeValueForKey:InvitationRecipientLocationAttributeName];
}

@end
