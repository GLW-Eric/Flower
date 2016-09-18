//
//  GLWSubHomeModel.h
//  Flower
//
//  Created by glw on 16/5/5.
//  Copyright © 2016年 glw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GLWSubHomeModel : NSObject
@property(nonatomic,copy) NSString *ID;
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *summary;

+(void)requestNewArtWithURLStr:(NSString *)URLStr CallBack:(void(^)(NSArray *array,NSError *error)) callBack;

@end
