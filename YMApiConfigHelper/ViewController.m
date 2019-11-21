//
//  ViewController.m
//  YMApiConfigHelper
//
//  Created by 含包阁 on 2019/11/21.
//  Copyright © 2019 Yormo. All rights reserved.
//

#import "ViewController.h"
#import "BusinessApiHelper.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *params = @{
        @"get_id" : @"001"
    };
    [BusinessApiHelper getSomethineWithWithParams:params
                                         complete:^(NSArray *_Nonnull dataList, NSError *_Nonnull error) {
                                             if (dataList) {
                                                 // do something with the data
                                             } else {
                                                 // some error occurred, 'error' variable should not be nil by contract
                                                 //Apple 提供的一些同步接口在成功状态下向 error 参数（如果非 NULL) 写入了垃圾值，所以检查 error 的值可能出现问题。
                                             }
                                         }];
}


@end
