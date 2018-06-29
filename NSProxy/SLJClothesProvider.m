

//
//  SLJClothesProvider.m
//  NSProxy
//
//  Created by mc on 2018/6/29.
//  Copyright © 2018年 苏丽君. All rights reserved.
//

#import "SLJClothesProvider.h"

@implementation SLJClothesProvider
- (void)purchaseClothesWithSize:(SLJClothesSize )size{
    NSString *sizeStr;
    switch (size) {
        case SLJClothesSizeLarge:
            sizeStr = @"large size";
            break;
        case SLJClothesSizeMedium:
            sizeStr = @"medium size";
            break;
        case SLJClothesSizeSmall:
            sizeStr = @"small size";
            break;
        default:
            break;
    }
    NSLog(@"You've bought some clothes of %@",sizeStr);
}

@end
