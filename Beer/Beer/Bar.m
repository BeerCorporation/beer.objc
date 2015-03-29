//
//  Bar.m
//  Beer
//
//  Created by Jean-Baptiste Bayle on 3/30/15.
//  Copyright (c) 2015 Beer Corporation. All rights reserved.
//

#import "Bar.h"

static NSString *BarEntityName = @"Bar";
static NSString *BarNameAttributeName = @"name";
static NSString *BarLocationAttributeName = @"location";
static NSString *BarLatitudeAttributeName = @"latitude";
static NSString *BarLongitudeAttributeName = @"longitude";
static NSString *BarInvitationsAttributeName = @"invitations";


@interface Bar ()

@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;

@end


@implementation Bar

@dynamic name;
@dynamic latitude;
@dynamic longitude;
@dynamic invitations;

+ (NSString *)managedObjectName {
    return @"Bar";
}

- (CLLocationCoordinate2D)location {
    [self willAccessValueForKey:BarLocationAttributeName];

    [self willAccessValueForKey:BarLatitudeAttributeName];
    CLLocationDegrees latitude = self.latitude.doubleValue;
    [self didAccessValueForKey:BarLatitudeAttributeName];

    [self willAccessValueForKey:BarLongitudeAttributeName];
    CLLocationDegrees longitude = self.longitude.doubleValue;
    [self didAccessValueForKey:BarLongitudeAttributeName];

    CLLocationCoordinate2D location = CLLocationCoordinate2DMake(latitude, longitude);
    [self didAccessValueForKey:BarLocationAttributeName];

    return location;
}

- (void)setLocation:(CLLocationCoordinate2D)location {
    [self willChangeValueForKey:BarLocationAttributeName];

    [self willChangeValueForKey:BarLatitudeAttributeName];
    self.latitude = @(location.latitude);
    [self didChangeValueForKey:BarLatitudeAttributeName];

    [self willChangeValueForKey:BarLongitudeAttributeName];
    self.longitude = @(location.longitude);
    [self didChangeValueForKey:BarLongitudeAttributeName];

    [self didChangeValueForKey:BarLocationAttributeName];
}

@end
