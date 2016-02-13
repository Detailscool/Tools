//
//  ASIHTTPRequestConfig.h
//  Part of ASIHTTPRequest -> http://allseeing-i.com/ASIHTTPRequest
//
//  Created by Ben Copsey on 14/12/2009.
//  Copyright 2009 All-Seeing Interactive. All rights reserved.
//


// ======
// Debug output configuration options
// 调试输出配置选项
// ======

// If defined will use the specified function for debug logging
// 如果定义将使用指定的函数输出调试日志
// Otherwise use NSLog
// 否则使用 NSLog
#ifndef ASI_DEBUG_LOG
    #define ASI_DEBUG_LOG NSLog
#endif

// When set to 1 ASIHTTPRequests will print information about what a request is doing
// 如果设置为1，ASIHTTPRequest 将在控制台打印当前请求相关操作的信息
#ifndef DEBUG_REQUEST_STATUS
	#define DEBUG_REQUEST_STATUS 0
#endif

// When set to 1, ASIFormDataRequests will print information about the request body to the console
// 如果设置为1，ASIFormDataRequests 将在控制台打印有关"请求体"的信息
#ifndef DEBUG_FORM_DATA_REQUEST
	#define DEBUG_FORM_DATA_REQUEST 0
#endif

// When set to 1, ASIHTTPRequests will print information about bandwidth throttling to the console
// 如果设置为1，ASIHTTPRequests 将在控制台打印有关"带宽限制"的信息
#ifndef DEBUG_THROTTLING
	#define DEBUG_THROTTLING 0
#endif

// When set to 1, ASIHTTPRequests will print information about persistent connections to the console
// 如果设置为1，ASIHTTPRequests 将在控制台打印有关"持久化连接"的信息
#ifndef DEBUG_PERSISTENT_CONNECTIONS
	#define DEBUG_PERSISTENT_CONNECTIONS 0
#endif

// When set to 1, ASIHTTPRequests will print information about HTTP authentication (Basic, Digest or NTLM) to the console
// 如果设置为1，ASIHTTPRequests 将在控制台打印有关"HTTP验证(Basic, Digest or NTLM)"的信息
#ifndef DEBUG_HTTP_AUTHENTICATION
    #define DEBUG_HTTP_AUTHENTICATION 0
#endif
