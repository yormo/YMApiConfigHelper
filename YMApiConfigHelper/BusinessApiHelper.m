//
//  BusinessApiHelper.m
//  YMApiConfigHelper
//
//  Created by 含包阁 on 2019/11/21.
//  Copyright © 2019 Yormo. All rights reserved.
//

#import "BusinessApiHelper.h"
#import "YMApiHelper.h"

@implementation BusinessApiHelper
+ (void)getSomethineWithWithParams:(NSDictionary *)params
                          complete:(void (^)(NSArray *dataList, NSError *error))complete {
    NSString *apiURL = [NSString stringWithFormat:@"%@%@", UAT_DOMAIN, @"/xxx/V1/getmemberprofile"];

    NSMutableDictionary *parameters = @{
        @"sso_uid" : @"001"
    }.mutableCopy;
    
    [parameters addEntriesFromDictionary:params];
    [YMApiHelper apiHelperWithMethod:@"GET"
                                 url:apiURL
                          parameters:parameters
                          setTimeOut:50.f
                             success:^(id _Nullable responseObject) {
                                    NSMutableArray *objs = [NSMutableArray new];
                                    if ([responseObject[@"ret_code"] isEqualToString:@"200"]) {
                                        NSObject *obj = [[NSObject alloc] init]; // json to model
                                        [objs addObject:obj];
                                    }
                                    complete(objs, nil);
                                }
                             failure:^(NSError *_Nullable error) {
                                    complete(nil, error);
                                }
     ];
}
@end
