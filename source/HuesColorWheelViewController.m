//
//  HuesColorWheelViewController.m
//  Hues
//
//  Created by Zach Waugh on 12/17/12.
//  Copyright (c) 2012 Giant Comet. All rights reserved.
//

#import "HuesColorWheelViewController.h"
#import "HuesColorWheelView.h"

@interface HuesColorWheelViewController ()

@end

@implementation HuesColorWheelViewController

- (id)init
{
	self = [super initWithNibName:@"HuesColorWheelViewController" bundle:nil];
	if (self) {
		// Initialization code here.
	}
	
	return self;
}

- (void)updateInterfaceWithColor:(NSColor *)color
{
	self.colorWheelView.color = color;
}

#pragma mark - HuesColorWheelViewDelegate

- (void)colorWheelDidChangeSaturation:(CGFloat)saturation brightness:(CGFloat)brightness
{
	NSColor *color = [NSColor colorWithCalibratedHue:self.color.hueComponent saturation:saturation brightness:brightness alpha:self.color.alphaComponent];
	[self updateColor:color];
}

#pragma mark - HuesColorWheelHueViewDelegate

- (void)hueChanged:(CGFloat)hue
{
	NSLog(@"hue changed: %f", hue);
	NSColor *color = [NSColor colorWithCalibratedHue:hue saturation:self.color.saturationComponent brightness:self.color.brightnessComponent alpha:self.color.alphaComponent];
	[self updateColor:color];
}

@end