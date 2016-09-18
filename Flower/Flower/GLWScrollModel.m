//
//  GLWScrollModel.m
//  WuKongTV
//
//  Created by MS on 16-4-15.
//  Copyright (c) 2016年 ms. All rights reserved.
//

#import "GLWScrollModel.h"
#import <AFNetworking.h>
#import <MJExtension.h>

@implementation GLWScrollModel
//封装下载数据，并回传数据源
+(void)requestScrollWithCallBack:(void (^)(NSArray *array, NSError *error))callBack{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:@"http://www1.baike.com/api.php?m=shaiwu&a=list&baike_id=8869&count=5&page=1&type=new" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"下载滚动图片成功");
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSDictionary *dic = dict[@"value"];
        NSArray *array = [GLWScrollModel mj_objectArrayWithKeyValuesArray:dic[@"result"]];
        callBack(array,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"下载滚动图片失败");
    }];
}

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"desc":@"description"};
}


@end
