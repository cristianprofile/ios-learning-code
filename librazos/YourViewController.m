#import "YourViewController.h"
#import <GoogleMaps/GoogleMaps.h>

@implementation YourViewController {
    GMSMapView *mapView_;
}

- (void)viewDidLoad {
    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:40.33468913769062
                                                            longitude:-3.7497285227539123
                                                                 zoom:16];
    mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView_.myLocationEnabled = YES;
    self.view = mapView_;
    
    // Creates a marker in the center of the map.

    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(40.33468913769062, -3.7497285227539123);
    marker.title = @"Sydney";
    marker.snippet = @"Australia";
    marker.map = mapView_;
}

@end
