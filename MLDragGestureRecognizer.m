
#import "MLDragGestureRecognizer.h"

@implementation MLDragGestureRecognizer

- (void)updateLocationWithTouches:(NSSet *)touches state:(UIGestureRecognizerState)state {
    if ([touches count] != 1) {
        [self setState:UIGestureRecognizerStatePossible];
        return;
    }

    location = [[touches anyObject] locationInView:[self view]];
    [self setState:state];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self updateLocationWithTouches:touches state:UIGestureRecognizerStateBegan];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    [self updateLocationWithTouches:touches state:UIGestureRecognizerStateChanged];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    [self updateLocationWithTouches:touches state:UIGestureRecognizerStateEnded];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    [self updateLocationWithTouches:touches state:UIGestureRecognizerStateCancelled];
}

- (CGPoint)locationInView:(UIView *)view {
    return location;
}

@end


