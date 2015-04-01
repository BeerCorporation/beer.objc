//
//  Fiend.m
//  Beer
//
//  Created by Jean-Baptiste Bayle on 3/30/15.
//  Copyright (c) 2015 Beer Corporation. All rights reserved.
//

#import "Friend.h"


NSString * const UserEntityName = @"Friend";
NSString * const UserNameAttributeName = @"name";
NSString * const UserSentInvitationsAttributeName = @"sentInvitations";
NSString * const UserReceivedInvitationsAttributeName = @"receivedInvitations";


@implementation Friend

@dynamic name;
@dynamic sentInvitations;
@dynamic receivedInvitations;

@end
