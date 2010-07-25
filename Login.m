//
//  Login.m
//  MAL Client OS X
//
//  Created by Tohno Minagi on 3/13/10.
//  Copyright 2009-2010 James M.. All rights reserved. Licensed under the GPL v3
//

#import "Login.h"
#import "ASIHTTPRequest.h"
#include <CoreFoundation/CoreFoundation.h>
#include <Security/Security.h>
#include <CoreServices/CoreServices.h>

@implementation Login
-(void) awakeFromNib
{
	NSLog(@"Loaded Nib");
}
- (id)init {
	self = [self initWithWindowNibName: @"LoginWindow"];
	if (self) {
		//
	}
	return self;
}
-(void)WindowDidLoad
{
}
-(IBAction) startlogin:(id)sender
{
	//Start Login Process
    //Disable Login Button
	[loginbutton setEnabled: NO];
	[loginbutton displayIfNeeded];
	[loginprogress startAnimation: self];
	[loginprogress setUsesThreadedAnimation:YES];
	if ( [[fieldusername stringValue] length] == 0) {
		//No Username Entered! Show error message
		int choice = NSRunCriticalAlertPanel(@"MAL Client OS X was unable to log you in since you didn't enter a username", @"Enter a valid username and try logging in again", @"OK", nil, nil, 8);
		[loginbutton setEnabled: YES];
		[loginprogress stopAnimation: self];
	}
	else {
		if ( [[fieldpassword stringValue] length] == 0 ) {
			//No Password Entered! Show error message.
			int choice = NSRunCriticalAlertPanel(@"MAL Client OS X was unable to log you in since you didn't enter a password", @"Enter a valid password and try logging in again", @"OK", nil, nil, 8);
			[loginbutton setEnabled: YES];
			[loginprogress stopAnimation: self];
		}
		else {
			//Set Login URL
			NSURL *url = [NSURL URLWithString:@"http://myanimelist.net/api/account/verify_credentials.xml"];
			ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
			
			//Store the username for later use
			NSString *username = [fieldusername stringValue];
			
			//Set Username to the request
			[request setUsername:username];
			[request setPassword:[fieldpassword stringValue]];
			[request setDownloadProgressDelegate:loginprogress];
			
			//Vertify Username/Password
			[request startSynchronous];
			
			// Get Status Code
			int statusCode = [request responseStatusCode];
			if (statusCode == 200 ) {
				NSString *response = [request responseString];
				//Login successful
				int choice = NSRunAlertPanel(@"Login Successful", response, @"OK", nil, nil, 8);
				
				/* If ( [rememberpassword state] == YES) {
				 // Save UsernamePassword to Keychain
				 
				 }
				 else if ( [rememberpassword state] == NO) {
				 //Check if Keychain for MAL Client OS X Exists
				 }*/
				
				NSDictionary *returnDict = [[NSDictionary alloc] initWithObjectsAndKeys:username,@"username",nil];
				
				//User logged in - pass event to main delegate
				[[NSNotificationCenter defaultCenter]
				 postNotificationName:@"login"
				 object:self
				 userInfo:returnDict];
				
				//release
				response = nil;
			}
			else {
				//Login Failed, show error message
				int choice = NSRunCriticalAlertPanel(@"MAL Client OS X was unable to log you in since you don't have the correct username and/or password", @"Check your username and password and try logging in again. If you recently changed your password, ener you new password and try again.", @"OK", nil, nil, 8);
				[loginbutton setEnabled: YES];
				[loginbutton setKeyEquivalent:@"\r"];
				[loginprogress stopAnimation:self];
			}
			//release
			statusCode = nil;
			request = nil;
			url = nil;
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
