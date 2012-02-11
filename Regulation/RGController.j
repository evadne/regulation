@import <Foundation/CPObject.j>
@import "RGRegexListViewController.j"
@import "RGDocumentViewController.j"

var RegexListWidth = 256;

@implementation RGController : CPObject {
	
	CPWindow ownWindow @accessors;
	CPSplitView splitView @accessors;
	
	RGRegexListViewController regexListViewController @accessors;
	RGDocumentViewController documentViewController @accessors;
	
}

- (CPWindow) ownWindow {
	
	if (ownWindow)
		return ownWindow;
	
	ownWindow = [[CPWindow alloc] initWithContentRect:CGRectMakeZero() styleMask:CPBorderlessBridgeWindowMask];
	[[self splitView] setFrame:[[ownWindow contentView] bounds]];
	[[self splitView] setPosition:RegexListWidth ofDividerAtIndex:0];
	[[self splitView] setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
	[[ownWindow contentView] addSubview:[self splitView]];
	
	return ownWindow;
	
}

- (CPSplitView) splitView {
	
	if (splitView)
		return splitView;
	
	splitView = [[CPSplitView alloc] initWithFrame:CGRectMake(0, 0, 512, 512)];
	[splitView addSubview:[[self regexListViewController] view]];
	[splitView addSubview:[[self documentViewController] view]];
	
	[splitView setDelegate:self];
	[splitView setNeedsLayout];
	
	return splitView;
	
}

- (float) splitView:(CPSplitView)aSplitView constrainMinCoordinate:(float)proposedMin ofSubviewAt:(int)subviewIndex {
	
	if (aSplitView == splitView)
	if ([[splitView subviews] objectAtIndex:subviewIndex] == [regexListViewController view])
		return RegexListWidth;
		
	return proposedMin;
	
}

- (float) splitView:(CPSplitView)aSplitView constrainMaxCoordinate:(float)proposedMax ofSubviewAt:(int)subviewIndex {
	
	if (aSplitView == splitView)
	if ([[splitView subviews] objectAtIndex:subviewIndex] == [regexListViewController view])
		return RegexListWidth;
		
	return proposedMax;

}


- (RGRegexListViewController) regexListViewController {
	
	if (regexListViewController)
		return regexListViewController;
	
	regexListViewController = [[RGRegexListViewController alloc] init];
	[regexListViewController setDelegate:self];
	
	return regexListViewController;
	
}

- (RGDocumentViewController) documentViewController {
	
	if (documentViewController)
		return documentViewController;
	
	documentViewController = [[RGDocumentViewController alloc] init];
	
	return documentViewController;
	
}

- (void) applicationDidFinishLaunching:(CPNotification)aNotification {
	
	[[self ownWindow] orderFront:self];
	
}

- (void) regexListViewController:(RGRegexListViewController)controller didSelectExpressions:(CPArray)expressions {
	
	[[self documentViewController] setExpressions:expressions];
	
}

@end
