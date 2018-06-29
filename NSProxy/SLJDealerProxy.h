//
//  SLJDealerProxy.h
//  NSProxy
//
//  Created by mc on 2018/6/29.
//  Copyright © 2018年 苏丽君. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLJBookProvider.h"
#import "SLJClothesProvider.h"
@interface SLJDealerProxy : NSProxy<SLJBookProviderProtocol,SLJClothesProviderProtocol>
+ (instancetype )dealerProxy;
@end
