//
//  SLJBookProvider.h
//  NSProxy
//
//  Created by mc on 2018/6/29.
//  Copyright © 2018年 苏丽君. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SLJBookProviderProtocol
-(void)purchaseBookWithTitle:(NSString *)boolTitle;
@end
@interface SLJBookProvider : NSObject


@end
