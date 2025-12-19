//
//  NavigationViewController.m
//  Ausktatija National Park
//
//  Created by Anand Kumar on 7/28/15.
//  Copyright (c) 2015 anand. All rights reserved.
//

#import "NavigationViewController.h"
#import "SWRevealViewController.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController {
    
    NSArray<NSDictionary<NSString *, NSString *> *> *menuItems;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    menuItems = @[
        @{@"identifier": @"one", @"title": @"About the Park"},
        @{@"identifier": @"two", @"title": @"Emergency Contact"},
        @{@"identifier": @"three", @"title": @"Photos"},
        @{@"identifier": @"four", @"title": @"How to get there"},
        @{@"identifier": @"five", @"title": @"Lakes"},
        @{@"identifier": @"six", @"title": @"National Park Map"},
        @{@"identifier": @"seven", @"title": @"Bicycle Trail"},
        @{@"identifier": @"eight", @"title": @"Kayak Routes"},
        @{@"identifier": @"nine", @"title": @"Camping Grounds"},
        @{@"identifier": @"ten", @"title": @"Lodging"},
        @{@"identifier": @"eleven", @"title": @"Historic Sites"},
        @{@"identifier": @"twelve", @"title": @"Local Events"}
    ];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [menuItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSDictionary<NSString *, NSString *> *menuItem = menuItems[indexPath.row];
    NSString *cellIdentifier = menuItem[@"identifier"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = menuItem[@"title"];
    
    return cell;
}



// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    // Set the title of navigation bar by using the menu items
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
    destViewController.title = menuItems[indexPath.row][@"title"];
    
    
}


@end
