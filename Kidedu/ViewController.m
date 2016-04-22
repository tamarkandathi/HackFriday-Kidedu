//
//  ViewController.m
//  Kidedu
//
//  Created by Tamar on 4/22/16.
//  Copyright © 2016 Tamar Kandathi. All rights reserved.
//

#import "ViewController.h"
#import "DataAccessObject.h"

@interface ViewController ()

@property (nonatomic, strong) DataAccessObject *dao;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dao = [DataAccessObject sharedInstance];
    [self.dao fetchNewYorkCityProgramData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
