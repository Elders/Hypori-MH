//
//  FilmViewController.m
//  Hypori-MH
//
//  Created by Milen Halachev on 26.07.21.
//

#import "FilmViewController.h"

@interface FilmViewController ()

@property(nonatomic, weak) IBOutlet UILabel *titleLabel;
@property(nonatomic, weak) IBOutlet UILabel *directorLabel;
@property(nonatomic, weak) IBOutlet UILabel *releaseDateLabel;
@property(nonatomic, weak) IBOutlet UILabel *openingCrawlLabel;
@property(nonatomic, weak) IBOutlet UIButton *charactersButton;
@property(nonatomic, weak) IBOutlet UIButton *planetsButton;
@property(nonatomic, weak) IBOutlet UIButton *starshipsButton;
@property(nonatomic, weak) IBOutlet UIButton *vehiclesButton;
@property(nonatomic, weak) IBOutlet UIButton *speciesButton;

@end

@implementation FilmViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Film", @"Screen's title");
    [self loadData];
}

-(void)loadData {
    
    self.titleLabel.text = self.film.title;
    self.directorLabel.text = self.film.director;
    self.releaseDateLabel.text = [NSDateFormatter localizedStringFromDate:self.film.releaseDate dateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle];
    self.openingCrawlLabel.text = self.film.openingCrawl;
    
    [self.charactersButton setTitle:[NSLocalizedString(@"Characters", @"") stringByAppendingFormat:@": (%@)", @(self.film.characters.count)] forState:UIControlStateNormal];
    [self.planetsButton setTitle:[NSLocalizedString(@"Planets", @"") stringByAppendingFormat:@": (%@)", @(self.film.planets.count)] forState:UIControlStateNormal];
    [self.starshipsButton setTitle:[NSLocalizedString(@"Starships", @"") stringByAppendingFormat:@": (%@)", @(self.film.starships.count)] forState:UIControlStateNormal];
    [self.vehiclesButton setTitle:[NSLocalizedString(@"Vehicles", @"") stringByAppendingFormat:@": (%@)", @(self.film.vehicles.count)] forState:UIControlStateNormal];
    [self.speciesButton setTitle:[NSLocalizedString(@"Species", @"") stringByAppendingFormat:@": (%@)", @(self.film.species.count)] forState:UIControlStateNormal];
}


@end
