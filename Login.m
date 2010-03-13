//
//  Login.m
//  MAL Client OS X
//
//  Created by Tohno Minagi on 3/13/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "Login.h"
#import "Base64Category.h"

@implementation Login
-(int)verifycredentials
{
	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL: 
									   [NSURL URLWithString:@"http://myanimelist.net/api/account/verify_credentials.xml"]];
	
	NSString *username = [fieldusername stringValue];
	NSString *password = [fieldpassword stringValue];
	NSString *format = [NSString stringWithFormat:@"%@:%@", username, password];
	
	[urlRequest addValue:[NSString 
						  stringWithFormat:@"Basic %@", [format base64Encoding]] 
	  forHTTPHeaderField:@"Authorization"];
	
	NSError *error;
	NSURLResponse *response;
	
	NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest
										 returningResponse:&response
													 error:&error];

	NSString *stringFromASC = [NSString UTF8String:[data bytes] 
												  length:[data length]];
		int choice = NSRunAlertPanel(@"Login Response", stringFromASC, @"OK", nil, nil, 8);
	return 200;
}
-(IBAction) startlogin:(id)sender
{
	//Start Login Process
//Disable Login Button
	[loginbutton setEnabled: NO];
	[loginbutton displayIfNeeded];
	if ( [[fieldusername stringValue] length] == 0) {
		int choice = NSRunAlertPanel(@"MAL Client OS X was unable to log you in since you didn't enter a username", @"Enter a valid username and try logging in again", @"OK", nil, nil, 8);
		[loginbutton setEnabled: YES];
	}
	else {
		if ( [[fieldpassword stringValue] length] == 0 ) {
			int choice = NSRunAlertPanel(@"MAL Client OS X was unable to log you in since you didn't enter a password", @"Enter a valid password and try logging in again", @"OK", nil, nil, 8);
			[loginbutton setEnabled: YES];
		}
			else {
				[Login verifycredentials];
		}

	}
	
		
}
-(IBAction) quitapp:(id)sender
{
	[NSApp terminate:self];
}
-(IBAction)registermal:(id)sender
{
	//Opens MAL Website to Register Page
	[[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"http://myanimelist.net/register.php"]];
}
 @end
