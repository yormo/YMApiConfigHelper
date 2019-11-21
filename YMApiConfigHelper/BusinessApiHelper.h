//
//  BusinessApiHelper.h
//  YMApiConfigHelper
//
//  Created by 含包阁 on 2019/11/21.
//  Copyright © 2019 Yormo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BusinessApiHelper : NSObject


/*
 若 objects 不为 nil，则 error 必须为 nil
 若 objects 为 nil，则 error 必须不为 nil
 */

+ (void)getSomethineWithWithParams:(nullable NSDictionary *)params
                          complete:(void (^)(NSArray *dataList, NSError *error))complete;

@end

NS_ASSUME_NONNULL_END
