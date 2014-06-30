#import <Foundation/NSUserDefaults.h>


@interface SBIconBadgeView : UIView
@end

@interface NSUserDefaults (extras) 
-(id)objectForKey:(id)arg1 inDomain:(id)arg2 ;
@end

%hook SBIconBadgeView

-(void)setAlpha:(CGFloat)arg1 {
	CGFloat myAlpha = [[[NSUserDefaults standardUserDefaults] objectForKey:@"alpha" inDomain:@"com.twodayslate.alphabadge"] floatValue]/100;
	if(arg1 > myAlpha) {
		arg1 = myAlpha;
	}
	%orig;
}
%end

%ctor {
	dlopen("/Library/MobileSubstrate/DynamicLibraries/ColorBadges.dylib", RTLD_NOW);
	dlopen("/Library/MobileSubstrate/DynamicLibraries/Apex.dylib", RTLD_NOW);
	dlopen("/Library/MobileSubstrate/DynamicLibraries/Springtomize3.dylib", RTLD_NOW);
	dlopen("/Library/MobileSubstrate/DynamicLibraries/SpringtomizeUbiquitous.dylib", RTLD_NOW);
}
