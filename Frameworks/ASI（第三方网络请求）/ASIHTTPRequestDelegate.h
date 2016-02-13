//
//  ASIHTTPRequestDelegate.h
//  Part of ASIHTTPRequest -> http://allseeing-i.com/ASIHTTPRequest
//
//  Created by Ben Copsey on 13/04/2010.
//  Copyright 2010 All-Seeing Interactive. All rights reserved.
//

@class ASIHTTPRequest;

// 定义协议
@protocol ASIHTTPRequestDelegate <NSObject>

@optional

// These are the default delegate methods for request status
// 以下是请求状态的默认代理方法
// You can use different ones by setting didStartSelector / didFinishSelector / didFailSelector
// 可以通过设置 didStartSelector / didFinishSelector / didFailSelector 指定不同的监听方法

// 请求开始
- (void)requestStarted:(ASIHTTPRequest *)request;
// 接收到响应头
- (void)request:(ASIHTTPRequest *)request didReceiveResponseHeaders:(NSDictionary *)responseHeaders;
// 将要重定向
- (void)request:(ASIHTTPRequest *)request willRedirectToURL:(NSURL *)newURL;
// 请求结束
- (void)requestFinished:(ASIHTTPRequest *)request;
// 请求失败
- (void)requestFailed:(ASIHTTPRequest *)request;
// 请求重定向完成
- (void)requestRedirected:(ASIHTTPRequest *)request;

// When a delegate implements this method, it is expected to process all incoming data itself
// This means that responseData / responseString / downloadDestinationPath etc are ignored
// You can have the request call a different method by setting didReceiveDataSelector
// 如果代理实现了此方法，表示希望自己处理所有接收到的数据
// 这意味着 responseData / responseString / downloadDestinationPath 都会被忽略
- (void)request:(ASIHTTPRequest *)request didReceiveData:(NSData *)data;

// If a delegate implements one of these, it will be asked to supply credentials when none are available
// The delegate can then either restart the request ([request retryUsingSuppliedCredentials]) once credentials have been set
// or cancel it ([request cancelAuthentication])
- (void)authenticationNeededForRequest:(ASIHTTPRequest *)request;
- (void)proxyAuthenticationNeededForRequest:(ASIHTTPRequest *)request;

@end
