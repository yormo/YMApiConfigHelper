//
//  YMApiHelper.m
//  YMApiConfigHelper
//
//  Created by 含包阁 on 2019/11/21.
//  Copyright © 2019 Yormo. All rights reserved.
//

#import "YMApiHelper.h"

@implementation YMApiHelper
+ (void)apiHelperWithMethod:(NSString *)Method
                        url:(NSString *)url
                 parameters:(id)parameter
                 setTimeOut:(NSTimeInterval)timeOutSeconds
                    success:(void (^)(id _Nullable responseObject))success
                    failure:(void (^)(NSError *_Nullable error))failure {
    NSMutableDictionary *parameters = [parameter mutableCopy];

    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.timeoutIntervalForRequest = timeOutSeconds;
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:config];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:Method URLString:url parameters:parameters error:nil];
    [self setHeadForRequest:req];
    [[manager dataTaskWithRequest:req
                completionHandler:^(NSURLResponse *_Nonnull response, id _Nullable responseObject, NSError *_Nullable error) {
                    if (!error) {
                        success([NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil]);
                    } else {
                        NSLog(@"AFNetworking Error:%@, URL:%@", error.userInfo, error.userInfo[@"NSErrorFailingURLKey"]);
                        failure(error);
                    }
                }] resume];
}

+ (void)setHeadForRequest:(id)req {
    //    [req setValue:@"satToken" forHTTPHeaderField:@"SAT-Key"];
}

@end
