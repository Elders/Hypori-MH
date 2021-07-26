//
//  FilmsViewController.m
//  Hypori-MH
//
//  Created by Milen Halachev on 23.07.21.
//

#import "FilmsViewController.h"

@interface FilmsViewController ()

@property(nonatomic, strong) NSArray *films;
@property(nonatomic, strong) id<Cancellable> loadFilmsSubscription;

@end

@implementation FilmsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Films", @"Screen's title");
    
    [self loadData];
    [self updateData];
}

- (StarWarsDomainService *)service {

    if (!_service) {
        
        _service = [[StarWarsDomainService alloc] init];
    }
    
    return _service;
}

-(void)loadData {
    
    self.films = self.service.state.films;
    [self.tableView reloadData];
}

-(void)updateData {
    
    __weak typeof(self) weakSelf = self;
    
    self.loadFilmsSubscription = [self.service loadFilmsWithCompletionHandler:^(NSArray<Film *> * _Nullable films, NSError * _Nullable error) {
       
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                
                [weakSelf showError:error];
                return;
            }
            
            [weakSelf loadData];
        });
    }];
}

-(void)showError:(NSError*)error {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Error loading films", @"Error alert title") message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Close", @"") style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.films.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    cell.textLabel.text = [self.films[indexPath.row] title];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
