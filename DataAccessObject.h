//
//  DataAccessObject.h
//  Kidedu
//
//  Created by Robert Baghai on 4/22/16.
//  Copyright © 2016 Tamar Kandathi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataAccessObject : NSObject

@property (nonatomic, strong) NSMutableArray *afterSchoolPrograms;


- (void)fetchNewYorkCityProgramData;
+ (instancetype)sharedInstance;


@end
