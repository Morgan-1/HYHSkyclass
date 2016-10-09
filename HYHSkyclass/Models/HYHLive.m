//
//  HYHLive.m
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/8.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import "HYHLive.h"
#import "M3U8Parser.h"
#import "M3U8SegmentInfo.h"
#import "M3U8SegmentInfoList.h"

#import <AVFoundation/AVFoundation.h>

@implementation HYHLive

+ (UIImage *)getThumbnailImage:(HYHLive *)liveModel{
    NSString *videoURL = LivePath(liveModel.serverpath, liveModel.location, liveModel.videopath);
    
    //NSData *videoData = [NSData dataWithContentsOfURL:[NSURL URLWithString:videoURL]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:videoURL]];
    NSData *videoData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSString *tmpStr = [[NSString alloc] initWithData:videoData encoding:NSUTF8StringEncoding];
    //M3U8SegmentInfoList *m3u8List = [M3U8Parser m3u8SegmentInfoListFromData:videoData];
    //M3U8SegmentInfo *m3u8Item = [m3u8List segmentInfoAtIndex:0];
    
    
    
    CQLog(@"-------> tmpStr : %@" , tmpStr);
    
    if(![tmpStr hasPrefix:@"#EXTM3U"]){
        return nil;
    }
    
    NSArray *strArray = [tmpStr componentsSeparatedByString:@"\n"];
    
    
    NSURL *realURL = [NSURL URLWithString: strArray[6]];
    
    CQLog(@"-------> realURL : %@" , realURL);
    
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:realURL options:nil];
    AVAssetImageGenerator *gen = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    
    gen.appliesPreferredTrackTransform = YES;
    
    CMTime time = CMTimeMake(0.0, 10);
    
    NSError *error = nil;
    
    CMTime actualTime ;
    
    CGImageRef cgImage = [gen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    
    if(error){
        CQLog(@"------------> error when get the picture of the video... :\n %@", error);
        return nil;
    }
    
    CMTimeShow(actualTime);
    
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    
    CGImageRelease(cgImage);
    
    return image;
}
@end
