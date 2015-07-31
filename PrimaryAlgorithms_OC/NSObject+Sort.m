//
//  NSObject+Sort.m
//  PrimaryAlgorithms_OC
//
//  Created by Lei on 15/7/31.
//  Copyright (c) 2015年 Leii. All rights reserved.
//

#import "NSObject+Sort.h"

@implementation NSObject (Sort)

#pragma mark - Sort

//Quick Sort
- (int) quickSortUnit:(NSMutableArray *)arr from:(int)low to:(int)high {
    //sort unit
    int first = low;
    int last = high;
    int key = (int)[arr[first] integerValue];
    while (first<last) {
        while (first<last&&[arr[last] integerValue]>key) {
            --last;
        }
        [arr replaceObjectAtIndex:first withObject:arr[last]];
        while (first<last&&[arr[first] integerValue]<key) {
            ++first;
        }
        [arr replaceObjectAtIndex:last withObject:arr[first]];
    }
    [arr replaceObjectAtIndex:first withObject:[NSNumber numberWithInt:key]];
    return first;
}

- (void) quickSort:(NSMutableArray *)arr from:(int) low to:(int)high {
    if (low >high) {
        return ;
    }
    int keyIndex = [self quickSortUnit:arr from:low to:high];
    //recursion
    [self quickSort:arr from:low to:keyIndex-1];
    [self quickSort:arr from:keyIndex+1 to:high];
}

//Heap Sort
- (void) heapAjust:(NSMutableArray *)arr parentIndex:(int)nParent length:(int)length {
    int nChild = 2*nParent+1;//index of left child
    while (nChild<length) {
        if (nChild+1<length&&arr[nChild+1]>arr[nChild]) {
            nChild++;
        }
        if (arr[nParent]>arr[nChild]) {
            break;
        }
        [arr exchangeObjectAtIndex:nParent withObjectAtIndex:nChild];
        nParent = nChild;
        nChild = 2*nParent+1;
    }
}

- (void) heapSort:(NSMutableArray *)arr length:(int)length {
    for (int i=length/2-1; i>=0; --i) {
        [self heapAjust:arr parentIndex:i length:length];
    }
    for (int i= length-1; i>0; --i) {
        [arr exchangeObjectAtIndex:0 withObjectAtIndex:i];
        [self heapAjust:arr parentIndex:0 length:i];
    }
}

//Merge Sort
- (void) mergeUnit:(NSMutableArray *)arr outArray:(NSMutableArray *)tempArr from:(int)start mid:(int)mid to:(int)end {
    int i = start;
    int j = mid+1;
    int k = start;
    while (i<=mid&&j<=end) {
        if (arr[i]>arr[j]) {
            tempArr[k++] = arr[i++];
        }else {
            tempArr[k++] = arr[j++];
        }
    }
    while (i<=mid) {
        tempArr[k++] = arr[i++];
    }
    while (j<=end) {
        tempArr[k++] = arr[j++];
    }
    for (i=start; i<=end; i++) {
        arr[i]=tempArr[i];
    }
}

- (void) mergeSort:(NSMutableArray *)arr outArray:(NSMutableArray *)tempArr from:(int)low to:(int)high {
    if (low<high) {
        int mid = (high+low)/2;
        [self mergeSort:arr outArray:tempArr from:low to:mid];
        [self mergeSort:arr outArray:tempArr from:mid+1 to:high];
        [self mergeUnit:arr outArray:tempArr from:low mid:mid to:high];
    }
}

//Shell Sort
- (void) shellSort:(NSMutableArray *)arr length:(int)length {
    int group,i,j;
    for (group = length/2; group>0; group /= 2) {
        for (i = group; i<length; i++) {
            for (j=i-group; j>=0; j--) {
                if (arr[j]<arr[j+group]) {
                    [arr exchangeObjectAtIndex:j withObjectAtIndex:j+group];
                }
            }
        }
    }
    
}


@end
