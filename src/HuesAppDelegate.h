//
//  HUAppDelegate.h
//  Hues
//
//  Created by Zach Waugh on 2/17/09.
//  Copyright 2009 Giant Comet. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class HuesPreferencesController;
@class HuesMainController;

@interface HuesAppDelegate : NSObject
{
  HuesMainController *mainController;
  HuesPreferencesController *preferencesController;
}

@property (retain) HuesMainController *mainController;
@property (retain) HuesPreferencesController *preferencesController;

- (void)showPreferences:(id)sender;

@end
