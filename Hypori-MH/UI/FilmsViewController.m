//
//  FilmsViewController.m
//  Hypori-MH
//
//  Created by Milen Halachev on 23.07.21.
//

#import "FilmsViewController.h"
#import "Hypori_MH-Swift.h"
#import "FilmTableViewCell.h"

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
    
    [self.view showAnimatedGradientSkeletonObjC];
    
    __weak typeof(self) weakSelf = self;
    self.loadFilmsSubscription = [self.service loadFilmsWithCompletionHandler:^(NSArray<Film *> * _Nullable films, NSError * _Nullable error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (error) {
                
                [weakSelf showError:error];
                return;
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [weakSelf.view hideSkeletonObjC];
                [weakSelf.tableView reloadData];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [weakSelf loadData];
                    [weakSelf.tableView.refreshControl endRefreshing];
                });
            });
        });
    }];
}

-(IBAction)refreshData {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.35 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self updateData];
    });
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
    
    FilmTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    cell.titleLabel.text = [self.films[indexPath.row] title];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewAutomaticDimension;
}

@end
