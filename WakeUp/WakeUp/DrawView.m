//
//  DrawView.m
//  WakeUp
//
//  Created by Judy Mai on 6/29/15.
//  Copyright (c) 2015 BigNerdRanch. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

{
    UIBezierPath *path;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setMultipleTouchEnabled:NO];
        [self setBackgroundColor:[UIColor whiteColor]];
        path = [UIBezierPath bezierPath];
        [path setLineWidth:2.0];
        
        //if double tap, clear screen
        UITapGestureRecognizer *doubleTapRecognizer =
        [[UITapGestureRecognizer alloc] initWithTarget:self
                                                action:@selector(doubleTap:)];
        doubleTapRecognizer.numberOfTapsRequired = 2;
        doubleTapRecognizer.delaysTouchesBegan = YES;
        [self addGestureRecognizer:doubleTapRecognizer];
        
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [[UIColor blackColor] setStroke];
    [path stroke];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint p = [touch locationInView:self];
    [path moveToPoint:p];
    NSLog(@"start touch");
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint p = [touch locationInView:self];
    [path addLineToPoint:p];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.anyObject;
    CGPoint p = [touch locationInView:self];
    [path addLineToPoint:p];
    NSLog(@"end touch");
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    [path removeAllPoints];
    [self setNeedsDisplay];
}

// MARK : Gestures
- (void)doubleTap:(UIGestureRecognizer *)gestureRecognizer {
    NSLog(@"Double tap!");
    [self clearScreen];
    [self setNeedsDisplay];
}

- (void)clearScreen {
    NSLog(@"Clear screen");
    path = nil;
    path = [UIBezierPath bezierPath];
    [path setLineWidth:2.0];
    [self setNeedsDisplay];
}

@end