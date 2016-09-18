//
//  GLWEncyClassModel.h
//  Flower
//
//  Created by glw on 16/5/8.
//  Copyright © 2016年 glw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GLWEncyClassModel : NSObject
@property(nonatomic,copy) NSString *ID;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *summary;
@property(nonatomic,copy) NSString *image_url;
+(void)requestEncyWithURLStr:(NSString *)URLStr CallBack:(void(^)(NSArray *array,NSError *error)) callBack;
@end
