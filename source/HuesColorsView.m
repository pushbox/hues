//
//  HuesColorsView.m
//  Hues
//
//  Created by Zach Waugh on 12/22/10.
//  Copyright 2010 Giant Comet. All rights reserved.
//

#import "HuesColorsView.h"

@implementation HuesColorsView

- (void)drawRect:(NSRect)dirtyRect
{
	[[NSColor colorWithCalibratedWhite:0.642 alpha:1.000] set];
	NSRectFill(self.bounds);
//	
//	NSGradient *gradient = [[NSGradient alloc] initWithStartingColor:[NSColor colorWithCalibratedWhite:0.467 alpha:1.000] endingColor:[NSColor clearColor]];
//	
//	[gradient drawInRect:NSMakeRect(0, 0, self.bounds.size.width, 20) angle:90];
//	[gradient drawInRect:NSMakeRect(0, self.bounds.size.height - 20, self.bounds.size.width, 20) angle:-90];
//	
//	
//	[[NSColor colorWithCalibratedRed:0.415 green:0.411 blue:0.411 alpha:1.000] set];
//	NSRectFill(NSMakeRect(0, 0, self.bounds.size.width, 1));
//	NSRectFill(NSMakeRect(0, self.bounds.size.height - 1, self.bounds.size.width, 1));
	
  NSImage *background = [NSImage imageNamed:@"hues-tray-background"];
  NSDrawThreePartImage(self.bounds, background, background, background, NO, NSCompositeSourceOver, 1.0, NO);
}

@end
