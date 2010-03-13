//
//  Login.m
//  MAL Client OS X
//
//  Created by Tohno Minagi on 3/13/10.
//  Copyright 2009-2010 James M.. All rights reserved. Licensed under the GPL v3
//

#import "Login.h"
#import "ASIHTTPRequest.h"

@implementation Login

-(IBAction) startlogin:(id)sender
{
	//Start Login Process
    //Disable Login Button
	[loginbutton setEnabled: NO];
	[loginbutton displayIfNeeded];
	if ( [[fieldusername stringValue] length] == 0) {
		//No Username Entered! Show error message
		int choice = NSRunAlertPanel(@"MAL Client OS X was unable to log you in since you didn't enter a username", @"Enter a valid username and try logging in again", @"OK", nil, nil, 8);
		[loginbutton setEnabled: YES];
	}
	else {
		if ( [[fieldpassword stringValue] length] == 0 ) {
			//No Password Entered! Show error message.
			int choice = NSRunAlertPanel(@"MAL Client OS X was unable to log you in since you didn't enter a password", @"Enter a valid password and try logging in again", @"OK", nil, nil, 8);
			[loginbutton setEnabled: YES];
		}
			else {
				//Set Login URL
				NSURL *url = [NSURL URLWithString:@"http://myanimelist.net/api/account/verify_credentials.xml"];
				ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
				//Set Username
				[request setUsername:[fieldusername stringValue]];
				[request setPassword:[fieldpassword stringValue]];
				//Vertify Username/Password
				[request startSynchronous];
				NSError *error = [request error];
				if (!error) {
					NSString *response = [request responseString];
					//Login successful
					int choice = NSRunAlertPanel(@"Login Successful", response, @"OK", nil, nil, 8);
				}
					else {
			//Login Failed, show error message
						int choice = NSRunAlertPanel(@"MAL Client OS X was unable to log you in since you don't have the correct username and/or password", @"Check your username and password and try logging in again. If you recently changed your password, ener you new password and try again.", @"OK", nil, nil, 8);
						[loginbutton setEnabled: YES];
					}
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
