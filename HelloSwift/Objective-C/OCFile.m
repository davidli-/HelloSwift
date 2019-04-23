//
//  OCFile.m
//  HelloSwift
//
//  Created by Macmafia on 2018/9/1.
//  Copyright © 2018年 Macmafia. All rights reserved.
//

#import "OCFile.h"

@interface OCFile()
{
    NSInteger aInte;
}
@property (nonatomic, strong) NSDictionary *aDic;
@end

@implementation OCFile

-(instancetype)init
{
    self = [super init];
    if (self) {
        aDouble = 0.001;
        aInte = 1;
        _aInt = 2;
        _anArr = @[@(123)];
        _aDic = @{@"k1":_anArr};
    }
    return self;
}

- (void)instanceFunction:(Direction)direction
{
    NSLog(@"++++call instance method");
}

+ (void)classFunction
{
    NSLog(@"++++call class method");
}


- (void)bubleSort
{
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@(5),@(8),@(1),@(4),@(2),@(7),@(6),@(3)]];
    NSInteger num = array.count;
    
    for(int i = 0; i < num - 1; i++) {
        
        for(int j = 0; j < num - 1 - i; j++) {
            
            if([array[j] integerValue] < [array[j+1] integerValue]) {
                
                NSNumber *tmp = array[j];
                array[j] = array[j+1];
                array[j+1] = tmp;
            }
        }
    }
    NSLog(@"%@",array);
}

+ (void)quickSort:(NSMutableArray*)array left:(int)left right:(int)right
{
    if (left >= right) {
        return;
    }
    
    int i = left;
    int j = right;
    int key = [array[left] intValue];//取出第1个元素作为参照
    
    while (left < right) {
        //从后向前 找到比key小的元素，放在array[i]处
        while (i<j && [array[j] intValue] >= key) {
            j--;
        }
        array[i] = array[j];
        //从前往后 找到比key大的元素，放在array[j]处
        while (i<j && [array[i] intValue] <= key) {
            i++;
        }
        array[j] = array[i];
    }
    array[i] = @(key);
    
    [self quickSort:array left:left right:i-1];
    [self quickSort:array left:i+1 right:right];
}

//字符串反转 “12345” 变成 "54321"
+ (NSString*)reverseString:(NSString*)str
{
    NSMutableString *result = [[NSMutableString alloc] init];
    NSInteger num = str.length;
    for (int i = 0; i < num; i++) {
        [result appendString:[str substringWithRange:NSMakeRange(num - 1 - i, 1)]];
    }
    return result;
}

//字符反转 "hello word" 变成 “word hello”
+ (NSString *)inputArrayValue:(NSString *)str
{
    NSArray *stringArr = [str componentsSeparatedByString:@" "];
    NSMutableArray *newStringArr = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < stringArr.count; i++) {
        [newStringArr addObject:stringArr[stringArr.count - i - 1]];
    }
    NSString *string = [newStringArr componentsJoinedByString:@" "];
    
    return string;
}

@end
