//
//  GLWSubHomeModel.m
//  Flower
//
//  Created by glw on 16/5/5.
//  Copyright © 2016年 glw. All rights reserved.
//

#import "GLWSubHomeModel.h"
#import <MJExtension.h>
#import <AFNetworking.h>
@implementation GLWSubHomeModel

+(void)requestNewArtWithURLStr:(NSString *)URLStr CallBack:(void (^)(NSArray *, NSError *))callBack{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:URLStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSDictionary *dict = dic[@"value"];
        NSArray *array = [GLWSubHomeModel mj_objectArrayWithKeyValuesArray:dict[@"articlelist"]];
        callBack(array,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        callBack(nil,error);
        NSLog(@"新文章下载失败");
    }];
}

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}


@end
