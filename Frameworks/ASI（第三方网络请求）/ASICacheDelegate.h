//
//  ASICacheDelegate.h
//  Part of ASIHTTPRequest -> http://allseeing-i.com/ASIHTTPRequest
//
//  Created by Ben Copsey on 01/05/2010.
//  Copyright 2010 All-Seeing Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ASIHTTPRequest;

// Cache policies control the behaviour of a cache and how requests use the cache
// 缓存策略(Cache Policy)用于控制缓存的行为，以及请求如何使用缓存
//
// When setting a cache policy, you can use a combination of these values as a bitmask
// 设置缓存策略时，可以使用位掩码(按位或)的方式设置以下数值的组合
//
// For example: [request setCachePolicy:ASIAskServerIfModifiedCachePolicy|ASIFallbackToCacheIfLoadFailsCachePolicy|ASIDoNotWriteToCacheCachePolicy];
//
// Note that some of the behaviours below are mutally exclusive - you cannot combine ASIAskServerIfModifiedWhenStaleCachePolicy and ASIAskServerIfModifiedCachePolicy, for example.
// 注意：以下有些缓存功能是独立使用的，不能与其他选项组合使用
// 例如：ASIAskServerIfModifiedWhenStaleCachePolicy 和 ASIAskServerIfModifiedCachePolicy
//
typedef enum _ASICachePolicy {

	// The default cache policy. When you set a request to use this, it will use the cache's defaultCachePolicy
    // 默认缓存策略
	// ASIDownloadCache's default cache policy is 'ASIAskServerIfModifiedWhenStaleCachePolicy'
    // ASIDownloadCache 的默认缓存策略是 ASIAskServerIfModifiedWhenStaleCachePolicy
	ASIUseDefaultCachePolicy = 0,

	// Tell the request not to read from the cache
    // 告诉请求不要从缓存中读取数据
	ASIDoNotReadFromCacheCachePolicy = 1,

	// The the request not to write to the cache
    // 请求不将数据写入缓存
	ASIDoNotWriteToCacheCachePolicy = 2,

	// Ask the server if there is an updated version of this resource (using a conditional GET) ONLY when the cached data is stale
    // 询问服务器是否有资源的更新版本(使用条件 GET)，仅在缓存数据已经失效才会询问
	ASIAskServerIfModifiedWhenStaleCachePolicy = 4,

	// Always ask the server if there is an updated version of this resource (using a conditional GET)
    // 总是询问服务器是否有资源的更新版本(使用条件 GET)
	ASIAskServerIfModifiedCachePolicy = 8,

	// If cached data exists, use it even if it is stale. This means requests will not talk to the server unless the resource they are requesting is not in the cache
    // 如果缓存数据存在，即使已经失效，仍然使用。这意味着只要有缓存数据就不会访问服务器，除非缓存数据不存在才会访问服务器
	ASIOnlyLoadIfNotCachedCachePolicy = 16,

	// If cached data exists, use it even if it is stale. If cached data does not exist, stop (will not set an error on the request)
    // 如果缓存数据存在，即使已经失效，仍然使用。如果缓存数据不存在，停止请求（不会设置请求的错误）
	ASIDontLoadCachePolicy = 32,

	// Specifies that cached data may be used if the request fails. If cached data is used, the request will succeed without error. Usually used in combination with other options above.
    // 指定如果请求失败，使用缓存数据。如果使用缓存数据，请求将返回成功而不是失败。通常与以上其他选项组合使用
	ASIFallbackToCacheIfLoadFailsCachePolicy = 64
} ASICachePolicy;

// Cache storage policies control whether cached data persists between application launches (ASICachePermanentlyCacheStoragePolicy) or not (ASICacheForSessionDurationCacheStoragePolicy)
// 缓存存储策略(Cache Storage Policy) 控制是否持久化缓存数据
//
// Calling [ASIHTTPRequest clearSession] will remove any data stored using ASICacheForSessionDurationCacheStoragePolicy
// 调用 [ASIHTTPRequest clearSession] 将删除使用 ASICacheForSessionDurationCacheStoragePolicy 策略保存的任何数据
//
typedef enum _ASICacheStoragePolicy {
	ASICacheForSessionDurationCacheStoragePolicy = 0,
	ASICachePermanentlyCacheStoragePolicy = 1
} ASICacheStoragePolicy;


