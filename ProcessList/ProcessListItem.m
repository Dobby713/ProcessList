//
//  ProcessListItem.m
//  ProcessList
//
//  Created by hypark on 2021/05/11.
//

#import "ProcessListItem.h"

@implementation ProcessListItem

- (void)setProcessName:(NSString *)processName ProcessIcon:(NSImage *)processIcon ProcessID:(NSString *)pid ProcessUeser:(NSString *)processUser HasIcon:(BOOL)has;
{
    _processName = processName;
    _processIcon = processIcon;
    _processUser = processUser;
    _pid = pid;
    _hasIcon = has;
}

-(NSImage *)getProcessIcon{
    return _processIcon;
}
-(NSString *)getProcessName{
    return _processName;
}
-(NSString *)getProcessID{
    return _pid;
}
-(NSString *)getProcessUser{
    return _processUser;
}
-(BOOL)hasIcon{
    return _hasIcon;
}



@end
