//
//  BeerDocumentHandler.h
//  Beer
//
//  Created by Jean-Baptiste Bayle on 3/30/15.
//  Copyright (c) 2015 Beer Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^OnDocumentReady) (UIManagedDocument *document);


@interface BeerDocumentHandler : NSObject

@property (strong, nonatomic) UIManagedDocument *document;

+ (BeerDocumentHandler *)sharedDocumentHandler;
- (void)performWithDocument:(OnDocumentReady)onDocumentReady;

@end
