
//
//  HYHHttpTool.m
//  HYHSkyclass
//
//  Created by yunhuihuang on 2016/10/9.
//  Copyright © 2016年 yhhuang. All rights reserved.
//

#import "HYHHttpTool.h"
#import "AFNetworking.h"
@implementation HYHHttpTool

+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure{

    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.requestSerializer.timeoutInterval = 20.f;
    [session GET:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure{

    NSLog(@"post");
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [session POST:url parameters:params  progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
    
}


+ (void)post:(NSString *)url params:(NSDictionary *)params constructingBodyWithBlock:(void (^)(id))block success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    [session POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        block(formData); //协议问题还没有解决
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

+ (void)soap:(NSString *)url params:(NSDictionary *)params success:(void (^)(NSString *))success failure:(void (^)(NSError *))failure{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *soapMessage = @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
        "<soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\">\n"
        "<soap12:Body>\n"
        "<GetPublicCourseList xmlns=\"http://tempuri.org/\" />\n"
        "</soap12:Body>\n"
        "</soap12:Envelope>\n";
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
        [request setValue:@"application/soap+xml" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPMethod:@"POST"];
        
        [request setHTTPBody:[soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
        
        NSURLResponse *response;
        NSError *error;
        NSData *result = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        NSString *xmls = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
        
        if(success && xmls && xmls.length){
            dispatch_async(dispatch_get_main_queue(), ^{
                success(xmls);
            });
        }
        else if(failure){
            dispatch_async(dispatch_get_main_queue(), ^{
                failure(error);
            });
        }
    });
}

+ (void)cus_post:(NSString *)url params:(NSString *)params success:(void (^)(NSString *returnStr))success failure:(void (^)(NSError *))failure{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLResponse *response;
    NSError *error;
    NSData *result = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if(result){
        NSString *resultStr = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
        
        success(resultStr);
    }
    
}

+ (void)cus_get:(NSString *)url params:(NSString *)params success:(void (^)(NSString *))success failure:(void (^)(NSError *))failure{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
        [request setHTTPMethod:@"GET"];
        
        NSURLResponse *response;
        NSError *error;
        NSData *result = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        if(result){
            NSString *resultStr = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
            dispatch_async(dispatch_get_main_queue(), ^{
                success(resultStr);
            });
        }
        else if (error){
            dispatch_async(dispatch_get_main_queue(), ^{
                failure(error);
            });
        }
    });
}

+ (BOOL)isNetworkReachable{
    BOOL net = [AFNetworkReachabilityManager sharedManager].reachable;
    return net;
}

+ (BOOL)isDomainReacheable:(NSString *)domain{
    
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager managerForDomain:domain];
    
    return manager.isReachable;
}
@end
