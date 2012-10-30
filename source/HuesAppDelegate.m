//
//  HUAppDelegate.m
//  Hues
//
//  Created by Zach Waugh on 2/17/09.
//  Copyright 2009 Giant Comet. All rights reserved.
//

#import "HuesAppDelegate.h"
#import "HuesPreferences.h"
#import "HuesPreferencesController.h"
#import "HuesMainController.h"
#import "HuesHistoryManager.h"
#import "HuesStatusItemView.h"

@implementation HuesAppDelegate

- (void)applicationWillFinishLaunching:(NSNotification *)notification
{
  [HuesPreferences registerDefaults];
	// Need to do this as early as possible
  [NSColorPanel setPickerMask:[HuesPreferences pickerMask]];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	HuesApplicationMode mode = HuesDockAndMenuBarMode; // [HuesPreferences applicationMode];
	
	if (mode == HuesDockAndMenuBarMode || mode == HuesMenuBarOnlyMode) {
		[self addStatusItem];
	}
	
	if (mode == HuesDockAndMenuBarMode || mode == HuesDockOnlyMode) {
		[self addDockIcon];
	}
	
  self.mainController = [[[HuesMainController alloc] init] autorelease];
}

- (void)awakeFromNib
{
  [HuesHistoryManager sharedManager].menu = self.historyMenu;
}


#pragma mark - Status Item

- (void)addStatusItem
{
	self.statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:30];
	self.statusItem.target = self;
	self.statusItem.action = @selector(toggleWindow:);
	self.statusItem.image = [NSImage imageNamed:@"hues_menubar_normal"];
	self.statusItem.alternateImage = [NSImage imageNamed:@"hues_menubar_highlight"];
	self.statusItem.highlightMode = YES;
	
//	HuesStatusItemView *view = [[HuesStatusItemView alloc] initWithFrame:NSZeroRect];
//	view.target = self;
//	view.action = @selector(toggleWindow:);
//	view.menu = self.optionsMenu;
//	view.statusItem = self.statusItem;
//	self.statusItem.view = view;
}

- (void)toggleWindow:(id)sender
{
	if ([NSApp isActive]) {
		[NSApp hide:nil];
	} else {
		[NSApp activateIgnoringOtherApps:YES];
		[self.mainController showWindow:nil];
	}
}

- (void)addDockIcon
{
	[NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];
}

- (void)showPreferences:(id)sender
{
  if (self.preferencesController == nil) {
    self.preferencesController = [[[HuesPreferencesController alloc] initWithWindowNibName:@"HuesPreferences"] autorelease];
  }
  
  [self.preferencesController showWindow:sender];
}

@end
