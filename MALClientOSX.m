//
//  MALClientOSX.m
//  MAL Client OS X
//
//  Created by Tohno Minagi on 3/13/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "MALClientOSX.h"
#import "ASIHTTPRequest.h"

@implementation MALClientOSXTools
+(int) vertifyCredentials: (NSString *) u Password:(NSString *) p 
{
	//Set Login URL
	NSURL *url = [NSURL URLWithString:@"http://myanimelist.net/api/account/verify_credentials.xml"];
	ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
	//Set Username
	[request setUsername: u];
	[request setPassword: p];
	//Vertify Username/Password
	[request startSynchronous];
	// Get Status Code
	int statusCode = [request responseStatusCode];
	return statusCode;
	//release
	/*statusCode = nil;
	 request = nil;
	 url = nil;*/
}
@end
