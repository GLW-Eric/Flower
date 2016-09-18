//
//  GLWImageModel.h
//  Flower
//
//  Created by glw on 16/5/7.
//  Copyright © 2016年 glw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GLWImageModel : NSObject
@property(nonatomic,copy) NSString *url;
@property(nonatomic,copy) NSString *image;
@property(nonatomic,assign) NSInteger width;
@property(nonatomic,assign) NSInteger height;
+(void)requestImageWithURLStr:(NSString *)URLStr CallBack:(void(^)(NSArray *array,NSError *error))callBack;

@end
