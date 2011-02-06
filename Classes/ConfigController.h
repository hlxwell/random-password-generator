//
//  ConfigController.h
//  RandomPasswordKey
//
//  Created by michael he on 1/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ConfigController : UIViewController {
	IBOutlet UITextField * secretKeyInput;
	NSUserDefaults * config;
}

- (IBAction)resignKeyboard:(id)sender;
- (IBAction)saveSecretKey:(id)sender;
- (IBAction)cancel:(id)sender;
@end
