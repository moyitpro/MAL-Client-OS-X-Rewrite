//
//  Login.h
//  MAL Client OS X
//
//  Created by Tohno Minagi on 3/13/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Login : NSObject {
	IBOutlet NSTextField * fieldusername;
	IBOutlet NSTextField * fieldpassword;
	IBOutlet NSButton * loginbutton;
}
-(IBAction)startlogin:(id)sender;
-(int)verifycredentials;
-(IBAction)quitapp:(id)sender;
-(IBAction)registermal:(id)sender;

@end
