//
//  AppDelegate.m
//  Beer
//
//  Created by Jean-Baptiste Bayle on 3/29/15.
//  Copyright (c) 2015 Beer Corporation. All rights reserved.
//

#import "AppDelegate.h"
#import "BeerDocumentHandler.h"
#import <MapKit/MapKit.h>
#import "Invitation.h"
#import "Friend.h"
#import "Bar.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self deleteDatabase];
    [self createFixtures];
    return YES;
}

- (void)createFixtures {
    BeerDocumentHandler *documentHandler = [BeerDocumentHandler sharedDocumentHandler];
    [documentHandler performWithDocument:^(UIManagedDocument *document) {
        [document.managedObjectContext performBlockAndWait:^{
            NSManagedObjectContext *context = document.managedObjectContext;

            // Create friends
            Friend *jabba = [NSEntityDescription insertNewObjectForEntityForName:FriendEntityName inManagedObjectContext:context];
            jabba.name = @"Jabba";
            Friend *gepetto = [NSEntityDescription insertNewObjectForEntityForName:FriendEntityName inManagedObjectContext:context];
            gepetto.name = @"Gepetto";
            Friend *zboubidoo = [NSEntityDescription insertNewObjectForEntityForName:FriendEntityName inManagedObjectContext:context];
            zboubidoo.name = @"Zboubidoo";

            // Create current user
            Friend *nanouk = [NSEntityDescription insertNewObjectForEntityForName:FriendEntityName inManagedObjectContext:context];
            nanouk.name = @"Nanouk";
            nanouk.currentUser = YES;

            // Create bars
            Bar *leMistral = [NSEntityDescription insertNewObjectForEntityForName:BarEntityName inManagedObjectContext:context];
            leMistral.name = @"Le Mistral";
            leMistral.location = CLLocationCoordinate2DMake(32.0, 54.0);
            Bar *antreIndien = [NSEntityDescription insertNewObjectForEntityForName:BarEntityName inManagedObjectContext:context];
            antreIndien.name = @"L'antre de l'indien";
            antreIndien.location = CLLocationCoordinate2DMake(10.0, 23.0);

            // Create invitations
            Invitation *invitation1 = [NSEntityDescription insertNewObjectForEntityForName:InvitationEntityName inManagedObjectContext:context];
            invitation1.status = InvitationStatusPending;
            invitation1.senderLocation = CLLocationCoordinate2DMake(12.0, 23.0);
            invitation1.sender = jabba;
            invitation1.recipient = nanouk;
            Invitation *invitation2 = [NSEntityDescription insertNewObjectForEntityForName:InvitationEntityName inManagedObjectContext:context];
            invitation2.status = InvitationStatusPending;
            invitation2.senderLocation = CLLocationCoordinate2DMake(11.0, 25.0);
            invitation2.sender = gepetto;
            invitation2.recipient = nanouk;
            Invitation *invitation3 = [NSEntityDescription insertNewObjectForEntityForName:InvitationEntityName inManagedObjectContext:context];
            invitation3.status = InvitationStatusPending;
            invitation3.senderLocation = CLLocationCoordinate2DMake(12.0, 23.0);
            invitation3.sender = nanouk;
            invitation3.recipient = zboubidoo;
            Invitation *invitation4 = [NSEntityDescription insertNewObjectForEntityForName:InvitationEntityName inManagedObjectContext:context];
            invitation4.status = InvitationStatusAccepted;
            invitation4.senderLocation = CLLocationCoordinate2DMake(11.2, 25.3);
            invitation4.recipientLocation = CLLocationCoordinate2DMake(11.6, 25.1);
            invitation4.bar = leMistral;
            invitation4.sender = gepetto;
            invitation4.recipient = nanouk;

            [context save:nil];
        }];
    }];
}

- (void)deleteDatabase {
    UIManagedDocument *document = [BeerDocumentHandler sharedDocumentHandler].document;
    if ([[NSFileManager defaultManager] fileExistsAtPath:[document.fileURL path]]) {
        [[NSFileManager defaultManager] removeItemAtURL:document.fileURL error:nil];
    }
}

@end
