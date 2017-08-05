//
//  PanViewController.m
//  Gestures
//
//  Created by Jaewon Kim on 2017-08-03.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController ()

@end

@implementation PanViewController

- (IBAction)redViewPanned:(UIPanGestureRecognizer *)sender {
    
//    CGPoint locationInVIew = [sender locationInView:self.view];
//    sender.view.center = locationInVIew;
    
    CGPoint translationView = [sender translationInView:self.view];
    CGPoint oldCentre = sender.view.center;
    CGPoint newCentre = CGPointMake(oldCentre.x + translationView.x, oldCentre.y + translationView.y);
    sender.view.center = newCentre;
    [sender setTranslation:CGPointZero inView:self.view];
}

@end
