//
//  AppController.m
//  MAL Client OS X
//
//  Created by Tohno Minagi on 3/13/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "AppController.h"
#import "Login.h"

@implementation AppController
+(void)showloginwindow
{
	[login showWindow:self];
}
@end
