//
//  Fiend.m
//  Beer
//
//  Created by Jean-Baptiste Bayle on 3/30/15.
//  Copyright (c) 2015 Beer Corporation. All rights reserved.
//

#import "Friend.h"


NSString * const FriendEntityName = @"Friend";
NSString * const FriendNameAttributeName = @"name";
NSString * const FriendCurrentUserAttributeName = @"currentUser";
NSString * const FriendSentInvitationsAttributeName = @"sentInvitations";
NSString * const FriendReceivedInvitationsAttributeName = @"receivedInvitations";


@implementation Friend

@dynamic name;
@dynamic currentUser;
@dynamic sentInvitations;
@dynamic receivedInvitations;

@end
