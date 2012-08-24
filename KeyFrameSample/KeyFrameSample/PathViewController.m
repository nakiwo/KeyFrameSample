//
//  PathViewController.m
//  KeyFrameSample
//
//  Created by 雄一 on 2012/08/24.
//  Copyright (c) 2012年 nakiwo. All rights reserved.
//

#import "PathViewController.h"

@interface PathViewController ()
@end

@implementation PathViewController
{
    __weak IBOutlet UIView *_testView;

    __weak IBOutlet UIView *_point1View;
    __weak IBOutlet UIView *_point2View;
    __weak IBOutlet UIView *_point3View;
    __weak IBOutlet UIView *_point4View;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        self.title = @"path";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#define USE_GROUP

- (void)pathAnimationUseTimingFunction:(BOOL)useTimingFunction
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];

    if(!useTimingFunction) {
        animation.repeatCount = HUGE_VALF;
        animation.duration = 2;
    }

    animation.calculationMode = kCAAnimationPaced;

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:_point1View.center];
    [path addCurveToPoint:_point4View.center controlPoint1:_point2View.center controlPoint2:_point3View.center];

    animation.path = path.CGPath;

    [_testView.layer removeAllAnimations];

    if(!useTimingFunction) {
        [_testView.layer addAnimation:animation forKey:@"position"];
    } else {

        // Core Animation Cookbook
        // https://developer.apple.com/library/mac/#documentation/GraphicsImaging/Conceptual/CoreAnimation_Cookbook/Articles/Timing.html

        CAAnimationGroup *group = [CAAnimationGroup animation];
        group.repeatCount = HUGE_VALF;
        group.animations = @[animation];
        group.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseInEaseOut];
        group.duration = 2;
        [_testView.layer addAnimation:group forKey:@"animatePosition"];
    }
}

- (IBAction)path1:(id)sender
{
    [self pathAnimationUseTimingFunction:NO];
}

- (IBAction)path2:(id)sender
{
    [self pathAnimationUseTimingFunction:YES];
}

- (IBAction)cubic:(id)sender
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];

    animation.repeatCount = HUGE_VALF;
    animation.duration = 2;

    animation.calculationMode = kCAAnimationCubic;  

    animation.keyTimes = @[ @(0), @(0.5), @(0.75), @(1) ];
    // optional
    // animation.timingFunctions = ...;

    animation.values = @[
    [NSValue valueWithCGPoint:_point1View.center],
    [NSValue valueWithCGPoint:_point2View.center],
    [NSValue valueWithCGPoint:_point3View.center],
    [NSValue valueWithCGPoint:_point4View.center],
    ];

    // CAAnimation.h より
    // http://en.wikipedia.org/wiki/Kochanek-Bartels_spline

//    animation.tensionValues = @[ @(-1), @(0.25), @(-1), @(0.5) ];
//    animation.continuityValues = @[ @(-1), @(1), @(1), @(-1) ];
//    animation.biasValues = @[ @(0.5), @(-1), @(1), @(1) ];

    [_testView.layer removeAllAnimations];
    [_testView.layer addAnimation:animation forKey:@"position"];
}

- (IBAction)cubicPased:(id)sender
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];

    animation.repeatCount = HUGE_VALF;
    animation.duration = 2;

    animation.calculationMode = kCAAnimationCubicPaced;

    animation.values = @[
    [NSValue valueWithCGPoint:_point1View.center],
    [NSValue valueWithCGPoint:_point2View.center],
    [NSValue valueWithCGPoint:_point3View.center],
    [NSValue valueWithCGPoint:_point4View.center],
    ];

    [_testView.layer removeAllAnimations];
    [_testView.layer addAnimation:animation forKey:@"position"];
}

@end
