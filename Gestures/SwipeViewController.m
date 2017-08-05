//
//  SwipeViewController.m
//  Gestures
//
//  Created by Jaewon Kim on 2017-08-04.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()

@property (nonatomic, strong) UIView *whiteView;
@property (nonatomic, strong) UIView *brownView;
//@property (weak, nonatomic) IBOutlet UIView *brownView;
//@property (weak, nonatomic) IBOutlet UIView *whiteView;
//@property (assign, nonatomic) CGPoint leftCenter;
//@property (assign, nonatomic) CGPoint rightCenter;
@property BOOL isOpened;

@end

@implementation SwipeViewController

-(void)viewDidLoad{
    
    self.brownView = [[UIView alloc]initWithFrame:CGRectZero];
    self.brownView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:self.brownView];
    self.brownView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint constraintWithItem:self.brownView attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:30].active=YES;
    
    [NSLayoutConstraint constraintWithItem:self.brownView attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:300].active=YES;
    
    [NSLayoutConstraint constraintWithItem:self.brownView attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0].active=YES;
    
    [NSLayoutConstraint constraintWithItem:self.brownView attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.0
                                  constant:0].active=YES;
 
    self.whiteView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 30)];
    self.whiteView.backgroundColor = [UIColor whiteColor];
    [self.brownView addSubview:self.whiteView];
    
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipped:)];
    [self.whiteView addGestureRecognizer:swipeGesture];
}

-(void)swipped:(UISwipeGestureRecognizer*)sender{
    if (self.isOpened) {
        sender.direction = UISwipeGestureRecognizerDirectionRight;
        self.isOpened = NO;
        self.whiteView.frame =  CGRectMake( -100, 0, self.whiteView.frame.size.width, self.whiteView.frame.size.height );
        
    } else{
        sender.direction = UISwipeGestureRecognizerDirectionLeft;
        self.isOpened = YES;
        self.whiteView.frame =  CGRectMake( 0, 0, self.whiteView.frame.size.width, self.whiteView.frame.size.height );
        
    }
}



//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    self.leftCenter = CGPointMake(self.whiteView.center.x - 50, self.brownView.center.y);
//    self.rightCenter = CGPointMake(self.whiteView.center.x + 50, self.brownView.center.y);
//
//    // Do any additional setup after loading the view.
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//- (IBAction)viewSwiped:(UISwipeGestureRecognizer*)sender {
//    switch (sender.direction) {
//        
//        case UISwipeGestureRecognizerDirectionLeft:
//            
////            [UIView animateWithDuration:0 animations:self.whiteView.center = CGPointMake(self.brownView.center.x - 50, self.whiteView.center.y)
//            break;
//            
//        default:
//            break;
//    }
    
//    switch (sender.direction) {
//        case UISwipeGestureRecognizerDirectionLeft:
//            self.whiteView.center = self.leftCenter;
//            break;
//            
//        case UISwipeGestureRecognizerDirectionRight:
//            self.whiteView.center = self.rightCenter;
//            break;
//            
//        default:
//            break;
//    }
//}



@end
