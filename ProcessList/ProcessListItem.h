//
//  ProcessListItem.h
//  ProcessList
//
//  Created by hypark on 2021/05/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProcessListItem : NSObject
{
@public
    NSImage *_processIcon;
    NSString *_processName;
    NSString *_processUser;
    NSString *_pid;
    BOOL _hasIcon;
}

- (void)setProcessName:(NSString *)processName ProcessIcon:(NSImage *)processIcon ProcessID:(NSString *)pid ProcessUeser:(NSString *)processUser HasIcon:(BOOL)has;

-(NSImage *)getProcessIcon;
-(NSString *)getProcessName;
-(NSString *)getProcessID;
-(NSString *)getProcessUser;
-(BOOL)hasIcon;


@end

NS_ASSUME_NONNULL_END
