
#define Singleton_h(name) + (instancetype)shared##name;

#if !__has_feature(objc_arc) // 非 ARC 环境
    #define Singleton_m(name)\
    static id instance;\
    + (instancetype)allocWithZone:(struct _NSZone *)zone{ \
        static dispatch_once_t onceToken; \
        dispatch_once(&onceToken, ^{ \
            instance = [super allocWithZone:zone];\
            });\
        return instance;\
        }\
    - (id)copyWithZone:(NSZone *)zone {\
        return self;\
        }\
    + (instancetype)shared##name {\
        return [[self alloc] init];\
        }\
    - (oneway void)release {\
        }\
    \
    - (instancetype)autorelease {\
        return self;\
        }\
    \
    - (instancetype)retain {\
        return self;\
        }\
    \
    - (NSUInteger)retainCount {\
        return 1;\
        }
#else // ARC环境
    #define Singleton_m(name)\
    static id instance; \
    + (instancetype)allocWithZone:(struct _NSZone *)zone{ \
        static dispatch_once_t onceToken; \
        dispatch_once(&onceToken, ^{ \
        instance = [super allocWithZone:zone];\
    });\
        return instance;\
    }\
    - (id)copyWithZone:(NSZone *)zone {\
        return self;\
    }\
    + (instancetype)shared##name {\
        return [[self alloc] init];\
    }
#endif
