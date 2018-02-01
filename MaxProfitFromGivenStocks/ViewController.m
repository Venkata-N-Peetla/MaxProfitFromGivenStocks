//
//  ViewController.m
//  MaxProfitFromGivenStocks
//
//  Created by Venkata Narasimham Peetla on 1/31/18.
//  Copyright © 2018 PEETLA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSNumber *profit = GetMaximumProfitFromGivenStocksArray(@[@10, @30, @5, @35, @40], 6);
    NSLog(@"Profit value = %ld", profit.integerValue);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Greedy algorithm:
NSNumber *GetMaximumProfitFromGivenStocksArray(NSArray<NSNumber *> *stocksInputArray, NSUInteger lenghth) {

    NSInteger maxProfit;
    NSInteger minPrice;

    NSCAssert(lenghth > 2, @"We need minimum two get max profit");

    minPrice = stocksInputArray[0].integerValue;
    maxProfit = stocksInputArray[1].integerValue - stocksInputArray[0].integerValue;

    for (NSUInteger i = 1; i < lenghth-1; i++) {
        NSInteger currentPrice = stocksInputArray[i].integerValue;
        NSInteger potentialProfit = currentPrice - minPrice;
        maxProfit = MAX(maxProfit, potentialProfit);
        minPrice = MIN(minPrice, currentPrice);
    }

    return @(maxProfit);

}

@end
