# NSProxyDemo
NSProxyDemo
该文章介绍NSProxy这个类。
在我理解，主要是一个中介类。
比如我想去卖衣服那里买衣服，我想卖书那里去买书。又不想亲自去，就找个代理一起完成。
SLJBookProvider 是书的提供者。
SLJClothesProvider是衣服的提供者。
SLJDealerProxy这个类就是衣服的代理类。继承自NSProxy这个类。是一个虚类；你可以通过继承它，并重写这两个方法以实现消息转发到另一个实例
这个类有两个方法
- (void)forwardInvocation:(NSInvocation *)anInvocation;
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel;

重写- (void)forwardInvocation:(NSInvocation *)anInvocation，这是NSObject用来在本身不能响应selector时向其他类传递调用时用到的。forwardInvocation:。methodSignatureForSelector:的作用在于为另一个类实现的消息创建一个有效的方法签名，必须实现，并且返回不为空的methodSignature，否则会crash。
SLJDealerProxy重写了这两个类。
在appdelegate中我们就是实现了使用SLJDealerProxy这个类同时调用两个类方法。
