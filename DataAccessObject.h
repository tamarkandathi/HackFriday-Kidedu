//
//  DataAccessObject.h
//  Kidedu
//
//  Created by Robert Baghai on 4/22/16.
//  Copyright © 2016 Tamar Kandathi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataAccessObject : NSObject

- (void)fetchNewYorkCityProgramData;
+ (instancetype)sharedInstance;


@end
