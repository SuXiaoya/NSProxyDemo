
//
//  SLJDealerProxy.m
//  NSProxy
//
//  Created by mc on 2018/6/29.
//  Copyright © 2018年 苏丽君. All rights reserved.
//

#import "SLJDealerProxy.h"
#import <objc/runtime.h>
@interface SLJDealerProxy()
{
    SLJBookProvider    *_bookProvider;
    SLJClothesProvider *_clothesProvider;
    NSMutableDictionary *_methodsMap;
    
}
@end
@implementation SLJDealerProxy
#pragma mark - class method
+(instancetype)dealerProxy{
    return [[self alloc]init];
}
#pragma mark - init
-(instancetype)init{
    _methodsMap = [NSMutableDictionary dictionary];
    _bookProvider = [[SLJBookProvider alloc]init];
    _clothesProvider = [[SLJClothesProvider alloc]init];
    [self _registerMethodsWithTarget:_bookProvider];
    [self _registerMethodsWithTarget:_clothesProvider];
    return self;
}
-(void)_registerMethodsWithTarget:(id)target{
    unsigned int numerOfMethods = 0;
    Method *method_list = class_copyMethodList([target class], &numerOfMethods);
    for (int i = 0; i < numerOfMethods; i++) {
        Method temp_method = method_list[i];
        SEL temp_sel = method_getName(temp_method);
        const char *temp_method_name = sel_getName(temp_sel);
        [_methodsMap setObject:target forKey:[NSString stringWithUTF8String:temp_method_name]];
    }
    free(method_list);
}
#pragma mark - NSProtxy override methods
-(void)forwardInvocation:(NSInvocation *)invocation{
    SEL sel = invocation.selector;
    NSString *methodName = NSStringFromSelector(sel);
    id target  = _methodsMap[methodName];
    if (target && [target respondsToSelector:sel]) {
        [invocation invokeWithTarget:target];
    }else{
        [super forwardInvocation:invocation];
    }
    
}
-(NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    NSString *methodName = NSStringFromSelector(sel);
    id target = _methodsMap[methodName];
    if (target && [target respondsToSelector:sel]) {
        return [target methodSignatureForSelector:sel];
    }else{
        return [super methodSignatureForSelector:sel];
    }
}
@end
