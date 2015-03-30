//
//  BeerDocumentHandler.m
//  Beer
//
//  Created by Jean-Baptiste Bayle on 3/30/15.
//  Copyright (c) 2015 Beer Corporation. All rights reserved.
//

#import "BeerDocumentHandler.h"

static NSString *BeerDocumentHandlerURL = @"BeerDocument.md";


@implementation BeerDocumentHandler

static BeerDocumentHandler *_sharedDocumentHandler;

+ (BeerDocumentHandler *)sharedDocumentHandler {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDocumentHandler = [[self alloc] init];
    });
    return _sharedDocumentHandler;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSArray *directories = [[NSFileManager defaultManager] URLsForDirectory:NSLibraryDirectory inDomains:NSUserDomainMask];
        NSURL *url = [directories lastObject];
        url = [url URLByAppendingPathComponent:BeerDocumentHandlerURL];

        self.document = [[UIManagedDocument alloc] initWithFileURL:url];
    }
    return self;
}

- (void)performWithDocument:(OnDocumentReady)onDocumentReady {
    void (^OnDocumentDidLoad)(BOOL) = ^(BOOL success) {
        onDocumentReady(self.document);
    };

    if (![[NSFileManager defaultManager] fileExistsAtPath:[self.document.fileURL path]]) {
        [self.document saveToURL:self.document.fileURL
                forSaveOperation:UIDocumentSaveForCreating
               completionHandler:OnDocumentDidLoad];
    } else if (self.document.documentState == UIDocumentStateClosed) {
        [self.document openWithCompletionHandler:OnDocumentDidLoad];
    } else if (self.document.documentState == UIDocumentStateNormal) {
        OnDocumentDidLoad(YES);
    }
}

@end
