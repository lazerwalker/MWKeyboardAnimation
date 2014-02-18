//
//  UIView+MWKeyboardAnimation.h
//  MWKeyboardAnimation
//
//  Created by Michael Walker on 2/18/14.
//  Copyright (c) 2014 Lazer-Walker. All rights reserved.
//

@import UIKit;
@import Foundation;

@interface UIView (MWKeyboardAnimation)

+ (void)animateWithKeyboardNotification:(NSNotification *)notification
                             animations:(void(^)(CGRect keyboardFrame))animations;
@end
