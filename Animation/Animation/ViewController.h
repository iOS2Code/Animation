//
//  ViewController.h
//  Animation
//
//  Created by  ZhuHong on 2017/3/5.
//  Copyright © 2017年 CoderHG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@end


/* 核心动画类的常用属性
keyPath：可以指定keyPath为CALayer的属性值，并对它的值进行修改，以达到对应的动画效果，需要注意的是部分属性值是不支持动画效果的。

以下是具有动画效果的keyPath：
CATransform3D Key Paths : (example)transform.rotation.z
rotation.x
rotation.y
rotation.z
rotation 旋轉
scale.x
scale.y
scale.z
scale 缩放
translation.x
translation.y
translation.z
translation 平移
CGPoint Key Paths : (example)position.x
x
y
CGRect Key Paths : (example)bounds.size.width
origin.x
origin.y
origin
size.width
size.height
size
opacity
backgroundColor
cornerRadius
borderWidth
contents
Shadow Key Path:
shadowColor
shadowOffset
shadowOpacity
shadowRadius


duration：动画的持续时间

　　repeatCount：动画的重复次数

　　timingFunction：动画的时间节奏控制

timingFunctionName的enum值如下：
kCAMediaTimingFunctionLinear 匀速
kCAMediaTimingFunctionEaseIn 慢进
kCAMediaTimingFunctionEaseOut 慢出
kCAMediaTimingFunctionEaseInEaseOut 慢进慢出
kCAMediaTimingFunctionDefault 默认值（慢进慢出）

fillMode：视图在非Active时的行为

　　removedOnCompletion：动画执行完毕后是否从图层上移除，默认为YES（视图会恢复到动画前的状态），可设置为NO（图层保持动画执行后的状态，前提是fillMode设置为kCAFillModeForwards）

　　beginTime：动画延迟执行时间（通过CACurrentMediaTime() + your time 设置）

　　delegate：代理

*/

