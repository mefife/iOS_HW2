//
//  ViewController.h
//  UW_HW2_mefife
//
//  Created by Matthew Fife on 10/3/14.
//  Copyright (c) 2014 Matthew Fife. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *redView;
@property (strong, nonatomic) IBOutlet UIView *blueView;
@property (strong, nonatomic) IBOutlet UISlider *bottomSlider;


// Vertical Constraints
@property NSLayoutConstraint *redViewHeightVertical;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *blueTrailingVertical;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *blueLeadingVertical;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *blueTopVertical;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *redLeadingVertical;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *blueToRedSpaceVertical;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *redTrailingVertical;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *redBottomVertical;

// Horizontal Constraints
@property NSLayoutConstraint *blueLeadingHorizontal;
@property NSLayoutConstraint *redTrailingHorizontal;
@property NSLayoutConstraint *blueTopHorizontal;
@property NSLayoutConstraint *redTopHorizontal;
@property NSLayoutConstraint *blueBottomHorizontal;
@property NSLayoutConstraint *redBottomHorizontal;
@property NSLayoutConstraint *blueToRedSpacingHorizontal;
@property NSLayoutConstraint *blueViewWidthVertical;
@end

