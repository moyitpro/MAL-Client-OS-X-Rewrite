//
//  Login.h
//  MAL Client OS X
//
//  Created by Tohno Minagi on 3/13/10.
//  Copyright 2009-2010 James M.. All rights reserved. Licensed under the GPL v3
//

#import <Cocoa/Cocoa.h>


@interface Login : NSWindowController {
	IBOutlet NSTextField * fieldusername;
	IBOutlet NSTextField * fieldpassword;
	IBOutlet NSButton * loginbutton;
	IBOutlet NSButton * rememberpassword;
	IBOutlet NSProgressIndicator * loginprogress;
}
-(IBAction)startlogin:(id)sender;
-(IBAction)quitapp:(id)sender;
-(IBAction)registermal:(id)sender;

@end
