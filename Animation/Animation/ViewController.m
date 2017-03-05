//
//  ViewController.m
//  Animation
//
//  Created by  ZhuHong on 2017/3/5.
//  Copyright © 2017年 CoderHG. All rights reserved.
//


// 博客: http://www.cocoachina.com/ios/20160517/16290.html

// 博客1: http://blog.csdn.net/wildfireli/article/details/23086847

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *avView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self basicAnimation];
//    [self keyframeAnimation];
//    [self pathKeyframeAni];
    
//    [self springAni];

    [self groupAni];
    
}

#pragma mark - 
#pragma mark - CABasicAnimation
// 简单的移动动画
- (void)basicAnimation {
    CABasicAnimation* ani = [CABasicAnimation animationWithKeyPath:@"position"];
    CGPoint point = CGPointMake(self.avView.center.x, self.avView.center.y+10);
    ani.toValue = [NSValue valueWithCGPoint:point];
    
    ani.removedOnCompletion = YES;
    ani.fillMode = kCAFillModeForwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.avView.layer addAnimation:ani forKey:@"11"];
}

// 缩放 transform.scale

#pragma mark - 
#pragma mark - CAKeyframeAnimation
- (void)keyframeAnimation {
    CAKeyframeAnimation* ani = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    ani.duration = 4.0;
    ani.removedOnCompletion = YES;
    ani.fillMode = kCAFillModeForwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    NSValue * value1 = [NSValue valueWithCGPoint:CGPointMake(150, 200)];
    NSValue *value2=[NSValue valueWithCGPoint:CGPointMake(250, 200)];
    NSValue *value3=[NSValue valueWithCGPoint:CGPointMake(250, 300)];
    NSValue *value4=[NSValue valueWithCGPoint:CGPointMake(150, 300)];
    NSValue *value5=[NSValue valueWithCGPoint:CGPointMake(150, 200)];

    ani.values = @[value1, value2, value3, value4, value5];
    
    [self.avView.layer addAnimation:ani forKey:@"222"];
}

// 圆圈运动
- (void)pathKeyframeAni {
    CAKeyframeAnimation* ani = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, CGRectMake(130, 200, 100, 200));
    ani.path = path;
    CGPathRelease(path);
    ani.duration = 4.0;
    ani.removedOnCompletion = NO;
    ani.fillMode = kCAFillModeForwards;
    
    [self.avView.layer addAnimation:ani forKey:@"LLL"];
}

#pragma mark -
#pragma mark - 转场动画, 颜色的渐变
- (void)transitionAni {
    CATransition* ani = [CATransition animation];
//    ani.type = kCATransitionFade;
    ani.type = kCATransitionPush;
    ani.subtype = kCATransitionFromLeft;
    ani.duration = 1.5;
    self.avView.backgroundColor = [UIColor redColor];
    
    [self.avView.layer addAnimation:ani forKey:@"22"];
}

#pragma mark - 
#pragma mark - CASpringAnimation
- (void)springAni {
    CASpringAnimation* ani = [CASpringAnimation animationWithKeyPath:@"bounds"];
    ani.mass = 10.0;
    ani.stiffness = 5000;
    ani.damping = 100.0;
    ani.initialVelocity = 5.f;
    ani.duration = ani.settlingDuration;
    ani.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, self.avView.bounds.size.width*2, self.avView.bounds.size.height*2)];
    ani.removedOnCompletion = YES;
    ani.fillMode = kCAFillModeForwards;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.avView.layer addAnimation:ani forKey:@"111"];
}

#pragma mark -
#pragma mark - CAAnimationGroup
// 以实现视图的position、bounds和opacity改变的组合动画为例
- (void)groupAni {
    CABasicAnimation* posAni = [CABasicAnimation animationWithKeyPath:@"position"];
    posAni.toValue = [NSValue valueWithCGPoint:CGPointMake(self.view.center.x, 300)];
    CABasicAnimation* opcAni = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opcAni.toValue = @1.0;
//    opcAni.toValue = @0.7;
    CABasicAnimation* bosAni = [CABasicAnimation animationWithKeyPath:@"bounds"];
    bosAni.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, self.avView.bounds.size.width*2, self.avView.bounds.size.height*2)];
    
    CAAnimationGroup* groupAni = [CAAnimationGroup animation];
    groupAni.animations = @[posAni, opcAni, bosAni];
    groupAni.duration = 1.0;
    groupAni.fillMode = kCAFillModeForwards;
    groupAni.removedOnCompletion = NO;
    groupAni.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.avView.layer addAnimation:groupAni forKey:@"ooo"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
