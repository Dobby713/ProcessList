//
//  ProcessList.m
//  ProcessList
//
//  Created by hypark on 2021/05/13.
//

#import "ProcessList.h"
#include <sys/sysctl.h>

typedef struct kinfo_proc kinfo_proc;

@implementation ProcessList

@synthesize processList;

- (id)init {
    self = [super init];
    
    if (self != nil){
        numberOfProcesses = -1;
        processList = [NSMutableArray new];
    }
    return self;
}

- (int)numberOfProcesses {
    return numberOfProcesses;
}

- (void)setNumberOfProcesses:(int)num {
    numberOfProcesses = num;
}

- (int)getBSDProcessList:(kinfo_proc **)procList withNumberOfProcesses:(size_t *)procCount {
    int             err;
    kinfo_proc *    result;
    bool            done;
    static const int    name[] = {CTL_KERN, KERN_PROC, KERN_PROC_ALL, 0};
    size_t          length;
    
    assert( procList != NULL );
    assert( *procList == NULL );
    assert( procCount != NULL );
    
    *procCount = 0;
    
    result = NULL;
    done = false;
    
    do {
        assert( result == NULL );
        
        length = 0;
        err = sysctl((int *)name, (sizeof(name)/sizeof(* name))-1, NULL, &length, NULL, 0);
        
        if (err == 0){
            result = malloc(length);
            if (result == NULL)
                err = ENOMEM;
        }
        if (err == 0){
            err = sysctl ((int *)name, (sizeof(name)/sizeof(* name))-1, result, &length, NULL, 0);
            
            if (err == -1)
                err = errno;
            if (err == 0)
                done = true;
            else if (err == ENOMEM) {
                assert( result != NULL );
                free (result);
                result = NULL;
                err = 0;
            }
        }
    } while (err == 0 && !done);
    
    if (err != 0 && result != NULL) {
        free(result);
        result = NULL;
    }
    
    *procList = result;
    if (err == 0)
        *procCount = length / sizeof(kinfo_proc);
    
    assert( (err == 0) == (*procList != NULL ));
    
    return err;
}

- (void)obtainFreshProcessList {
    int i;
    kinfo_proc *allProcs = 0;
    size_t numProcs;
    
    int err = [self getBSDProcessList:&allProcs withNumberOfProcesses:&numProcs];
    
    if (err) {
        numberOfProcesses = -1;
        processList = NULL;
        
        return;
    }
    [processList removeAllObjects];
    
    for( i=0; i < numProcs; i++) {
        NSString *processName = [[NSString alloc] initWithFormat:@"%s", allProcs[i].kp_proc.p_comm];
        [processList addObject:processName];
    }
    [self setNumberOfProcesses:(int)numProcs];
    free(allProcs);
}

- (BOOL)findProcessWithName:(NSString *)procNameToSearch {
    NSInteger index;
    index = [processList indexOfObject: procNameToSearch];
    
    if (index == NSNotFound)
        return NO;
    else
        return YES;
}

@end
