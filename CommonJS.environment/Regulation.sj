@STATIC;1.0;p;6;main.jt;265;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;14;RGController.jt;180;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("RGController.j",YES);
main=function(_1,_2){
CPApplicationMain(_1,_2);
};
p;14;RGController.jt;4140;@STATIC;1.0;I;21;Foundation/CPObject.ji;27;RGRegexListViewController.ji;26;RGDocumentViewController.jt;4032;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("RGRegexListViewController.j",YES);
objj_executeFile("RGDocumentViewController.j",YES);
var _1=256;
var _2=objj_allocateClassPair(CPObject,"RGController"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("ownWindow"),new objj_ivar("splitView"),new objj_ivar("regexListViewController"),new objj_ivar("documentViewController")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("ownWindow"),function(_4,_5){
with(_4){
return ownWindow;
}
}),new objj_method(sel_getUid("setOwnWindow:"),function(_6,_7,_8){
with(_6){
ownWindow=_8;
}
}),new objj_method(sel_getUid("splitView"),function(_9,_a){
with(_9){
return splitView;
}
}),new objj_method(sel_getUid("setSplitView:"),function(_b,_c,_d){
with(_b){
splitView=_d;
}
}),new objj_method(sel_getUid("regexListViewController"),function(_e,_f){
with(_e){
return regexListViewController;
}
}),new objj_method(sel_getUid("setRegexListViewController:"),function(_10,_11,_12){
with(_10){
regexListViewController=_12;
}
}),new objj_method(sel_getUid("documentViewController"),function(_13,_14){
with(_13){
return documentViewController;
}
}),new objj_method(sel_getUid("setDocumentViewController:"),function(_15,_16,_17){
with(_15){
documentViewController=_17;
}
}),new objj_method(sel_getUid("ownWindow"),function(_18,_19){
with(_18){
if(ownWindow){
return ownWindow;
}
ownWindow=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",CGRectMakeZero(),CPBorderlessBridgeWindowMask);
objj_msgSend(objj_msgSend(_18,"splitView"),"setFrame:",objj_msgSend(objj_msgSend(ownWindow,"contentView"),"bounds"));
objj_msgSend(objj_msgSend(_18,"splitView"),"setPosition:ofDividerAtIndex:",_1,0);
objj_msgSend(objj_msgSend(_18,"splitView"),"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(objj_msgSend(ownWindow,"contentView"),"addSubview:",objj_msgSend(_18,"splitView"));
return ownWindow;
}
}),new objj_method(sel_getUid("splitView"),function(_1a,_1b){
with(_1a){
if(splitView){
return splitView;
}
splitView=objj_msgSend(objj_msgSend(CPSplitView,"alloc"),"initWithFrame:",CGRectMake(0,0,512,512));
objj_msgSend(splitView,"addSubview:",objj_msgSend(objj_msgSend(_1a,"regexListViewController"),"view"));
objj_msgSend(splitView,"addSubview:",objj_msgSend(objj_msgSend(_1a,"documentViewController"),"view"));
objj_msgSend(splitView,"setDelegate:",_1a);
objj_msgSend(splitView,"setNeedsLayout");
return splitView;
}
}),new objj_method(sel_getUid("splitView:constrainMinCoordinate:ofSubviewAt:"),function(_1c,_1d,_1e,_1f,_20){
with(_1c){
if(_1e==splitView){
if(objj_msgSend(objj_msgSend(splitView,"subviews"),"objectAtIndex:",_20)==objj_msgSend(regexListViewController,"view")){
return _1;
}
}
return _1f;
}
}),new objj_method(sel_getUid("splitView:constrainMaxCoordinate:ofSubviewAt:"),function(_21,_22,_23,_24,_25){
with(_21){
if(_23==splitView){
if(objj_msgSend(objj_msgSend(splitView,"subviews"),"objectAtIndex:",_25)==objj_msgSend(regexListViewController,"view")){
return _1;
}
}
return _24;
}
}),new objj_method(sel_getUid("regexListViewController"),function(_26,_27){
with(_26){
if(regexListViewController){
return regexListViewController;
}
regexListViewController=objj_msgSend(objj_msgSend(RGRegexListViewController,"alloc"),"init");
objj_msgSend(regexListViewController,"setDelegate:",_26);
return regexListViewController;
}
}),new objj_method(sel_getUid("documentViewController"),function(_28,_29){
with(_28){
if(documentViewController){
return documentViewController;
}
documentViewController=objj_msgSend(objj_msgSend(RGDocumentViewController,"alloc"),"init");
return documentViewController;
}
}),new objj_method(sel_getUid("applicationDidFinishLaunching:"),function(_2a,_2b,_2c){
with(_2a){
objj_msgSend(objj_msgSend(_2a,"ownWindow"),"orderFront:",_2a);
}
}),new objj_method(sel_getUid("regexListViewController:didSelectExpressions:"),function(_2d,_2e,_2f,_30){
with(_2d){
objj_msgSend(objj_msgSend(_2d,"documentViewController"),"setExpressions:",_30);
}
})]);
p;26;RGDocumentViewController.jt;5314;@STATIC;1.0;I;21;Foundation/CPObject.jI;23;WyzihatKit/WKTextView.jt;5241;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("WyzihatKit/WKTextView.j",NO);
var _1=objj_allocateClassPair(CPViewController,"RGDocumentViewController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("textView"),new objj_ivar("textViewLoaded"),new objj_ivar("expressions"),new objj_ivar("underlyingText"),new objj_ivar("updatingView")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("textView"),function(_3,_4){
with(_3){
return textView;
}
}),new objj_method(sel_getUid("setTextView:"),function(_5,_6,_7){
with(_5){
textView=_7;
}
}),new objj_method(sel_getUid("textViewLoaded"),function(_8,_9){
with(_8){
return textViewLoaded;
}
}),new objj_method(sel_getUid("setTextViewLoaded:"),function(_a,_b,_c){
with(_a){
textViewLoaded=_c;
}
}),new objj_method(sel_getUid("expressions"),function(_d,_e){
with(_d){
return expressions;
}
}),new objj_method(sel_getUid("setExpressions:"),function(_f,_10,_11){
with(_f){
expressions=_11;
}
}),new objj_method(sel_getUid("underlyingText"),function(_12,_13){
with(_12){
return underlyingText;
}
}),new objj_method(sel_getUid("setUnderlyingText:"),function(_14,_15,_16){
with(_14){
underlyingText=_16;
}
}),new objj_method(sel_getUid("isUpdatingView"),function(_17,_18){
with(_17){
return updatingView;
}
}),new objj_method(sel_getUid("setUpdatingView:"),function(_19,_1a,_1b){
with(_19){
updatingView=_1b;
}
}),new objj_method(sel_getUid("initWithCibName:bundle:externalNameTable:"),function(_1c,_1d,_1e,_1f,_20){
with(_1c){
_1c=objj_msgSendSuper({receiver:_1c,super_class:objj_getClass("RGDocumentViewController").super_class},"initWithCibName:bundle:externalNameTable:",_1e,_1f,_20);
if(!_1c){
return nil;
}
objj_msgSend(_1c,"setUnderlyingText:",objj_msgSend(objj_msgSend(_1c,"class"),"defaultUnderlyingText"));
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_1c,sel_getUid("handleExpressionDidChangePattern:"),RGExpressionDidChangePatternNotification,nil);
return _1c;
}
}),new objj_method(sel_getUid("loadView"),function(_21,_22){
with(_21){
objj_msgSend(_21,"setView:",objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,256,256)));
objj_msgSend(objj_msgSend(_21,"view"),"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
var _23=objj_msgSend(_21,"view");
var _24=objj_msgSend(_23,"bounds");
objj_msgSend(objj_msgSend(_21,"textView"),"setFrame:",_24);
objj_msgSend(objj_msgSend(_21,"view"),"addSubview:",objj_msgSend(_21,"textView"));
}
}),new objj_method(sel_getUid("textView"),function(_25,_26){
with(_25){
if(textView){
return textView;
}
textView=objj_msgSend(objj_msgSend(WKTextView,"alloc"),"initWithFrame:",CGRectMakeZero());
objj_msgSend(textView,"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
objj_msgSend(textView,"setDelegate:",_25);
return textView;
}
}),new objj_method(sel_getUid("textViewDidLoad:"),function(_27,_28,_29){
with(_27){
objj_msgSend(_27,"setTextViewLoaded:",YES);
objj_msgSend(objj_msgSend(_27,"textView"),"setHtmlValue:",objj_msgSend(_27,"underlyingText"));
objj_msgSend(_27,"updateView");
}
}),new objj_method(sel_getUid("textViewDidBeginEditing:"),function(_2a,_2b,_2c){
with(_2a){
var _2d=(function(){
return objj_msgSend(objj_msgSend(_2a,"textView"),"htmlValue").replace(/<b>/g,"").replace(/<\/b>/g,"");
})();
objj_msgSend(objj_msgSend(_2a,"textView"),"setHtmlValue:",_2d);
}
}),new objj_method(sel_getUid("textViewDidEndEditing:"),function(_2e,_2f,_30){
with(_2e){
if(!objj_msgSend(_2e,"isUpdatingView")){
objj_msgSend(_2e,"updateView");
}
}
}),new objj_method(sel_getUid("handleExpressionDidChangePattern:"),function(_31,_32,_33){
with(_31){
objj_msgSend(_31,"updateView");
}
}),new objj_method(sel_getUid("updateView"),function(_34,_35){
with(_34){
if(!objj_msgSend(_34,"textViewLoaded")){
return;
}
objj_msgSend(_34,"setUpdatingView:",YES);
var _36=(function(){
return objj_msgSend(objj_msgSend(_34,"textView"),"htmlValue").replace(/<b>/g,"").replace(/<\/b>/g,"");
})();
var _37=_36;
objj_msgSend(objj_msgSend(_34,"expressions"),"enumerateObjectsUsingBlock:",function(_38,_39){
var _3a=objj_msgSend(_38,"stringByReplacingMatchesInString:usingBlock:",_37,function(_3b){
return "<b>"+_3b+"</b>";
});
if(_3a){
_37=_3a;
}
});
if(_37!=objj_msgSend(objj_msgSend(_34,"textView"),"htmlValue")){
objj_msgSend(objj_msgSend(_34,"textView"),"setDelegate:",nil);
objj_msgSend(objj_msgSend(_34,"textView"),"setHtmlValue:",_37);
objj_msgSend(objj_msgSend(_34,"textView"),"setDelegate:",_34);
}
objj_msgSend(_34,"setUpdatingView:",NO);
}
}),new objj_method(sel_getUid("setExpressions:"),function(_3c,_3d,_3e){
with(_3c){
if(expressions==_3e){
return;
}
expressions=_3e;
objj_msgSend(_3c,"updateView");
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("defaultUnderlyingText"),function(_3f,_40){
with(_3f){
var _41=objj_msgSend(objj_msgSend(CPBundle,"bundleForClass:",objj_msgSend(_3f,"class")),"pathForResource:","RGDocumentViewSample.txt");
var _42=objj_msgSend(CPURLRequest,"requestWithURL:",objj_msgSend(CPURL,"URLWithString:",_41));
var _43=nil;
var _44=objj_msgSend(CPURLConnection,"sendSynchronousRequest:returningResponse:",_42,nil);
var _45=objj_msgSend(_44,"string").replace(/\n/g,"<br />");
return _45;
}
})]);
p;14;RGExpression.jt;2316;@STATIC;1.0;I;21;Foundation/CPObject.jt;2271;
objj_executeFile("Foundation/CPObject.j",NO);
RGExpressionDidChangePatternNotification="RGExpressionDidChangePatternNotification";
var _1=objj_allocateClassPair(CPObject,"RGExpression"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("pattern")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("pattern"),function(_3,_4){
with(_3){
return pattern;
}
}),new objj_method(sel_getUid("setPattern:"),function(_5,_6,_7){
with(_5){
pattern=_7;
}
}),new objj_method(sel_getUid("initWithPattern:"),function(_8,_9,_a){
with(_8){
_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("RGExpression").super_class},"init");
if(!_8){
return nil;
}
objj_msgSend(_8,"setPattern:",_a);
return _8;
}
}),new objj_method(sel_getUid("init"),function(_b,_c){
with(_b){
return objj_msgSend(_b,"initWithPattern:",nil);
}
}),new objj_method(sel_getUid("description"),function(_d,_e){
with(_d){
return objj_msgSend(CPString,"stringWithFormat:","<%@: %@>",CPStringFromClass(objj_msgSend(_d,"class")),objj_msgSend(_d,"pattern"));
}
}),new objj_method(sel_getUid("setPattern:"),function(_f,_10,_11){
with(_f){
if(objj_msgSend(pattern,"isEqual:",_11)){
return;
}
pattern=_11;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",RGExpressionDidChangePatternNotification,_f);
}
}),new objj_method(sel_getUid("matchesInString:"),function(_12,_13,_14){
with(_12){
if(!objj_msgSend(_12,"pattern")||!_14){
return nil;
}
var _15=new RegExp(objj_msgSend(_12,"pattern"),"gi");
console.log(_15);
return _15.exec(_14);
}
}),new objj_method(sel_getUid("stringByReplacingMatchesInString:withString:"),function(_16,_17,_18,_19){
with(_16){
if(!objj_msgSend(_16,"pattern")||!_18||!_19){
return nil;
}
var _1a=new RegExp(objj_msgSend(_16,"pattern"),"gi");
return _18.replace(_1a,_19);
}
}),new objj_method(sel_getUid("stringByReplacingMatchesInString:usingBlock:"),function(_1b,_1c,_1d,_1e){
with(_1b){
if(!objj_msgSend(_1b,"pattern")||!_1d||!_1e){
return nil;
}
var _1f=new RegExp(objj_msgSend(_1b,"pattern"),"gi");
return _1d.replace(_1f,_1e);
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("expressionWithPattern:"),function(_20,_21,_22){
with(_20){
return objj_msgSend(objj_msgSend(_20,"alloc"),"initWithPattern:",_22);
}
})]);
p;27;RGRegexListViewController.jt;7592;@STATIC;1.0;I;25;AppKit/CPViewController.ji;14;RGExpression.jt;7524;
objj_executeFile("AppKit/CPViewController.j",NO);
objj_executeFile("RGExpression.j",YES);
var _1=objj_allocateClassPair(CPViewController,"RGRegexListViewController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("buttonBar"),new objj_ivar("tableScrollView"),new objj_ivar("tableView"),new objj_ivar("arrayController"),new objj_ivar("addButton"),new objj_ivar("removeButton"),new objj_ivar("delegate")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("buttonBar"),function(_3,_4){
with(_3){
return buttonBar;
}
}),new objj_method(sel_getUid("tableScrollView"),function(_5,_6){
with(_5){
return tableScrollView;
}
}),new objj_method(sel_getUid("tableView"),function(_7,_8){
with(_7){
return tableView;
}
}),new objj_method(sel_getUid("arrayController"),function(_9,_a){
with(_9){
return arrayController;
}
}),new objj_method(sel_getUid("addButton"),function(_b,_c){
with(_b){
return addButton;
}
}),new objj_method(sel_getUid("removeButton"),function(_d,_e){
with(_d){
return removeButton;
}
}),new objj_method(sel_getUid("delegate"),function(_f,_10){
with(_f){
return delegate;
}
}),new objj_method(sel_getUid("setDelegate:"),function(_11,_12,_13){
with(_11){
delegate=_13;
}
}),new objj_method(sel_getUid("fireUpdateNotification"),function(_14,_15){
with(_14){
var _16=objj_msgSend(objj_msgSend(_14,"tableView"),"selectedRowIndexes");
var _17=objj_msgSend(objj_msgSend(objj_msgSend(_14,"arrayController"),"arrangedObjects"),"objectsAtIndexes:",_16);
objj_msgSend(objj_msgSend(_14,"delegate"),"regexListViewController:didSelectExpressions:",_14,_17);
}
}),new objj_method(sel_getUid("loadView"),function(_18,_19){
with(_18){
objj_msgSend(_18,"setView:",objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,256,256)));
objj_msgSend(objj_msgSend(_18,"view"),"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
var _1a=objj_msgSend(_18,"view");
var _1b=objj_msgSend(_1a,"bounds");
objj_msgSend(_1a,"addSubview:",objj_msgSend(_18,"buttonBar"));
objj_msgSend(_1a,"addSubview:",objj_msgSend(_18,"tableScrollView"));
var _1c=CGRectGetHeight(objj_msgSend(objj_msgSend(_18,"buttonBar"),"bounds"));
var _1d=CGRectMakeCopy(_1b);
_1d.origin.y+=_1d.size.height-_1c;
_1d.size.height=_1c;
objj_msgSend(objj_msgSend(_18,"buttonBar"),"setFrame:",_1d);
objj_msgSend(objj_msgSend(_18,"buttonBar"),"setAutoresizingMask:",CPViewMinYMargin|CPViewWidthSizable);
var _1e=CGRectMakeCopy(_1b);
_1e.size.height-=_1c;
objj_msgSend(objj_msgSend(_18,"tableScrollView"),"setFrame:",_1e);
objj_msgSend(objj_msgSend(_18,"tableScrollView"),"setAutoresizingMask:",CPViewWidthSizable|CPViewHeightSizable);
}
}),new objj_method(sel_getUid("tableViewSelectionDidChange:"),function(_1f,_20,_21){
with(_1f){
if(objj_msgSend(_21,"object")!=tableView){
return;
}
objj_msgSend(_1f,"fireUpdateNotification");
}
}),new objj_method(sel_getUid("tableView:shouldEditTableColumn:row:"),function(_22,_23,_24,_25,_26){
with(_22){
return YES;
}
}),new objj_method(sel_getUid("buttonBar"),function(_27,_28){
with(_27){
if(buttonBar){
return buttonBar;
}
buttonBar=objj_msgSend(objj_msgSend(CPButtonBar,"alloc"),"initWithFrame:",CGRectMake(0,0,128,26));
objj_msgSend(buttonBar,"setButtons:",[objj_msgSend(_27,"addButton"),objj_msgSend(_27,"removeButton")]);
return buttonBar;
}
}),new objj_method(sel_getUid("addButton"),function(_29,_2a){
with(_29){
if(_2b){
return _2b;
}
var _2b=objj_msgSend(CPButtonBar,"plusButton");
objj_msgSend(_2b,"setTarget:",_29);
objj_msgSend(_2b,"setAction:",sel_getUid("handleAdd:"));
return _2b;
}
}),new objj_method(sel_getUid("handleAdd:"),function(_2c,_2d,_2e){
with(_2c){
var _2f=objj_msgSend(RGExpression,"expressionWithPattern:",nil);
objj_msgSend(objj_msgSend(_2c,"arrayController"),"addObject:",_2f);
var _30=objj_msgSend(objj_msgSend(objj_msgSend(_2c,"arrayController"),"arrangedObjects"),"indexOfObject:",_2f);
if(_30==CPNotFound){
CPLog("BOO");
return;
}
objj_msgSend(objj_msgSend(_2c,"tableView"),"selectRowIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_30),NO);
objj_msgSend(objj_msgSend(_2c,"tableView"),"editColumn:row:withEvent:select:",0,_30,nil,NO);
objj_msgSend(_2c,"fireUpdateNotification");
}
}),new objj_method(sel_getUid("removeButton"),function(_31,_32){
with(_31){
if(_33){
return _33;
}
var _33=objj_msgSend(CPButtonBar,"minusButton");
objj_msgSend(_33,"setTarget:",_31);
objj_msgSend(_33,"setAction:",sel_getUid("handleRemove:"));
objj_msgSend(_33,"bind:toObject:withKeyPath:options:","enabled",objj_msgSend(_31,"arrayController"),"canRemove",nil);
return _33;
}
}),new objj_method(sel_getUid("handleRemove:"),function(_34,_35,_36){
with(_34){
objj_msgSend(objj_msgSend(_34,"arrayController"),"removeObjects:",objj_msgSend(objj_msgSend(_34,"arrayController"),"selectedObjects"));
objj_msgSend(_34,"fireUpdateNotification");
}
}),new objj_method(sel_getUid("tableView"),function(_37,_38){
with(_37){
if(tableView){
return tableView;
}
tableView=objj_msgSend(objj_msgSend(CPTableView,"alloc"),"initWithFrame:",CGRectMake(0,0,384,384));
objj_msgSend(tableView,"setGridColor:",objj_msgSend(CPColor,"colorWithHexString:","dce0e2"));
objj_msgSend(tableView,"setGridStyleMask:",CPTableViewSolidHorizontalGridLineMask);
objj_msgSend(tableView,"setRowHeight:",72);
objj_msgSend(tableView,"setColumnAutoresizingStyle:",CPTableViewFirstColumnOnlyAutoresizingStyle);
objj_msgSend(tableView,"setAllowsMultipleSelection:",YES);
objj_msgSend(tableView,"bind:toObject:withKeyPath:options:","content",objj_msgSend(_37,"arrayController"),"arrangedObjects",nil);
objj_msgSend(tableView,"setDelegate:",_37);
objj_msgSend(tableView,"setDataSource:",_37);
var _39=objj_msgSend(objj_msgSend(CPTableColumn,"alloc"),"initWithIdentifier:","pattern");
objj_msgSend(objj_msgSend(_39,"headerView"),"setStringValue:","Expressions");
objj_msgSend(_39,"bind:toObject:withKeyPath:options:",CPValueBinding,objj_msgSend(_37,"arrayController"),"arrangedObjects.pattern",nil);
objj_msgSend(_39,"setEditable:",YES);
var _3a=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"init");
objj_msgSend(_3a,"setLineBreakMode:",CPLineBreakByWordWrapping);
objj_msgSend(_3a,"setValue:forThemeAttribute:inState:",objj_msgSend(CPFont,"systemFontOfSize:",13),"font",CPThemeStateTableDataView);
objj_msgSend(_3a,"setTextFieldBackgroundColor:",objj_msgSend(CPColor,"redColor"));
objj_msgSend(_39,"setDataView:",_3a);
objj_msgSend(tableView,"addTableColumn:",_39);
return tableView;
}
}),new objj_method(sel_getUid("tableScrollView"),function(_3b,_3c){
with(_3b){
if(tableScrollView){
return tableScrollView;
}
tableScrollView=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",CGRectMake(0,0,384,384));
objj_msgSend(tableScrollView,"setDocumentView:",objj_msgSend(_3b,"tableView"));
return tableScrollView;
}
}),new objj_method(sel_getUid("arrayController"),function(_3d,_3e){
with(_3d){
if(arrayController){
return arrayController;
}
arrayController=objj_msgSend(objj_msgSend(CPArrayController,"alloc"),"init");
objj_msgSend(arrayController,"setContent:",objj_msgSend(objj_msgSend(_3d,"class"),"defaultExpressions"));
CPLog(objj_msgSend(arrayController,"content"));
CPLog(objj_msgSend(arrayController,"arrangedObjects"));
return arrayController;
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("defaultExpressions"),function(_3f,_40){
with(_3f){
var _41=[objj_msgSend(RGExpression,"expressionWithPattern:","(((http|ftp|https):\\/\\/)|www\\.)[\\w\\-_]+(\\.[\\w\\-_]+)+([\\w\\-\\.,@?^=%&:\\/~\\+#!]*[\\w\\-\\@?^=%&\\/~\\+#])?"),];
CPLog(_41);
return _41;
}
})]);
e;