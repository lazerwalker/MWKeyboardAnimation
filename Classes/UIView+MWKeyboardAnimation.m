//
//  UIView+MWKeyboardAnimation.m
//  MWKeyboardAnimation
//
//  Created by Michael Walker on 2/18/14.
//  Copyright (c) 2014 Lazer-Walker. All rights reserved.
//

#import "UIView+MWKeyboardAnimation.h"

@implementation UIView (MWKeyboardAnimation)

+ (void)animateWithKeyboardNotification:(NSNotification *)notification
                             animations:(void(^)(CGRect keyboardFrame))animations {
    NSDictionary *userInfo = notification.userInfo;
    CGRect keyboardFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];

    if (UIInterfaceOrientationIsLandscape([[UIDevice currentDevice] orientation])) {
        CGFloat height = keyboardFrame.size.height;
        keyboardFrame.size.height = keyboardFrame.size.width;
        keyboardFrame.size.width = height;
    }

    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:[notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue]];
    [UIView setAnimationCurve:[notification.userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue]];
    [UIView setAnimationBeginsFromCurrentState:YES];

    animations(keyboardFrame);

    [UIView commitAnimations];
}

@end
