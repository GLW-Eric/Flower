//
//  GLWNewsModel.h
//  Flower
//
//  Created by glw on 16/5/6.
//  Copyright © 2016年 glw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GLWNewsModel : NSObject
@property (nonatomic,copy) NSString *from;
@property (nonatomic,copy) NSString *picurl;
@property(nonatomic,copy) NSArray *pic_urls;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *url;
@property(nonatomic,copy) NSString *update_time;
@property (nonatomic,copy) NSString *desc;
@property(nonatomic,assign) CGFloat cellHeight;

+(void)requestNewsWithURLStr:(NSString *)URLStr CallBack:(void(^)(NSArray *array,NSError *error)) callBack;
@end
