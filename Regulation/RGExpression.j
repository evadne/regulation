@import <Foundation/CPObject.j>

RGExpressionDidChangePatternNotification = @"RGExpressionDidChangePatternNotification";

@implementation RGExpression : CPObject {
	
	CPString pattern @accessors;
	
}

+ (id) expressionWithPattern:(CPString)aPattern {
	
	return [[self alloc] initWithPattern:aPattern];
	
}

- (id) initWithPattern:(CPString)aPattern {
	
	self = [super init];
	if (!self)
		return nil;
		 
	[self setPattern:aPattern];
	return self;
	
}

- (id) init {
	
	return [self initWithPattern:nil];
	
}

- (CPString) description {
	
    return [CPString stringWithFormat:"<%@: %@>", CPStringFromClass([self class]), [self pattern]];
	
}

- (void) setPattern:(CPString)newPattern {
	
	if ([pattern isEqual:newPattern])
		return;
	
	pattern = newPattern;
	
	[[CPNotificationCenter defaultCenter] postNotificationName:RGExpressionDidChangePatternNotification object:self];
	
}

- (CPArray) matchesInString:(CPString)aString {
	
	if (![self pattern] || !aString)
		return nil;
	
	var regExp = new RegExp([self pattern], @"gi");
	
	console.log(regExp);
	
	return regExp.exec(aString);
	
}

- (CPString) stringByReplacingMatchesInString:(CPString)aString withString:(CPString)replacementString {
	
	if (![self pattern] || !aString || !replacementString)
		return nil;
	
	var regExp = new RegExp([self pattern], @"gi");
	
	return aString.replace(regExp, replacementString);
	
}

- (CPString) stringByReplacingMatchesInString:(CPString)aString usingBlock:(Function)aBlock {
	
	if (![self pattern] || !aString || !aBlock)
		return nil;
	
	var regExp = new RegExp([self pattern], @"gi");
	
	return aString.replace(regExp, aBlock);
	
}

@end
	
