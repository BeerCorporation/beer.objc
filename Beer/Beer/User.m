//
//  User.m
//  Beer
//
//  Created by Jean-Baptiste Bayle on 3/30/15.
//  Copyright (c) 2015 Beer Corporation. All rights reserved.
//

#import "User.h"


NSString * const UserEntityName = @"User";
NSString * const UserNameAttributeName = @"name";
NSString * const UserSentInvitationsAttributeName = @"sentInvitations";
NSString * const UserReceivedInvitationsAttributeName = @"receivedInvitations";


@implementation User

@dynamic name;
@dynamic sentInvitations;
@dynamic receivedInvitations;

@end
