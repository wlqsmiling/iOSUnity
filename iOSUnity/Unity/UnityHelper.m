//
//  UnityHelper.m
//  MultiDisplayDemo
//
//  Created by Nreal on 2023/3/1.
//

#import "UnityHelper.h"

/* UnityFrameworkLoad */
UIKIT_STATIC_INLINE UnityFramework* UnityFrameworkLoad()
{
    NSString* bundlePath = nil;
    bundlePath = [[NSBundle mainBundle] bundlePath];
    bundlePath = [bundlePath stringByAppendingString: @"/Frameworks/UnityFramework.framework"];

    NSBundle* bundle = [NSBundle bundleWithPath: bundlePath];
    if ([bundle isLoaded] == false) [bundle load];

    UnityFramework* ufw = [bundle.principalClass getInstance];
    if (![ufw appController])
    {
        // unity is not initialized
        [ufw setExecuteHeader: &_mh_execute_header];
    }
    return ufw;
}

@interface UnityHelper ()

@end

@implementation UnityHelper


#pragma mark - Unity

- (BOOL)unityIsInitialized
{
    return [self ufw] && [[self ufw] appController];
}

- (void)initUnity:(int)argc argV:(char **)argv launchOptions:(NSDictionary *)launchOptions
{
    /* 判断Unity 是否已经初始化 */
    if ([self unityIsInitialized]){
        [self.ufw.appController.window makeKeyAndVisible];
        return;
    }
    
    /* 初始化Unity */
    self.ufw = UnityFrameworkLoad();
    [self.ufw setDataBundleId:"com.unity3d.framework"];
    [self.ufw registerFrameworkListener:self];

    
    [self.ufw runEmbeddedWithArgc:argc argv:argv appLaunchOpts:launchOptions];
}


@end
