@import <AppKit/CPViewController.j>

@import "RGExpression.j"

@implementation RGRegexListViewController : CPViewController {
	
	CPButtonBar buttonBar @accessors(readonly);
	CPScrollView tableScrollView @accessors(readonly);
	CPTableView tableView @accessors(readonly);
	
	CPArrayController arrayController @accessors(readonly);
	
	CPButton addButton @accessors(readonly);
	CPButton removeButton @accessors(readonly);
	
	id delegate @accessors;
	//	- (void) regexListViewController:(RGRegexListViewController)controller didSelectExpressions:(CPArray)expressions
	
}

+ (CPArray) defaultExpressions {
	
	//	RegExp: /(((http|ftp|https):\/\/)|www\.)[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&:\/~\+#!]*[\w\-\@?^=%&\/~\+#])?/gi
	//	RegExp 2: @"/(((http|ftp|https):\/\/)|www\.)[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&:\/~\+#!]*[\w\-\@?^=%&\/~\+#])?/gi"
	//	Literal: @"/(((http|ftp|https):\\/\\/)|www\\.)[\\w\\-_]+(\\.[\\w\\-_]+)+([\\w\\-\\.,@?^=%&:\\/~\\+#!]*[\\w\\-\\@?^=%&\\/~\\+#])?/gi"
	
	var retVal = [

		[RGExpression expressionWithPattern:@"(((http|ftp|https):\\/\\/)|www\\.)[\\w\\-_]+(\\.[\\w\\-_]+)+([\\w\\-\\.,@?^=%&:\\/~\\+#!]*[\\w\\-\\@?^=%&\\/~\\+#])?"],

		//	[RGExpression expressionWithPattern:@"/(((http|ftp|https):\\/\\/)|www\\.)[\\w\\-_]+(\\.[\\w\\-_]+)+([\\w\\-\\.,@?^=%&:\\/~\\+#!]*[\\w\\-\\@?^=%&\\/~\\+#])?/gi"],
		
	];
	
	CPLog(retVal);
	
	return retVal;
	
}

- (void) fireUpdateNotification {
	
	var rowIndexes = [[self tableView] selectedRowIndexes];
	var objects = [[[self arrayController] arrangedObjects] objectsAtIndexes:rowIndexes];
	
	[[self delegate] regexListViewController:self didSelectExpressions:objects];
	
}

