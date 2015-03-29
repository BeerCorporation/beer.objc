//
//  User.m
//  Beer
//
//  Created by Jean-Baptiste Bayle on 3/30/15.
//  Copyright (c) 2015 Beer Corporation. All rights reserved.
//

#import "User.h"


static NSString *UserEntityName = @"User";
static NSString *UserNameAttributeName = @"name";
static NSString *UserSentInvitationsAttributeName = @"sentInvitations";
static NSString *UserReceivedInvitationsAttributeName = @"receivedInvitations";


@implementation User

@dynamic name;
@dynamic sentInvitations;
@dynamic receivedInvitations;

@end
