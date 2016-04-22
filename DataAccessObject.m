//
//  DataAccessObject.m
//  Kidedu
//
//  Created by Robert Baghai on 4/22/16.
//  Copyright © 2016 Tamar Kandathi. All rights reserved.
//

#import "DataAccessObject.h"
@import UIKit;

@implementation DataAccessObject

+ (instancetype)sharedInstance {
    static dispatch_once_t cp_singleton_once_token;
    static DataAccessObject *sharedInstance;
    dispatch_once(&cp_singleton_once_token, ^{
        sharedInstance             = [[self alloc] init];
    });
    return sharedInstance;
}


- (void)fetchNewYorkCityProgramData {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL        *url     = [NSURL URLWithString:@"https://data.cityofnewyork.us/resource/btx2-u66x.json"];
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            //handle error here
            NSLog(@"Error -- %@, %@",error.userInfo, error.localizedDescription);
        } else {
            NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
//            for (NSString *value in dictionary) {
//                
//                
//            }

            NSLog(@"%@",dictionary);
            
        }
    }] resume];
}


@end
