//
//  GLWVideoModel.m
//  Flower
//
//  Created by glw on 16/5/7.
//  Copyright © 2016年 glw. All rights reserved.
//

#import "GLWVideoModel.h"
#import <AFNetworking.h>
#import <MJExtension.h>
@implementation GLWVideoModel
+(void)requestVideoWithURLStr:(NSString *)URLStr CallBack:(void (^)(NSArray *, NSError *))callBack{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:URLStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        NSArray *array = [GLWVideoModel mj_objectArrayWithKeyValuesArray:dic[@"content"]];
        callBack(array,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        callBack(nil,error);
        NSLog(@"下载视频失败");
    }];
}
@end
