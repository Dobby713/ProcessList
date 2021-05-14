//
//  AppDelegate.m
//  ProcessList
//
//  Created by hypark on 2021/05/11.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (id)init{
    self = [super init];
    
    if(self){
        ProcessList *procList = [ProcessList new];
        [procList obtainFreshProcessList];
        NSLog(@"H");
    }
    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
