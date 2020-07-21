//
//  OYOViewController.m
//  CocoapodDemo
//
//  Created by zhou_ming1218@163.com on 07/21/2020.
//  Copyright (c) 2020 zhou_ming1218@163.com. All rights reserved.
//

#import "OYOViewController.h"
#import "NSString+Validate.h"

@interface OYOViewController ()

@end

@implementation OYOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    BOOL test = [NSString isAllNum:@"abc"];
    NSLog(@"test==%d", test);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
