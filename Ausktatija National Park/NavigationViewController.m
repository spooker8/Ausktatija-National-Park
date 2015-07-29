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
    
    NSArray *menu;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    menu = @[@"one",@"two", @"three", @"four",@"five",@"six",@"seven",@"eight",@"nine",@"ten",@"eleven",@"twelve"];
    
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
    return [menu count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSString *cellIdentifier = [menu objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}



// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    // Set the title of navigation bar by using the menu items
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
    destViewController.title = [[menu objectAtIndex:indexPath.row] capitalizedString];
    
    
}


@end
