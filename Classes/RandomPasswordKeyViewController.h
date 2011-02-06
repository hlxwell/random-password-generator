//
//  RandomPasswordKeyViewController.h
//  RandomPasswordKey
//
//  Created by michael he on 1/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RandomPasswordKeyViewController : UIViewController {
	IBOutlet UILabel * passwordLabel;
	IBOutlet UILabel * timeLeftLabel;
	IBOutlet UIBarButtonItem * configButton;
	NSTimer * _timer;
}

@property (nonatomic, retain) IBOutlet UILabel * passwordLabel;
@property (nonatomic, retain) IBOutlet UILabel * timeLeftLabel;

//-(NSString *)md5:(NSString *)str;
-(void)changeCount;
-(IBAction)showConfigPanel:(id)sender;
@end