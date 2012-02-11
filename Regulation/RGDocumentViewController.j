@import <Foundation/CPObject.j>
@import <WyzihatKit/WKTextView.j>

@implementation RGDocumentViewController : CPViewController {
	
	WKTextView textView @accessors;
	
	BOOL textViewLoaded @accessors;
	
	CPArray expressions @accessors;
	CPString underlyingText @accessors;
	
	BOOL updatingView @accessors(getter=isUpdatingView, setter=setUpdatingView:);
	
}

+ (CPString) defaultUnderlyingText {
	
	//	Sorry for using synchronous stuff.
	//	https://raw.github.com/gist/356104/f8a2ca1e899a6a09e4bf11678823b43f647095dc/embedly_sample_test_urls.txt
	
	var resourcePath = [[CPBundle bundleForClass:[self class]] pathForResource:@"RGDocumentViewSample.txt"];
	var request = [CPURLRequest requestWithURL:[CPURL URLWithString:resourcePath]];
	var response = nil;
	var data = [CPURLConnection sendSynchronousRequest:request returningResponse:nil];
	
	var retVal = [data string].replace(/\n/g, "<br />");
	
	return retVal;
	
}

- (id) initWithCibName:(CPString)aCibNameOrNil bundle:(CPBundle)aCibBundleOrNil externalNameTable:(CPDictionary)anExternalNameTable {
	
	self = [super initWithCibName:aCibNameOrNil bundle:aCibBundleOrNil externalNameTable:anExternalNameTable];
	if (!self)
		return nil;
		
	[self setUnderlyingText:[[self class] defaultUnderlyingText]];
	
	[[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(handleExpressionDidChangePattern:) name:RGExpressionDidChangePatternNotification object:nil];

	return self;
	
}

- (void) loadView {
	
	//	[super loadView];
	
	[self setView:[[CPView alloc] initWithFrame:CGRectMake(0, 0, 256, 256)]];
	[[self view] setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];	
	
	var ownView = [self view];
	var ownViewBounds = [ownView bounds];
	
	[[self textView] setFrame:ownViewBounds];
	[[self view] addSubview:[self textView]];
	
}

- (WKTextView) textView {
	
	if (textView)
		return textView;
	
	textView = [[WKTextView alloc] initWithFrame:CGRectMakeZero()];
	[textView setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
	[textView setDelegate:self];
	
	return textView;
	
}

- (void) textViewDidLoad:(WKTextView)aTextView {
	
	[self setTextViewLoaded:YES];
	
	[[self textView] setHtmlValue:[self underlyingText]];
	
	[self updateView];
	
}

- (void) textViewDidBeginEditing:(WKTextView)aTextView {
	
	var underlyingValue = (function(){
		
		return [[self textView] htmlValue].replace(/<b>/g, "").replace(/<\/b>/g, "");
		
	// var tmp = document.createElement("DIV");
	// tmp.innerHTML = [[self textView] htmlValue];
	// return tmp.textContent || tmp.innerText;
		
	})();
	
	[[self textView] setHtmlValue:underlyingValue];
	
}

- (void) textViewDidEndEditing:(WKTextView)aTextView {
	
	if (![self isUpdatingView])
		[self updateView];
	
}

- (void) handleExpressionDidChangePattern:(CPNotification)notification {
	
	[self updateView];
	
}

- (void) updateView {
	
	if (![self textViewLoaded])
		return;
	
	[self setUpdatingView:YES];
	
	var underlyingValue = (function(){
		
		return [[self textView] htmlValue].replace(/<b>/g, "").replace(/<\/b>/g, "");
		
	// var tmp = document.createElement("DIV");
	// tmp.innerHTML = [[self textView] htmlValue];
	// return tmp.textContent || tmp.innerText;
		
	})();
	
	var processedValue = underlyingValue;
	
	[[self expressions] enumerateObjectsUsingBlock:function (expression, index) {
		
		var newProcessedValue = [expression stringByReplacingMatchesInString:processedValue usingBlock: function (substring) {
			
			return @"<b>" + substring + @"</b>";
			
		}];
		
		if (newProcessedValue)
			processedValue = newProcessedValue;
		
	}];
	
	if (processedValue != [[self textView] htmlValue]) {
		
		[[self textView] setDelegate:nil];
		[[self textView] setHtmlValue:processedValue];
		[[self textView] setDelegate:self];

	}
	
	[self setUpdatingView:NO];
	
}

- (void) setExpressions:(CPArray)newExpressions {
	
	if (expressions == newExpressions)
		return;
	
	expressions = newExpressions;
	
	[self updateView];
	
}

@end