//
//  MAL_Client_OS_X_AppDelegate.h
//  MAL Client OS X
//
//  Created by Tohno Minagi on 3/13/10.
//  Copyright Apple Inc 2010 . All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MAL_Client_OS_X_AppDelegate : NSObject 
{
    NSWindow *window;
    
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
    NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;
}

@property (nonatomic, retain) IBOutlet NSWindow *window;

@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;

- (IBAction)saveAction:sender;

@end
