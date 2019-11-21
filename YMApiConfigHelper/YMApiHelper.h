//
//  YMApiHelper.h
//  YMApiConfigHelper
//
//  Created by 含包阁 on 2019/11/21.
//  Copyright © 2019 Yormo. All rights reserved.
//

#import "AFNetworking.h"
#import "YMApiConfig.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YMApiHelper : NSObject
+ (void)apiHelperWithMethod:(NSString *)Method
                        url:(NSString *)url
                 parameters:(id)parameter
                 setTimeOut:(NSTimeInterval)timeOutSeconds
                    success:(void (^)(id _Nullable responseObject))success
                    failure:(void (^)(NSError *_Nullable error))failure;
@end

NS_ASSUME_NONNULL_END
