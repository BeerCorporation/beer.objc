//
//  InvitationsTableViewController.m
//  Beer
//
//  Created by Jean-Baptiste Bayle on 3/30/15.
//  Copyright (c) 2015 Beer Corporation. All rights reserved.
//

#import "InvitationsTableViewController.h"
#import <CoreData/CoreData.h>
#import "AppConstants.h"
#import "BeerDocumentHandler.h"
#import "InvitationViewController.h"
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
    BeerDocumentHandler *documentHandler = [BeerDocumentHandler sharedDocumentHandler];

    cell.textLabel.text = [documentHandler.currentUser isEqual:invitation.sender] ? invitation.recipient.name : invitation.sender.name;

    cell.textLabel.font = [UIFont systemFontOfSize:cell.textLabel.font.pointSize];
    cell.detailTextLabel.font = [UIFont systemFontOfSize:cell.detailTextLabel.font.pointSize];
    switch ([invitation invitationAppearanceForCurrentUser:documentHandler.currentUser]) {
        case InvitationAppearancePendingIncomingRequest:
            cell.textLabel.font = [UIFont boldSystemFontOfSize:cell.textLabel.font.pointSize];
            cell.detailTextLabel.font = [UIFont boldSystemFontOfSize:cell.detailTextLabel.font.pointSize];
            cell.detailTextLabel.text = @"Up for a beer?";
            break;

        case InvitationAppearanceAccepted:
            cell.detailTextLabel.text = @"You're both thirsty! Let's have a beer!";
            break;

        case InvitationAppearanceWaitingForAnswer:
            cell.detailTextLabel.text = @"Waiting for answer…";
            break;

        case InvitationAppearanceUnknown:
        default:
            cell.detailTextLabel.text = @"Network error, please refresh.";
            break;
    }

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

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:InvitationViewControllerSegueIdentifier]) {
        InvitationViewController *invitationVC = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Invitation *invitation = [self.fetchedResultsController objectAtIndexPath:indexPath];
        invitationVC.invitation = invitation;
    }
}

@end
