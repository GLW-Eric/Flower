//
//  GLWNewsModel.m
//  Flower
//
//  Created by glw on 16/5/6.
//  Copyright © 2016年 glw. All rights reserved.
//

#import "GLWNewsModel.h"
#import <AFNetworking.h>
#import <MJExtension.h>
@implementation GLWNewsModel
+(void)requestNewsWithURLStr:(NSString *)URLStr CallBack:(void (^)(NSArray *, NSError *))callBack{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:URLStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSArray *array = [GLWNewsModel mj_objectArrayWithKeyValuesArray:dic[@"content"]];
        callBack(array,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        callBack(nil,error);
        NSLog(@"新闻下载失败");
    }];
}

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"desc":@"description"};
}

@end
