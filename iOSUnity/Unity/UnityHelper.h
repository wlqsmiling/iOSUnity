//
//  UnityHelper.h
//  MultiDisplayDemo
//
//  Created by Nreal on 2023/3/1.
//

#import <Foundation/Foundation.h>
#include <UnityFramework/UnityFramework.h>

NS_ASSUME_NONNULL_BEGIN

@interface UnityHelper : NSObject<UnityFrameworkListener>
@property (nonatomic,strong) UnityFramework *ufw;

- (void)initUnity:(int)argc argV:(char **)argv launchOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