@protocol ASICacheDelegate <NSObject>

@required

// Should return the cache policy that will be used when requests have their cache policy set to ASIUseDefaultCachePolicy
// 返回 ASIUseDefaultCachePolicy
- (ASICachePolicy)defaultCachePolicy;

// Returns the date a cached response should expire on. Pass a non-zero max age to specify a custom date.
// 返回缓存响应数据的过期日期，传入一个非 0 最大时限值指定自定义日期
- (NSDate *)expiryDateForRequest:(ASIHTTPRequest *)request maxAge:(NSTimeInterval)maxAge;

// Updates cached response headers with a new expiry date. Pass a non-zero max age to specify a custom date.
// 使用新的过期日期更新缓存的响应头，传入一个非 0 最大时限值指定自定义日期
- (void)updateExpiryForRequest:(ASIHTTPRequest *)request maxAge:(NSTimeInterval)maxAge;

// Looks at the request's cache policy and any cached headers to determine if the cache data is still valid
// 根据请求的缓存策略和对应的缓存响应头，决定缓存数据是否仍然有效
- (BOOL)canUseCachedDataForRequest:(ASIHTTPRequest *)request;

// Removes cached data for a particular request
// 删除指定请求的缓存数据
- (void)removeCachedDataForRequest:(ASIHTTPRequest *)request;

// Should return YES if the cache considers its cached response current for the request
// 返回 YES，如果请求对应的缓存数据当前可用
// Should return NO is the data is not cached, or (for example) if the cached headers state the request should have expired
// 返回 NO，数据没有被缓存，或者(例如)缓存的头状态已经过期
- (BOOL)isCachedDataCurrentForRequest:(ASIHTTPRequest *)request;

// Should store the response for the passed request in the cache
// 在缓存中保存传入请求的响应
// When a non-zero maxAge is passed, it should be used as the expiry time for the cached response
// 如果传入了一个非 0 时限值，会使用该时限作为被缓存响应的过期时间
- (void)storeResponseForRequest:(ASIHTTPRequest *)request maxAge:(NSTimeInterval)maxAge;

// Removes cached data for a particular url
// 删除指定 URL 的缓存数据
- (void)removeCachedDataForURL:(NSURL *)url;

// Should return an NSDictionary of cached headers for the passed URL, if it is stored in the cache
// 如果缓存中存在，返回传入 URL 的缓存头字典
- (NSDictionary *)cachedResponseHeadersForURL:(NSURL *)url;

// Should return the cached body of a response for the passed URL, if it is stored in the cache
// 如果缓存中存在，返回传入 URL 的缓存数据
- (NSData *)cachedResponseDataForURL:(NSURL *)url;

// Returns a path to the cached response data, if it exists
// 如果存在，返回缓存响应数据的路径
- (NSString *)pathToCachedResponseDataForURL:(NSURL *)url;

// Returns a path to the cached response headers, if they url
// 如果存在，返回缓存响应头的路径
- (NSString *)pathToCachedResponseHeadersForURL:(NSURL *)url;

// Returns the location to use to store cached response headers for a particular request
// 返回指定请求的缓存响应头的路径
- (NSString *)pathToStoreCachedResponseHeadersForRequest:(ASIHTTPRequest *)request;

// Returns the location to use to store a cached response body for a particular request
// 返回指定请求的缓存响应数据的路径
- (NSString *)pathToStoreCachedResponseDataForRequest:(ASIHTTPRequest *)request;

// Clear cached data stored for the passed storage policy
// 根据传入的存储策略，清除保存的缓存数据
- (void)clearCachedResponsesForStoragePolicy:(ASICacheStoragePolicy)cachePolicy;

@end
