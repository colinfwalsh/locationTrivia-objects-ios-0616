//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@class FISLocation;
#import "FISLocation.h"

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSMutableArray *locations;

-(NSArray*)allLocationNames;
-(FISLocation*)locationNamed:(NSString*)name;
-(NSArray*)locationsNearLatitude:(CGFloat)latitude longitude:(CGFloat)longitude margin:(CGFloat)margin;

@end
