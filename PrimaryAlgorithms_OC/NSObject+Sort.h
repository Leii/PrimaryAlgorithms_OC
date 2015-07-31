//
//  NSObject+Sort.h
//  PrimaryAlgorithms_OC
//
//  Created by Lei on 15/7/31.
//  Copyright (c) 2015年 Leii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Sort)

- (void) quickSort:(NSMutableArray *)arr from:(int) low to:(int)high;
- (void) heapSort :(NSMutableArray *)arr length:(int)length;
- (void) mergeSort:(NSMutableArray *)arr outArray:(NSMutableArray *)tempArr from:(int)low to:(int)high;
- (void) shellSort:(NSMutableArray *)arr length:(int)length;

@end
