//
//  RandomPasswordKeyAppDelegate.h
//  RandomPasswordKey
//
//  Created by michael he on 1/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RandomPasswordKeyViewController;

@interface RandomPasswordKeyAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    RandomPasswordKeyViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RandomPasswordKeyViewController *viewController;

@end

