//
//  InvitationViewController.m
//  Beer
//
//  Created by Jean-Baptiste Bayle on 3/30/15.
//  Copyright (c) 2015 Beer Corporation. All rights reserved.
//

#import "InvitationViewController.h"
#import <MapKit/MapKit.h>
#import "BeerDocumentHandler.h"
#import "Friend.h"

@interface InvitationViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (nonatomic, readonly) Friend *currentUser;

@end


@implementation InvitationViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self refreshInvitationInformation];
}

- (void)refreshInvitationInformation {
    if (!self.invitation) {
        self.statusLabel.text = @"Error: No Invitation Found.";
        self.detailLabel.text = nil;
        return;
    }

    NSDate *date = self.invitation.dateModified;
    NSString *dateString = [NSDateFormatter localizedStringFromDate:date
                                                          dateStyle:NSDateFormatterShortStyle
                                                          timeStyle:NSDateFormatterMediumStyle];

    switch ([self.invitation invitationAppearanceForCurrentUser:self.currentUser]) {
        case InvitationAppearancePendingIncomingRequest:
            self.statusLabel.text = @"Up for a beer?";
            self.detailLabel.text = [NSString stringWithFormat:@"Invitation sent on the %@", dateString];
            break;

        case InvitationAppearanceAccepted:
            self.statusLabel.text = @"Let's meet for a drink!";
            self.detailLabel.text = [NSString stringWithFormat:@"Invitation accepted on the %@", dateString];
            break;

        case InvitationAppearanceWaitingForAnswer:
            self.statusLabel.text = @"Waiting for answer…";
            self.detailLabel.text = [NSString stringWithFormat:@"Invitation sent on the %@", dateString];
            break;

        case InvitationAppearanceUnknown:
            self.statusLabel.text = @"Network Error. Please refresh.";
            self.detailLabel.text = [NSString stringWithFormat:@"Last modification on the %@", dateString];
            break;
    }
}

#pragma mark - Convenience currentUser accessor

- (Friend *)currentUser {
    BeerDocumentHandler *documentHandler = [BeerDocumentHandler sharedDocumentHandler];
    return documentHandler.currentUser;
}

@end
