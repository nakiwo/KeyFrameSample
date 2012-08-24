//
//  ValueViewController.h
//  KeyFrameSample
//
//  Created by 雄一 on 2012/08/24.
//  Copyright (c) 2012年 nakiwo. All rights reserved.
//

#import "ValueViewController.h"

@interface ValueViewController ()
@end

@implementation ValueViewController
{
    __weak IBOutlet UIView *_testView;
}

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if(self) {
        self.title = @"value";
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

- (IBAction)linear:(id)sender
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation.repeatCount = HUGE_VALF;
    animation.duration = 1;

    animation.calculationMode = kCAAnimationLinear;

    animation.values = @[ @(0), @(1.5), @(0.8), @(1) ];
    animation.keyTimes = @[ @(0), @(0.5), @(0.75), @(1) ];

    animation.timingFunctions = @[
    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
    ];

    [_testView.layer removeAllAnimations];
    [_testView.layer addAnimation:animation forKey:@"transform.scale"];
}

- (IBAction)discrete:(id)sender
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
    animation.repeatCount = HUGE_VALF;
    animation.duration = 4;

    animation.calculationMode = kCAAnimationDiscrete;

    animation.values = @[
    (id)[UIColor redColor].CGColor,
    (id)[UIColor greenColor].CGColor,
    (id)[UIColor blueColor].CGColor,
    (id)[UIColor orangeColor].CGColor,
    ];

    // 等間隔なら書かなくても良い
    animation.keyTimes = @[ @(0), @(0.25), @(0.5), @(0.75), @(1) ];

    [_testView.layer removeAllAnimations];
    [_testView.layer addAnimation:animation forKey:@"backgroundColor"];
}

@end
