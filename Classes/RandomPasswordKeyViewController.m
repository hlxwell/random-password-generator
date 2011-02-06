//
//  RandomPasswordKeyViewController.m
//  RandomPasswordKey
//
//  Created by michael he on 1/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RandomPasswordKeyViewController.h"
#import <CommonCrypto/CommonDigest.h>
#import "ConfigController.h"
#import "Md5.h"
@implementation RandomPasswordKeyViewController

@synthesize passwordLabel, timeLeftLabel;


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	_timer = [[NSTimer scheduledTimerWithTimeInterval:1 
														target:self 
													  selector:@selector(changeCount) 
													  userInfo:nil 
													   repeats:YES] retain];
	[_timer fire];

    [super viewDidLoad];
}

- (void)showConfigPanel:(id)sender {
	ConfigController * configView = [[[ConfigController alloc] init] autorelease];
	[self presentModalViewController:configView animated:YES];
}

- (void)changeCount {
	// set gmt timezone
	NSTimeZone * gmt = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
	
	// count down number
	NSDateFormatter * date_formatter = [[NSDateFormatter alloc] init];
	[date_formatter setTimeZone:gmt];
	[gmt release];
	[date_formatter setDateFormat:@"ss"];
	NSString * countdownString = [date_formatter stringFromDate:[NSDate date]];
	timeLeftLabel.text = [NSString stringWithFormat:@"%d", 60 - [countdownString intValue]];

	// Generate the Password
	[date_formatter setDateFormat:@"YYYYMMddhhmm"];
	NSString * timeStamp = [date_formatter stringFromDate:[NSDate date]];
	
	// update the countdown string and password.
	if ([countdownString intValue] == 0 || [passwordLabel.text intValue] == 0) {
		NSString * md5String = [Md5 md5:[NSString stringWithFormat:@"%@%@", timeStamp, [[NSUserDefaults standardUserDefaults] stringForKey:@"secret_key"]]];
		NSString * headString = [md5String substringWithRange:NSMakeRange(0,3)];
		NSString * tailString = [md5String substringWithRange:NSMakeRange(29, 3)];
		passwordLabel.text = [NSString stringWithFormat:@"%@%@", headString, tailString];
	}
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
