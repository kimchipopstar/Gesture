//
//  TapViewController.m
//  Gestures
//
//  Created by Jaewon Kim on 2017-08-03.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()


@end

@implementation TapViewController

-(void)viewDidLoad{
    CGFloat width = 100;
    CGFloat height = 100;
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds)-height/2, width, height);
    
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    
    UITapGestureRecognizer *tapGestrue = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTapped:)];
    [view addGestureRecognizer:tapGestrue];

    
    
    
}

-(void)viewTapped:(UITapGestureRecognizer*)sender{
    
    sender.view.backgroundColor = [sender.view.backgroundColor isEqual: [UIColor purpleColor]] ? [UIColor orangeColor] : [UIColor purpleColor];
    
}


@end
