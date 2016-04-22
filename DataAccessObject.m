//
//  DataAccessObject.m
//  Kidedu
//
//  Created by Robert Baghai on 4/22/16.
//  Copyright © 2016 Tamar Kandathi. All rights reserved.
//

#import "DataAccessObject.h"
#import "AfterSchoolProgram.h"

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
            NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            self.afterSchoolPrograms        = [NSMutableArray new];
            
            for (NSDictionary *dictionary in array) {
                if ([[dictionary valueForKey:@"program_type"] isEqualToString:@"After-School Programs"]) {
                    //create AfterSchoolProgram objects using the dictionary... and add that object to thew newYorkData array
                    AfterSchoolProgram *program = [[AfterSchoolProgram alloc] init];
                    program.borough = [dictionary valueForKey:@"borough_community"];
                    program.siteName = [dictionary valueForKey:@"site_name"];
                    program.programName = [dictionary valueForKey:@"program"];
                    program.gradeLevel   = [dictionary valueForKey:@"grade_level_age_group"];
                    program.contactNumber = [dictionary valueForKey:@"contact_number"];
                    [self.afterSchoolPrograms addObject:program];
                }
            }

        }
    }] resume];
}




@end
