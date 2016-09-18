//
//  GLWVideoModel.h
//  Flower
//
//  Created by glw on 16/5/7.
//  Copyright © 2016年 glw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GLWVideoModel : NSObject
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *url;
@property(nonatomic,copy) NSString *time;
@property(nonatomic,copy) NSString *source;
@property(nonatomic,copy) NSString *picurl;

+(void)requestVideoWithURLStr:(NSString *)URLStr CallBack:(void(^)(NSArray *array,NSError *error))callBack;
@end
