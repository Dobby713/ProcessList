//
//  ProcessList.h
//  ProcessList
//
//  Created by hypark on 2021/05/13.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProcessList : NSObject {

@private
    int numberOfProcesses;
    NSMutableArray *processList;
}

@property(nonatomic, retain) NSMutableArray *processList;

- (id)init;
- (int)numberOfProcesses;
- (void)obtainFreshProcessList;
- (BOOL)findProcessWithName:(NSString *)procNameToSearch;

@end

NS_ASSUME_NONNULL_END
