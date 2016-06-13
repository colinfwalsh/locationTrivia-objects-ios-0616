//
//  FISLocation.m
//  locationTrivia-Objects
//
//  Created by Colin Walsh on 6/13/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocation.h"

@implementation FISLocation

-(instancetype) init{
    self = [self initWithName:@"" latitude:0 longitude:0];
    return self;}
-(instancetype) initWithName:(NSString*)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude{
    self = [super init];
    
    if (self) {
        _trivia = [[NSMutableArray alloc]init];
        _name = name;
        _latitude = latitude;
        _longitude = longitude;
        }
    
    return self;}

-(NSString *)stringByTruncatingNameToLength:(NSUInteger)length{
    
    if (length >= [self.name length]) {
        return self.name;
    }
    else {
        NSString *shortString = [self.name substringToIndex:length];
        return shortString;
    }
}
-(BOOL)hasValidData{
    if ([self.name length] == 0){
        return NO;
    }
    else if(self.latitude > 90 || self.latitude < -90){
        return NO;
    }
    else if(self.longitude >= 180 || self.longitude <= -180){
        return NO;
    }
    else {
        return YES;
    }
}
-(FISTrivium*)triviumWithMostLikes{
    if ([self.trivia count] == 0) {
        return nil;
    }
    else {
        
        NSSortDescriptor *mostLikes = [[NSSortDescriptor alloc] initWithKey:@"likes" ascending:NO];
        
        [self.trivia sortUsingDescriptors:@[mostLikes]];
        
        
        
        return self.trivia[0];
    }
}

@end
