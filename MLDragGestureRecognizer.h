
#import <UIKit/UIGestureRecognizerSubclass.h>

@interface MLDragGestureRecognizer : UIGestureRecognizer {
    CGPoint location;
}

@property (nonatomic, readonly) CGPoint location;

@end



