//
//  OCFile.h
//  HelloSwift
//
//  Created by Macmafia on 2018/9/1.
//  Copyright © 2018年 Macmafia. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, Direction) {
    DirectionEast,
    DirectionWest,
    DirectionSouth,
    DirectionNorth,
};

@interface OCFile : NSObject
{
    double aDouble;
}
@property (nonatomic, assign) int aInt;
@property (nonatomic, strong, nonnull) NSArray *anArr;
@property (nonatomic, copy, nonnull) NSString *str;

- (void)instanceFunction:(Direction)direction;
+ (void)classFunction;
+ (NSString*_Nonnull)reverseString:(NSString*_Nonnull)str;
@end
