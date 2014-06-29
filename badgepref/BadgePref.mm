//#import <Preferences/PSListController.h>
//#include <Preferences/Preferences.h>
#import <CoreFoundation/CoreFoundation.h>

@interface PSViewController 
-(void)setPreferenceValue:(id)arg1 specifier:(id)arg2 ;
@end

@interface PSListController : PSViewController { 
	NSArray* _specifiers; 
}
-(void)loadView;
-(id)loadSpecifiersFromPlistName:(id)arg1 target:(id)arg2 ;
-(void)reloadSpecifier:(id)arg1 ;
-(id)specifierForID:(id)arg1 ;
@end

@interface PSSpecifier
@end

@interface PSTableCell : UITableViewCell
-(id)initWithStyle:(int)arg1 reuseIdentifier:(id)arg2 specifier:(id)arg3 ;
@end

@interface AlphaBadgePrefListController: PSListController {
}
@end

@implementation AlphaBadgePrefListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"BadgePref" target:self] retain];
	}
	return _specifiers;
}


-(void)respring {
	system("killall -9 SpringBoard");
}
@end