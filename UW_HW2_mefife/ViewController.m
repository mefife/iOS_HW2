//
//  ViewController.m
//  UW_HW2_mefife
//
//  Created by Matthew Fife on 10/3/14.
//  Copyright (c) 2014 Matthew Fife. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    // One Vertical Constraint Defined in code
    [self.redView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.blueView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.redViewHeightVertical = [NSLayoutConstraint constraintWithItem:self.redView
                                                                             attribute:NSLayoutAttributeHeight
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self.view
                                                                             attribute:NSLayoutAttributeHeight
                                                                            multiplier:0
                                                                              constant:self.view.frame.size.height/2 -40];
    self.redViewHeightVertical.active = YES;
    
    
    // Horizontal Constraints all defined in code
    
    self.blueLeadingHorizontal = [NSLayoutConstraint constraintWithItem:self.blueView
                                                              attribute:NSLayoutAttributeLeadingMargin
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeLeadingMargin
                                                             multiplier:1
                                                               constant:0];
    
    self.redTrailingHorizontal = [NSLayoutConstraint constraintWithItem:self.redView
                                                              attribute:NSLayoutAttributeTrailingMargin
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeTrailingMargin
                                                             multiplier:1
                                                               constant:0];
    
    self.blueTopHorizontal = [NSLayoutConstraint constraintWithItem:self.blueView
                                                              attribute:NSLayoutAttributeTop
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeTopMargin
                                                             multiplier:1
                                                               constant:10];
    
    
    self.redTopHorizontal = [NSLayoutConstraint constraintWithItem:self.redView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTopMargin
                                                         multiplier:1
                                                           constant:10];
    
    
    self.blueBottomHorizontal = [NSLayoutConstraint constraintWithItem:self.blueView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.bottomSlider
                                                          attribute:NSLayoutAttributeBottomMargin
                                                         multiplier:1
                                                           constant:-30];
    
    self.redBottomHorizontal = [NSLayoutConstraint constraintWithItem:self.redView
                                                             attribute:NSLayoutAttributeBottom
                                                             relatedBy:NSLayoutRelationEqual
                                                                toItem:self.bottomSlider
                                                             attribute:NSLayoutAttributeBottomMargin
                                                            multiplier:1
                                                              constant:-30];
    
    // Not Working like I want it to
    self.blueToRedSpacingHorizontal = [NSLayoutConstraint constraintWithItem:self.blueView
                                                            attribute:NSLayoutAttributeTrailing
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self.redView
                                                            attribute:NSLayoutAttributeLeading
                                                           multiplier:1
                                                             constant:-5];
    
    
    self.blueViewWidthVertical = [NSLayoutConstraint constraintWithItem:self.blueView
                                                              attribute:NSLayoutAttributeWidth
                                                              relatedBy:NSLayoutRelationEqual
                                                                 toItem:self.view
                                                              attribute:NSLayoutAttributeWidth
                                                             multiplier:0
                                                               constant:self.view.frame.size.width/2 -40];
    


    
}

- (IBAction)sliderChanged:(id)sender {
    NSLog(@"%f",self.bottomSlider.value);
    self.redViewHeightVertical.constant = self.bottomSlider.value*self.view.frame.size.height-40;
    self.blueViewWidthVertical.constant = self.bottomSlider.value*self.view.frame.size.width-10;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAll;
}

-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    BOOL isLandscape = size.width > size.height;
    
    
    if (isLandscape) {
        NSLog(@"Landscape");
        // deactive all old constraints
        self.blueTrailingVertical.active = NO;
        self.blueLeadingVertical.active = NO;
        self.blueTopVertical.active = NO;
        self.redLeadingVertical.active = NO;
        self.blueToRedSpaceVertical.active = NO;
        self.redTrailingVertical.active = NO;
        self.redBottomVertical.active = NO;
        self.redViewHeightVertical.active = NO;
        
        
        // active new constraints
        self.blueLeadingHorizontal.active = YES;
        self.redTrailingHorizontal.active = YES;
        self.blueTopHorizontal.active = YES;
        self.redTopHorizontal.active =YES;
        self.blueBottomHorizontal.active = YES;
        self.redBottomHorizontal.active = YES;
        self.blueToRedSpacingHorizontal.active = YES;
        self.blueViewWidthVertical.active = YES;
        
    } else {
        NSLog(@"Something Else");
        //deactive old constraints
        self.blueLeadingHorizontal.active = NO;
        self.redTrailingHorizontal.active = NO;
        self.blueTopHorizontal.active = NO;
        self.redTopHorizontal.active =NO;
        self.blueBottomHorizontal.active = NO;
        self.redBottomHorizontal.active = NO;
        self.blueToRedSpacingHorizontal.active = NO;
        self.blueViewWidthVertical.active =NO;
        
        
        //active new constraints
        self.blueTrailingVertical.active = YES;
        self.blueLeadingVertical.active = YES;
        self.blueTopVertical.active = YES;
        self.redLeadingVertical.active = YES;
        self.blueToRedSpaceVertical.active = YES;
        self.redTrailingVertical.active = YES;
        self.redBottomVertical.active = YES;
        self.redViewHeightVertical.active = YES;
    }
    
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        [self.view layoutIfNeeded];
    }completion:^(id<UIViewControllerTransitionCoordinatorContext> context){
        self.redViewHeightVertical.constant = self.bottomSlider.value*self.view.frame.size.height-40;
        self.blueViewWidthVertical.constant = self.bottomSlider.value*self.view.frame.size.width-10;
    }];
}
@end