- (void) loadView {
	
	//	[super loadView];
	
	[self setView:[[CPView alloc] initWithFrame:CGRectMake(0, 0, 256, 256)]];
	[[self view] setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
	
	var ownView = [self view];
	var ownViewBounds = [ownView bounds];
	
	[ownView addSubview:[self buttonBar]];
	[ownView addSubview:[self tableScrollView]];
	
	var buttonBarHeight = CGRectGetHeight([[self buttonBar] bounds]);
	
	var buttonBarRect = CGRectMakeCopy(ownViewBounds);
	buttonBarRect.origin.y += buttonBarRect.size.height - buttonBarHeight;
	buttonBarRect.size.height = buttonBarHeight;
	
	[[self buttonBar] setFrame:buttonBarRect];
	[[self buttonBar] setAutoresizingMask:CPViewMinYMargin|CPViewWidthSizable];
	
	var tableScrollViewRect = CGRectMakeCopy(ownViewBounds);
	tableScrollViewRect.size.height -= buttonBarHeight;
	
	[[self tableScrollView] setFrame:tableScrollViewRect];
	[[self tableScrollView] setAutoresizingMask:CPViewWidthSizable|CPViewHeightSizable];
	
}

- (void) tableViewSelectionDidChange:(CPNotification)aNotification {
	
	if ([aNotification object] != tableView)
		return;
	
	[self fireUpdateNotification];
		
}

- (BOOL) tableView:(CPTableView)aTableView shouldEditTableColumn:(CPTableColumn)aTableColumn row:(int)rowIndex {
	
	return YES;
	
}

// - (void) tableView:(CPTableView)aTableView setObjectValue:(id)anObject forTableColumn:(CPTableColumn)aTableColumn row:(int)rowIndex {
// 	
// 	CPLog(@"new obj val %@ %@", anObject, anObject == null);
// 	
// 	var editedExpression = [[[self arrayController] arrangedObjects] objectAtIndex:rowIndex];
// 	
// 	if (anObject) {
// 	
// 		[editedExpression setValue:anObject forKey:[aTableColumn identifier]];
// 	
// 	} else {
// 		
// 		//	If it’s empty we might as well remove it
// 		
// 		[[self arrayController] removeObject:editedExpression];
// 		
// 	}
// 	
// 	[self fireUpdateNotification];
// 	
// }


- (CPButtonBar) buttonBar {
	
	if (buttonBar)
		return buttonBar;
	
	buttonBar = [[CPButtonBar alloc] initWithFrame:CGRectMake(0, 0, 128, 26)];
	[buttonBar setButtons:[[self addButton], [self removeButton]]];
	
	return buttonBar;
	
}

- (CPButton) addButton {
	
	if (addButton)
		return addButton;
		
	var addButton = [CPButtonBar plusButton];
	[addButton setTarget:self];
	[addButton setAction:@selector(handleAdd:)];
	
	return addButton;
	
}

- (void) handleAdd:(id)sender {
	
	var addedObject = [RGExpression expressionWithPattern:nil];
	
	[[self arrayController] addObject:addedObject];
	
	var objectIndex = [[[self arrayController] arrangedObjects] indexOfObject:addedObject];
	if (objectIndex == CPNotFound) {
		CPLog(@"BOO");
		return;
	}
	
	[[self tableView] selectRowIndexes:[CPIndexSet indexSetWithIndex:objectIndex] byExtendingSelection:NO];
	[[self tableView] editColumn:0 row:objectIndex withEvent:nil select:NO];
	
	[self fireUpdateNotification];
	
}

- (CPButton) removeButton {
	
	if (removeButton)
		return removeButton;
		
	var removeButton = [CPButtonBar minusButton];
	[removeButton setTarget:self];
	[removeButton setAction:@selector(handleRemove:)];
	
	[removeButton bind:@"enabled" toObject:[self arrayController] withKeyPath:@"canRemove" options:nil];
	
	return removeButton;
	
}

- (void) handleRemove:(id)sender {
	
	[[self arrayController] removeObjects:[[self arrayController] selectedObjects]];
	
	[self fireUpdateNotification];
	
}

- (CPTableView) tableView {
	
	if (tableView)
		return tableView;
	
	tableView = [[CPTableView alloc] initWithFrame:CGRectMake(0, 0, 384, 384)];
	[tableView setGridColor:[CPColor colorWithHexString:@"dce0e2"]];
	[tableView setGridStyleMask:CPTableViewSolidHorizontalGridLineMask];
	[tableView setRowHeight:72];
	[tableView setColumnAutoresizingStyle:CPTableViewFirstColumnOnlyAutoresizingStyle];
	
	[tableView setAllowsMultipleSelection:YES];
		
    [tableView bind:@"content" toObject:[self arrayController] withKeyPath:@"arrangedObjects" options:nil];
	
	[tableView setDelegate:self];
	[tableView setDataSource:self];

    var expressionsColumn = [[CPTableColumn alloc] initWithIdentifier:@"pattern"]; 
    [[expressionsColumn headerView] setStringValue:@"Expressions"]; 
    [expressionsColumn bind:CPValueBinding toObject:[self arrayController] withKeyPath:@"arrangedObjects.pattern" options:nil];
	
	[expressionsColumn setEditable:YES];
	
	var dataView = [[CPTextField alloc] init];
	[dataView setLineBreakMode:CPLineBreakByWordWrapping];
    [dataView setValue:[CPFont systemFontOfSize:13.0] forThemeAttribute:@"font" inState:CPThemeStateTableDataView];
	
	[dataView setTextFieldBackgroundColor:[CPColor redColor]];
	[expressionsColumn setDataView:dataView];
	
    [tableView addTableColumn:expressionsColumn];

	return tableView;
	
}

- (CPScrollView) tableScrollView {
	
	if (tableScrollView)
		return tableScrollView;
	
	tableScrollView = [[CPScrollView alloc] initWithFrame:CGRectMake(0, 0, 384, 384)];
	[tableScrollView setDocumentView:[self tableView]];
	return tableScrollView;
	
}

- (CPArrayController) arrayController {
	
	if (arrayController)
		return arrayController;
	
	arrayController = [[CPArrayController alloc] init];
	[arrayController setContent:[[self class] defaultExpressions]];
	
	CPLog([arrayController content]);
	CPLog([arrayController arrangedObjects]);
	
	return arrayController;
	
}

@end
