//
//  Base64Category.m
//  MAL Client OS X
//
//  Created by Tohno Minagi on 3/13/10.
//  Copyright 2010 Apple Inc. All rights reserved.
//

#import "Base64Category.h"


@implementation NSString (Base64Category)

- (NSString *)base64Encoding
{
    char *inputString = [self UTF8String];
    char *encodedString;
    base64_encode(inputString, strlen(inputString), &encodedString);
    
    return [NSString stringWithUTF8String:encodedString];
}

@end
