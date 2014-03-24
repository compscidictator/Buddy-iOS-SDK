//
//  BPCoordinate.h
//  BuddySDK
//
//  Created by Erik Kerber on 12/9/13.
//
//

#import <Foundation/Foundation.h>

@interface BPCoordinate : NSObject
@property (nonatomic, assign) double lat;
@property (nonatomic, assign) double lng;
@end

static inline BPCoordinate *BPCoordinateMake(double lat, double lon)
{
    BPCoordinate *coord = [[BPCoordinate alloc] init];
    coord.lat = lat;
    coord.lng = lon;
    return coord;
};

@interface BPCoordinateRange : BPCoordinate
@property (nonatomic, assign) NSInteger range;
@end

static inline BPCoordinateRange *BPCoordinateRangeMake(double lat, double lon, NSInteger distanceInMeteres)
{
    BPCoordinateRange *coord = [[BPCoordinateRange alloc] init];
    coord.lat = lat;
    coord.lng = lon;
    coord.range = distanceInMeteres;
    return coord;
};