//
//  HUPreferences.m
//  Hues
//
//  Created by Zach Waugh on 12/21/10.
//  Copyright 2010 Giant Comet. All rights reserved.
//

#import "HuesPreferences.h"
#import "MASShortcut.h"

// Preferences
NSString * const HuesCopyToClipboardKey = @"copyToClipboard";
NSString * const HuesDefaultColorFormatKey = @"defaultColorFormat";
NSString * const HuesColorFormatsKey = @"colorFormats";
NSString * const HuesKeepOnTopKey = @"keepOnTop";
NSString * const HuesApplicationModeKey = @"applicationMode";
NSString * const HuesLoupeShortcutKey = @"loupeShortcut";
NSString * const HuesLastSelectedTabIndexKey = @"lastSelectedTabIndex";

@implementation HuesPreferences

+ (void)registerDefaults
{
  NSMutableDictionary *defaults = [NSMutableDictionary dictionary];
  
	// Default to Menu bar only
	defaults[HuesApplicationModeKey] = @(HuesMenuBarOnlyMode);
	
  // Auto copy to clipboard on
  defaults[HuesCopyToClipboardKey] = @YES;
  
  // Hex is default
	defaults[HuesDefaultColorFormatKey] = @"Hex";
  
  // Color formats
	defaults[HuesColorFormatsKey] = @[
									@{@"name": @"Hex", @"format": @"#{RR}{GG}{BB}"},
									@{@"name": @"RGB", @"format": @"rgb({R}, {G}, {B})"},
									@{@"name": @"RGBA", @"format": @"rgba({R}, {G}, {B}, {a})"},
									@{@"name": @"HSB", @"format": @"hsb({H}, {SS}%, {BR}%)"},
									@{@"name": @"HSL", @"format": @"hsl({H}, {S}%, {L}%)"},
									@{@"name": @"NSColor", @"format": @"[NSColor colorWithCalibratedRed:{r} green:{g} blue:{b} alpha:{a}]"}
	];
	
	// Window
	defaults[HuesKeepOnTopKey] = @NO;
	
	// Shortcut
	defaults[HuesLoupeShortcutKey] = [[MASShortcut shortcutWithKeyCode:kVK_ANSI_C modifierFlags:(NSAlternateKeyMask | NSCommandKeyMask)] data];
  
	// Tab
	defaults[HuesLastSelectedTabIndexKey] = @0;
	
  [[NSUserDefaults standardUserDefaults] registerDefaults:defaults];
}

+ (NSString *)defaultColorFormat
{
	return [[NSUserDefaults standardUserDefaults] stringForKey:HuesDefaultColorFormatKey];
}

+ (void)setDefaultColorFormat:(NSString *)format
{
	[[NSUserDefaults standardUserDefaults] setObject:format forKey:HuesDefaultColorFormatKey];
}

+ (NSArray *)colorFormats
{
  return [[NSUserDefaults standardUserDefaults] arrayForKey:HuesColorFormatsKey];
}

+ (void)setColorFormats:(NSArray *)formats
{
	[[NSUserDefaults standardUserDefaults] setObject:formats forKey:HuesColorFormatsKey];
	[[NSNotificationCenter defaultCenter] postNotificationName:HuesColorFormatsUpdatedNotification object:nil];
}

+ (BOOL)copyToClipboard
{
  return [[NSUserDefaults standardUserDefaults] boolForKey:HuesCopyToClipboardKey];  
}

+ (void)setCopyToClipboard:(BOOL)copy
{
  [[NSUserDefaults standardUserDefaults] setBool:copy forKey:HuesCopyToClipboardKey];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

//+ (BOOL)useCalibratedColors
//{
//  return [[NSUserDefaults standardUserDefaults] boolForKey:HuesUseCalibratedColorsKey]; 
//}
//
//
//+ (void)setCalibratedColors:(BOOL)calibrated
//{
//  [[NSUserDefaults standardUserDefaults] setBool:calibrated forKey:HuesUseCalibratedColorsKey];
//  [[NSUserDefaults standardUserDefaults] synchronize];
//}

+ (HuesApplicationMode)applicationMode
{
	return (HuesApplicationMode)[[NSUserDefaults standardUserDefaults] integerForKey:HuesApplicationModeKey];
}

+ (void)setApplicationMode:(HuesApplicationMode)mode
{
	[[NSUserDefaults standardUserDefaults] setInteger:mode forKey:HuesApplicationModeKey];
}

+ (BOOL)keepOnTop
{
	return [[NSUserDefaults standardUserDefaults] boolForKey:HuesKeepOnTopKey];
}

+ (void)setKeepOnTop:(BOOL)keepOnTop
{
	[[NSUserDefaults standardUserDefaults] setBool:keepOnTop forKey:HuesKeepOnTopKey];
}

+ (NSInteger)lastSelectedTabIndex
{
	return [[NSUserDefaults standardUserDefaults] integerForKey:HuesLastSelectedTabIndexKey];
}

+ (void)setLastSelectedTabIndex:(NSInteger)index
{
	[[NSUserDefaults standardUserDefaults] setInteger:index forKey:HuesLastSelectedTabIndexKey];
}

@end
