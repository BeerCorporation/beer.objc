//
//  BeerDocumentHandler.h
//  Beer
//
//  Created by Jean-Baptiste Bayle on 3/30/15.
//  Copyright (c) 2015 Beer Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Friend.h"

typedef void (^OnDocumentReady) (UIManagedDocument *document);


@interface BeerDocumentHandler : NSObject

@property (nonatomic, readonly) Friend *currentUser;

@property (nonatomic, strong) UIManagedDocument *document;
@property (nonatomic, readonly, getter=isOpening) BOOL opening;

+ (BeerDocumentHandler *)sharedDocumentHandler;
- (void)performWithDocument:(OnDocumentReady)onDocumentReady;
- (Friend *)fetchCurrentUserFromContext:(NSManagedObjectContext *)context;

@end
