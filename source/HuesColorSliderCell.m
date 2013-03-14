//
//  HuesColorSliderCell.m
//  Hues
//
//  Created by Zach Waugh on 12/14/12.
//  Copyright (c) 2012 Giant Comet. All rights reserved.
//

#import "HuesColorSliderCell.h"
#import "HuesColorSlider.h"

@implementation HuesColorSliderCell

- (void)drawBarInside:(NSRect)aRect flipped:(BOOL)flipped
{
	HuesColorSlider *slider = (HuesColorSlider *)[self controlView];
	
	NSRect trackRect = NSInsetRect(aRect, 2, 6);
	NSInteger radius = round(trackRect.size.height / 2);
	
	NSBezierPath *path = [NSBezierPath bezierPathWithRoundedRect:trackRect xRadius:radius yRadius:radius];
	[slider.gradient drawInBezierPath:path angle:0];
	
	[[NSColor colorWithCalibratedWhite:0.0 alpha:0.25] set];
	[[NSBezierPath bezierPathWithRoundedRect:NSInsetRect(trackRect, 0.5, 0.5) xRadius:radius yRadius:radius] stroke];
}

- (void)drawKnob:(NSRect)knobRect
{
	NSImage *knob = [NSImage imageNamed:@"slider-knob"];
	NSRect rect = knobRect;
	rect.origin.x += round((knobRect.size.width - knob.size.width) / 2);
	rect.origin.y += round((knobRect.size.height - knob.size.height) / 2);
	rect.size.width = knob.size.width;
	rect.size.height = knob.size.height;
	[knob drawInRect:rect fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0 respectFlipped:YES hints:nil];
	
//  [super drawKnob:knobRect];
//	
//	HuesColorSlider *slider = (HuesColorSlider *)[self controlView];
//	[slider.currentColor set];
//	NSRect innerRect = NSInsetRect(knobRect, 8, 8);
//	[[NSBezierPath bezierPathWithOvalInRect:innerRect] fill];
//	
//	[[NSColor colorWithCalibratedWhite:0.0 alpha:0.25] set];
//	[[NSBezierPath bezierPathWithOvalInRect:NSInsetRect(innerRect, 0.5, 0.5)] stroke];
}

@end
