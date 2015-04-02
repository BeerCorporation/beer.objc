//
//  InvitationsTableViewController.m
//  Beer
//
//  Created by Jean-Baptiste Bayle on 3/30/15.
//  Copyright (c) 2015 Beer Corporation. All rights reserved.
//

#import "InvitationsTableViewController.h"
#import <CoreData/CoreData.h>
#import "BeerDocumentHandler.h"
#import "Invitation.h"


NSString * const InvitationCellIdentifier = @"InvitationCellIdentifier";


@interface InvitationsTableViewController () <NSFetchedResultsControllerDelegate>

@property (nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic) NSFetchRequest *fetchRequest;

@end


@implementation InvitationsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BeerDocumentHandler *documentHandler = [BeerDocumentHandler sharedDocumentHandler];
    [documentHandler performWithDocument:^(UIManagedDocument *document) {
        NSManagedObjectContext *context = document.managedObjectContext;
        self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:self.fetchRequest
                                                                            managedObjectContext:context
                                                                              sectionNameKeyPath:nil
                                                                                       cacheName:nil];
        self.fetchedResultsController.delegate = self;
        [self performFetch];
    }];
}

- (void)performFetch {
    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        NSLog(@"Error when executing fetch: %@, %@", error, error.localizedDescription);
        return;
    }

    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *sections = self.fetchedResultsController.sections;
    return [sections[section] numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:InvitationCellIdentifier forIndexPath:indexPath];
    Invitation *invitation = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = invitation.sender.name;

    return cell;
}

#pragma mark - Fetch Request Delegate

- (NSFetchRequest *)fetchRequest {
    if (!_fetchRequest) {
        _fetchRequest = [NSFetchRequest fetchRequestWithEntityName:InvitationEntityName];
        _fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:SyncedManagedObjectDateModifiedAttributeName ascending:NO]];
    }
    return _fetchRequest;
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView reloadData];
}

@end
