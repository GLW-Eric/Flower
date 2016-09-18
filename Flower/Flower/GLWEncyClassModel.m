//
//  GLWEncyClassModel.m
//  Flower
//
//  Created by glw on 16/5/8.
//  Copyright © 2016年 glw. All rights reserved.
//

#import "GLWEncyClassModel.h"
#import <AFNetworking.h>
#import <MJExtension.h>
@implementation GLWEncyClassModel


+(void)requestEncyWithURLStr:(NSString *)URLStr CallBack:(void (^)(NSArray *, NSError *))callBack{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:URLStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSDictionary *dict = dic[@"value"];
        NSArray *array = [GLWEncyClassModel mj_objectArrayWithKeyValuesArray:dict[@"articlelist"]];
        callBack(array,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        callBack(nil,error);
        NSLog(@"百科分类下载失败");
    }];
}

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}


@end
