//
//  ViewController.m
//  PrimaryAlgorithms_OC
//
//  Created by Lei on 15/7/31.
//  Copyright (c) 2015年 Leii. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Sort.h"

@interface ViewController ()

@property (nonatomic) NSMutableArray *testArray;
@property (nonatomic) NSMutableArray *tempArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //init array
    _testArray = [NSMutableArray arrayWithArray: @[@20,@45,@4,@7,@23,@78,@12,@31,@2,@10]];
    _tempArray = [NSMutableArray arrayWithArray:_testArray];
    int length = (int)_testArray.count;
    
    //test
    [self shellSort:_testArray length:length];
    //  [self quickSort:_testArray from:0 to:length-1];
    //  [self heapSort:_testArray length:length];
    //  [self mergeSort:_testArray outArray:_tempArray from:0 to:length-1];
    
    NSLog(@"%@",_testArray.description);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
