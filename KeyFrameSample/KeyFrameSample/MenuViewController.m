//
//  MenuViewController.m
//  KeyFrameSample
//
//  Created by 雄一 on 2012/08/24.
//  Copyright (c) 2012年 nakiwo. All rights reserved.
//

#import "MenuViewController.h"
#import "ValueViewController.h"
#import "PathViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (id)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if(self) {
        self.title = @"KeyPath";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }

    switch(indexPath.row) {
        case 0:
            cell.textLabel.text = @"value";
            break;
        case 1:
            cell.textLabel.text = @"path";
            break;
        default:
            break;
    }
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch(indexPath.row) {
        case 0:
        {
            ValueViewController *vc = [[ValueViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            PathViewController *vc = [[PathViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;

        default:
            break;
    }
}

@end
