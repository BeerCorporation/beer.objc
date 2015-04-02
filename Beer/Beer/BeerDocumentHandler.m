//
//  BeerDocumentHandler.m
//  Beer
//
//  Created by Jean-Baptiste Bayle on 3/30/15.
//  Copyright (c) 2015 Beer Corporation. All rights reserved.
//

#import "BeerDocumentHandler.h"

static NSString *BeerDocumentHandlerURL = @"BeerDocument.md";
static NSTimeInterval BeerDocumentHandlerRetryDelay = .05;


@interface BeerDocumentHandler ()

@property (nonatomic, readwrite) Friend *currentUser;
@property (nonatomic, readwrite) BOOL opening;

@end


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
        self.opening = NO;
    }
    return self;
}

- (void)performWithDocument:(OnDocumentReady)onDocumentReady {
    void (^OnDocumentDidLoad)(BOOL) = ^(BOOL success) {
        self.opening = NO;
        onDocumentReady(self.document);
    };

    if (self.isOpening) {
        SEL selector = @selector(performWithDocument:);
        NSTimeInterval delay = BeerDocumentHandlerRetryDelay;
        [self performSelector:selector withObject:OnDocumentDidLoad afterDelay:delay];
        return;
    }

    if (![[NSFileManager defaultManager] fileExistsAtPath:[self.document.fileURL path]]) {
        self.opening = YES;
        [self.document saveToURL:self.document.fileURL
                forSaveOperation:UIDocumentSaveForCreating
               completionHandler:OnDocumentDidLoad];
    } else if (self.document.documentState == UIDocumentStateClosed) {
        self.opening = YES;
        [self.document openWithCompletionHandler:OnDocumentDidLoad];
    } else if (self.document.documentState == UIDocumentStateNormal) {
        OnDocumentDidLoad(YES);
    }
}

- (Friend *)fetchCurrentUserFromContext:(NSManagedObjectContext *)context {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:FriendEntityName];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"SELF.%@ == YES", FriendCurrentUserAttributeName];
    fetchRequest.fetchLimit = 10;

    NSError *fetchError = nil;
    NSArray *results = [context executeFetchRequest:fetchRequest error:&fetchError];
    if (fetchError || results.count != 1) {
        NSLog(@"Error: impossible to fetch current user: '%@'.", fetchError.localizedDescription);
        return nil;
    }

    Friend *currentUser = results.lastObject;
    self.currentUser = currentUser;
    return currentUser;
}

@end
