//
//  GLWImageModel.m
//  Flower
//
//  Created by glw on 16/5/7.
//  Copyright © 2016年 glw. All rights reserved.
//

#import "GLWImageModel.h"
#import <AFNetworking.h>
#import <MJExtension.h>
@implementation GLWImageModel


+(void)requestImageWithURLStr:(NSString *)URLStr CallBack:(void (^)(NSArray *, NSError *))callBack{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:URLStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSArray *array = [GLWImageModel mj_objectArrayWithKeyValuesArray:dic[@"content"]];
        callBack(array,nil);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"下载图片失败");
    }];
    
}



@end
