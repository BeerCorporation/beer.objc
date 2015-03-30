//
//  AppDelegate.m
//  Beer
//
//  Created by Jean-Baptiste Bayle on 3/29/15.
//  Copyright (c) 2015 Beer Corporation. All rights reserved.
//

#import "AppDelegate.h"
#import "BeerDocumentHandler.h"
#import "User.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self deleteUsers];
    [self createUsers];
    return YES;
}

- (void)createUsers {
    BeerDocumentHandler *documentHandler = [BeerDocumentHandler sharedDocumentHandler];
    [documentHandler performWithDocument:^(UIManagedDocument *document) {
        [document.managedObjectContext performBlockAndWait:^{
            NSManagedObjectContext *context = document.managedObjectContext;
            User *jabba = [NSEntityDescription insertNewObjectForEntityForName:UserEntityName inManagedObjectContext:context];
            jabba.name = @"Jabba";
            User *gepetto = [NSEntityDescription insertNewObjectForEntityForName:UserEntityName inManagedObjectContext:context];
            gepetto.name = @"Gepetto";
            User *zboubidoo = [NSEntityDescription insertNewObjectForEntityForName:UserEntityName inManagedObjectContext:context];
            zboubidoo.name = @"Zboubidoo";
            User *nanouk = [NSEntityDescription insertNewObjectForEntityForName:UserEntityName inManagedObjectContext:context];
            nanouk.name = @"Nanouk";

            [context save:nil];
        }];
    }];
}

- (void)deleteUsers {
    UIManagedDocument *document = [BeerDocumentHandler sharedDocumentHandler].document;
    if ([[NSFileManager defaultManager] fileExistsAtPath:[document.fileURL path]]) {
        [[NSFileManager defaultManager] removeItemAtURL:document.fileURL error:nil];
    }
}

@end
