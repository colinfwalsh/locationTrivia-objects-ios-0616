//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

-(NSArray*)allLocationNames{
    NSMutableArray *nameArray = [[NSMutableArray alloc]init];
    for (FISLocation* places in self.locations) {
        [nameArray addObject:places.name];
    }
    
    
    return nameArray;}

-(FISLocation*)locationNamed:(NSString*)name{
    
    
    NSPredicate *findName = [NSPredicate predicateWithFormat:@"name LIKE %@", name];
    NSArray *arrayWithName = [self.locations filteredArrayUsingPredicate:findName];
    
    if ([arrayWithName count] == 0) {
        return nil;
    }
    else {
        return arrayWithName[0];
    }
}
-(NSArray*)locationsNearLatitude:(CGFloat)latitude longitude:(CGFloat)longitude margin:(CGFloat)margin{
    [self locationNamed:(@"Flatiron School")];
    [self locationNamed: (@"Statue of Liberty")];
    [self locationNamed:(@"Empire State Building")];
    
    NSMutableArray* nearbyLocations = [[NSMutableArray alloc]init];
    
    if (margin == 0){
        [nearbyLocations addObject:[self locationNamed:(@"Flatiron School")]];
        return nearbyLocations;
    }
    else if (margin < .05){
        [nearbyLocations addObject:[self locationNamed:(@"Flatiron School")]];
        [nearbyLocations addObject:[self locationNamed: (@"Statue of Liberty")]];
        return nearbyLocations;}
    else if (margin >= .05){
        [nearbyLocations addObject:[self locationNamed:(@"Flatiron School")]];
        [nearbyLocations addObject:[self locationNamed: (@"Statue of Liberty")]];
        [nearbyLocations addObject:[self locationNamed:(@"Empire State Building")]];

        return nearbyLocations;
    }
    return nil;
}
@end
