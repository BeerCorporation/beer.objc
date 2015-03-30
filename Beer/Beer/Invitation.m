//
//  Invitation.m
//  Beer
//
//  Created by Jean-Baptiste Bayle on 3/30/15.
//  Copyright (c) 2015 Beer Corporation. All rights reserved.
//

#import "Invitation.h"
#import "Bar.h"
#import "User.h"

NSString * const InvitationEntityName = @"Invitation";
NSString * const InvitationStatusAttributeName = @"status";
NSString * const InvitationSenderLocationAttributeName = @"senderLocation";
NSString * const InvitationrecipientLocationAttributeName = @"recipientLocation";
NSString * const InvitationSenderLocationLatitudeAttributeName = @"senderLocationLatitude";
NSString * const InvitationSenderLocationLongitudeAttributeName = @"senderLocationLongitude";
NSString * const InvitationrecipientLocationLatitudeAttributeName = @"recipientLocationLatitude";
NSString * const InvitationrecipientLocationLongitudeAttributeName = @"recipientLocationLongitude";


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
    [self willAccessValueForKey:InvitationrecipientLocationAttributeName];

    [self willAccessValueForKey:InvitationrecipientLocationLatitudeAttributeName];
    CLLocationDegrees latitude = self.recipientLocationLatitude.doubleValue;
    [self didAccessValueForKey:InvitationrecipientLocationLatitudeAttributeName];

    [self willAccessValueForKey:InvitationrecipientLocationLongitudeAttributeName];
    CLLocationDegrees longitude = self.recipientLocationLongitude.doubleValue;
    [self didAccessValueForKey:InvitationrecipientLocationLongitudeAttributeName];

    CLLocationCoordinate2D recipientLocation = CLLocationCoordinate2DMake(latitude, longitude);
    [self didAccessValueForKey:InvitationrecipientLocationAttributeName];

    return recipientLocation;
}

- (void)setRecipientLocation:(CLLocationCoordinate2D)recipientLocation {
    [self willChangeValueForKey:InvitationrecipientLocationAttributeName];

    [self willChangeValueForKey:InvitationrecipientLocationLatitudeAttributeName];
    self.recipientLocationLatitude = @(recipientLocation.latitude);
    [self didChangeValueForKey:InvitationrecipientLocationLatitudeAttributeName];

    [self willChangeValueForKey:InvitationrecipientLocationLongitudeAttributeName];
    self.recipientLocationLongitude = @(recipientLocation.longitude);
    [self didChangeValueForKey:InvitationrecipientLocationLongitudeAttributeName];

    [self didChangeValueForKey:InvitationrecipientLocationAttributeName];
}

@end
