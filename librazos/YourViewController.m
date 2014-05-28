#import "YourViewController.h"
#import <GoogleMaps/GoogleMaps.h>



static NSString const * kNormalType = @"Normal";
static NSString const * kSatelliteType = @"Satellite";
static NSString const * kHybridType = @"Hybrid";
static NSString const * kTerrainType = @"Terrain";

@implementation YourViewController {
    GMSMapView *mapView_;
    UISegmentedControl *switcher_;
}

- (void)viewDidLoad {
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:40.33468913769062
                                                            longitude:-3.7497285227539123
                                                                 zoom:16];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    self.view = mapView_;
    
    // The possible different types to show.
    NSArray *types = @[kNormalType, kSatelliteType, kHybridType, kTerrainType];
    
    // Create a UISegmentedControl that is the navigationItem's titleView.
    switcher_ = [[UISegmentedControl alloc] initWithItems:types];
    switcher_.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin |
    UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleBottomMargin;
    switcher_.selectedSegmentIndex = 0;
    self.navigationItem.titleView = switcher_;
    
    // Listen to touch events on the UISegmentedControl.
    [switcher_ addTarget:self action:@selector(didChangeSwitcher)
        forControlEvents:UIControlEventValueChanged];
    
    
}

- (void)didChangeSwitcher {
    // Switch to the type clicked on.
    NSString *title =
    [switcher_ titleForSegmentAtIndex:switcher_.selectedSegmentIndex];
    if ([kNormalType isEqualToString:title]) {
        mapView_.mapType = kGMSTypeNormal;
    } else if ([kSatelliteType isEqualToString:title]) {
        mapView_.mapType = kGMSTypeSatellite;
    } else if ([kHybridType isEqualToString:title]) {
        mapView_.mapType = kGMSTypeHybrid;
    } else if ([kTerrainType isEqualToString:title]) {
        mapView_.mapType = kGMSTypeTerrain;
    }
}

@end
