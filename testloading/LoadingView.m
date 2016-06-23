//
//  LoadingView.m
//  testloading
//
//  Created by cloud on 6/21/16.
//  Copyright © 2016 yedaoinc. All rights reserved.
//

#import "LoadingView.h"
@interface LoadingView()
@property (strong, nonatomic) NSTimer* timer;
@property (assign, nonatomic) CGFloat firstAngle;
@property (assign, nonatomic) CGFloat secondAngle;
@property (assign, nonatomic) NSInteger count;
@property (assign, nonatomic, getter=isFlag) BOOL flag;
@end
@implementation LoadingView
static CGFloat length = 36.f;
-(instancetype)init
{
    self = [super init];
    if (self)
    {
        self.flag = YES;
        self.backgroundColor = [UIColor redColor];
        self.frame = CGRectMake(0, 0, length, length);
        self.layer.borderColor = [UIColor clearColor].CGColor;
        self.layer.cornerRadius = length/2.f;
        self.layer.borderWidth = 1.f;
        self.layer.masksToBounds = YES;
        self.firstAngle = M_PI*2/30;
        self.secondAngle = 0;
        self.timer = [NSTimer timerWithTimeInterval:1./30
                                             target:self
                                           selector:@selector(update:)
                                           userInfo:nil
                                            repeats:YES];
        [[NSRunLoop mainRunLoop]addTimer:self.timer
                                 forMode:NSDefaultRunLoopMode];
    }
    return self;
}
-(void)start
{
    [self.timer fire];
}
-(void)removeFromSuperview
{
    [self.timer invalidate];
    self.timer = nil;
    [super removeFromSuperview];
}
-(void)update:(NSTimer*)timer
{
    self.firstAngle += M_PI*2/30;
    self.secondAngle += self.isFlag?(M_PI*2/30-M_PI*2/60):(M_PI*2/30+M_PI*2/60);
    self.count++;
    if (self.count%40 == 0)
    {
        self.flag = !self.isFlag;
    }
    [self setNeedsDisplay];
}
-(void)drawRect:(CGRect)rect
{
    UIBezierPath* beizerPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(rect.size.width/2, rect.size.height/2) radius:(length/2-4) startAngle:self.firstAngle endAngle:self.secondAngle clockwise:NO];
    [[UIColor whiteColor]setStroke];
    beizerPath.lineWidth = 2.f;
    [beizerPath stroke];
}
@end
