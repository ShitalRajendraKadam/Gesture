//
//  ViewController.m
//  IOS_gesture
//
//  Created by Student P_02 on 07/05/18.
//  Copyright © 2018 Shital. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
self.baseFrame=self.TapImageView.frame;

    UISwipeGestureRecognizer *leftSwipe=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleLeftSwipe:)];
    leftSwipe.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwipe];
    UISwipeGestureRecognizer *rightSwipe=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handlRightSwipe:)];
    rightSwipe.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipe];
    UITapGestureRecognizer *singleTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleTap:)];
    singleTap.numberOfTapsRequired=1;
    [self.view addGestureRecognizer:singleTap];

    UITapGestureRecognizer *DoubleTapImage = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(DoubleTapImageGesture:)];
    
    DoubleTapImage.numberOfTapsRequired = 2;
    [self.TapImageView addGestureRecognizer:DoubleTapImage];

    
    
UIPanGestureRecognizer *PanGestureImage = [[UIPanGestureRecognizer alloc] initWithTarget:self  action:@selector(PanImageGesture:)];

    [self.TapImageView addGestureRecognizer:PanGestureImage];

    
    UIRotationGestureRecognizer *RotationGestureImage = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(RotationImageGesture:)];
    [self.TapImageView addGestureRecognizer:RotationGestureImage];

    UIPinchGestureRecognizer *PinchGestureImage = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(PinchImageGeture:)];
    [self.TapImageView addGestureRecognizer:PinchGestureImage];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)PinchImageGeture:(UIPinchGestureRecognizer *)PinchGestureRecognizer
{
    PinchGestureRecognizer.scale = 1.0;

}
-(void)RotationImageGesture:(UIRotationGestureRecognizer *)rotationGestureRecognizer
{
    self.TapImageView.transform = CGAffineTransformRotate(self.TapImageView.transform, rotationGestureRecognizer.rotation);
    
    rotationGestureRecognizer.rotation = 0.0;
}
- (void)PanImageGesture:(UIPanGestureRecognizer *)gestureRecognizer
{
    CGPoint touchLocation = [gestureRecognizer locationInView:self.view];
    
    self.TapImageView.center = touchLocation;

    
}
-(void)DoubleTapImageGesture:(UITapGestureRecognizer *)sender
{
    CGRect tempFrame;
     CGRect newfrmae=CGRectMake(self.TapImageView.frame.origin.x-100, self.TapImageView.frame.origin.y-100, self.TapImageView.frame.size.height*2, self.TapImageView.frame.size.width*2);
    
     if(self.TapImageView.frame.size.height > self.baseFrame.size.height && self.TapImageView.frame.size.width > self.baseFrame.size.width)
     {
         tempFrame=self.baseFrame;
     }
    else
    {
        tempFrame=newfrmae;
    }
    self.TapImageView.frame=tempFrame;

}
-(void)handleSingleTap:(UITapGestureRecognizer *)sender
{
    self.view.backgroundColor=[UIColor redColor];

}
-(void)handleLeftSwipe:(UISwipeGestureRecognizer *)sender
{
    
    self.view.backgroundColor=[UIColor blueColor];
}
-(void)handlRightSwipe:(UISwipeGestureRecognizer *)sender
{
    self.view.backgroundColor=[UIColor greenColor];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
