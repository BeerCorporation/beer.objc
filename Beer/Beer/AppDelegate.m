//
//  AppDelegate.m
//  Beer
//
//  Created by Jean-Baptiste Bayle on 3/29/15.
//  Copyright (c) 2015 Beer Corporation. All rights reserved.
//

#import "AppDelegate.h"
#import "BeerDocumentHandler.h"
#import "Friend.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self deleteDatabase];
    [self createUsers];
    return YES;
}

- (void)createUsers {
    BeerDocumentHandler *documentHandler = [BeerDocumentHandler sharedDocumentHandler];
    [documentHandler performWithDocument:^(UIManagedDocument *document) {
        [document.managedObjectContext performBlockAndWait:^{
            NSManagedObjectContext *context = document.managedObjectContext;
            Friend *jabba = [NSEntityDescription insertNewObjectForEntityForName:UserEntityName inManagedObjectContext:context];
            jabba.name = @"Jabba";
            Friend *gepetto = [NSEntityDescription insertNewObjectForEntityForName:UserEntityName inManagedObjectContext:context];
            gepetto.name = @"Gepetto";
            Friend *zboubidoo = [NSEntityDescription insertNewObjectForEntityForName:UserEntityName inManagedObjectContext:context];
            zboubidoo.name = @"Zboubidoo";
            Friend *nanouk = [NSEntityDescription insertNewObjectForEntityForName:UserEntityName inManagedObjectContext:context];
            nanouk.name = @"Nanouk";

            [context save:nil];
        }];
    }];
}

- (void)createBars {
    
}

- (void)deleteDatabase {
    UIManagedDocument *document = [BeerDocumentHandler sharedDocumentHandler].document;
    if ([[NSFileManager defaultManager] fileExistsAtPath:[document.fileURL path]]) {
        [[NSFileManager defaultManager] removeItemAtURL:document.fileURL error:nil];
    }
}

@end
