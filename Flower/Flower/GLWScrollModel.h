//
//  GLWScrollModel.h
//  WuKongTV
//
//  Created by MS on 16-4-15.
//  Copyright (c) 2016年 ms. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GLWScrollModel : NSObject
@property (nonatomic,copy) NSString *pic_url;
@property (nonatomic,copy) NSString *source_url;
@property (nonatomic,copy) NSString *desc;
//@property (nonatomic,copy) NSString *title;
//@property (nonatomic,copy) NSString *url;
//@property (nonatomic,copy) NSString *videoId;
+(void)requestScrollWithCallBack:(void(^)(NSArray *array,NSError *error)) callBack;
@end
