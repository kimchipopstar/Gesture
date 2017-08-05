//
//  EdgeViewController.m
//  Gestures
//
//  Created by Jaewon Kim on 2017-08-04.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

#import "EdgeViewController.h"

@interface EdgeViewController () <UIGestureRecognizerDelegate>

@property UIView* greenView;
@property BOOL isOpened;
@property UIScreenEdgePanGestureRecognizer *screenEdge;
@property UIPanGestureRecognizer *greenPan;

@end

@implementation EdgeViewController

-(void)viewDidLoad{
    
    self.isOpened = NO;
    
    self.greenView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:self.greenView];
    self.greenView.backgroundColor = [UIColor greenColor];
    self.greenView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint constraintWithItem:self.greenView
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:300].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.greenView
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0
                                  constant:300].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.greenView
                                 attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeRightMargin
                                multiplier:1.0
                                  constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.greenView
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.0
                                  constant:0].active = YES;



    

        self.greenPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(afterOpened:)];
        [self.greenView addGestureRecognizer:self.greenPan];
        self.greenPan.enabled = NO;
    
        self.screenEdge = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(edgePanned:)];
        self.screenEdge.edges = UIRectEdgeRight;
        [self.screenEdge setDelegate:self];
        [self.greenView addGestureRecognizer:self.screenEdge];
        self.screenEdge.enabled = YES;
    }
    
//    UIPanGestureRecognizer *greenPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panned:)];
//    [self.greenView addGestureRecognizer:greenPan];
    
    



//-(void)panned:(UIPanGestureRecognizer*)sender{
//    CGPoint translationView = [sender translationInView:self.view];
//    NSLog(@"%f / %f",translationView.x,translationView.y);
//}

-(void)afterOpened:(UIPanGestureRecognizer*)sender{
    CGPoint translationView = [sender translationInView:self.view];
    NSLog(@"opended %f / %f",translationView.x,translationView.y);
    if ( translationView.x > 100) {
        self.greenView.center = CGPointMake(550, sender.view.center.y);
        self.greenPan.enabled = NO;
        self.screenEdge.enabled = YES;
}
}

-(void)edgePanned:(UIScreenEdgePanGestureRecognizer*)sender{
    
    CGPoint translationView = [sender translationInView:self.view];
     NSLog(@"closed %f / %f",translationView.x,translationView.y);
    if ( translationView.x < -100) {
        self.greenView.center = CGPointMake(300, sender.view.center.y);
        self.screenEdge.enabled = NO;
        self.greenPan.enabled = YES;
        
    }
}



//self.greenView.frame =  CGRectMake(200, self.greenView.frame.origin.y, self.greenView.frame.size.width, self.greenView.frame.size.height);

//CGPoint translationView = [sender translationInView:self.view];
//CGPoint oldCentre = sender.view.center;
//CGPoint newCentre = CGPointMake(oldCentre.x + translationView.x, oldCentre.y + translationView.y);
//sender.view.center = newCentre;
//[sender setTranslation:CGPointZero inView:self.view];



@end
