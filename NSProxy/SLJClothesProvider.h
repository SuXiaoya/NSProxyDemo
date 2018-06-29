//
//  SLJClothesProvider.h
//  NSProxy
//
//  Created by mc on 2018/6/29.
//  Copyright © 2018年 苏丽君. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM (NSInteger, SLJClothesSize){
    SLJClothesSizeSmall = 0,
    SLJClothesSizeMedium,
    SLJClothesSizeLarge
};
@protocol SLJClothesProviderProtocol
- (void)purchaseClothesWithSize:(SLJClothesSize)size;
@end
@interface SLJClothesProvider : NSObject

@end
