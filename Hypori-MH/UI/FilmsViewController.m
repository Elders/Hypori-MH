//
//  FilmsViewController.m
//  Hypori-MH
//
//  Created by Milen Halachev on 23.07.21.
//

#import "FilmsViewController.h"

@interface FilmsViewController ()

@end

@implementation FilmsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    cell.textLabel.text = @"gg";
    return cell;
}

@end
