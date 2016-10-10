//
//  NSString+HYHUtils.m
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/10.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import "NSString+HYHUtils.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (HYHUtils)

- (NSString *)trim{

    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)md5{

    const char *cStr = [self UTF8String];
    unsigned char result [CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    NSMutableString *md5 = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [md5 appendFormat:@"%02x",result[i] ];
    }
    return md5;
}


- (NSString *)relativePath{

    NSString *sandboxPath = NSHomeDirectory();
    if ([self hasSuffix:sandboxPath]) {
        return [self substringFromIndex:sandboxPath.length];
    }
    return self;
}

@end

@implementation NSString (HYHFormat)

+ (NSString *)formattedTimeStringFromSeconds:(NSInteger)seconds{

    NSInteger min = seconds / 60;
    NSInteger sec = seconds - 60 *min;
    return [NSString stringWithFormat:@"%02li:%02li",(long)min, (long)sec];
}

@end


