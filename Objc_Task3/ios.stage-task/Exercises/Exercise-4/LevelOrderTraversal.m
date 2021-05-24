#import "LevelOrderTraversal.h"

NSArray *LevelOrderTraversalForTree(NSArray *tree) {

    int level = 0;
    NSMutableArray<NSNumber*>* levelArray = [NSMutableArray new];
    NSMutableArray<NSNumber*> *tempArray = [NSMutableArray new];

    for (NSObject* obj in tree) {
        if (tempArray.count == 0 || tempArray.lastObject.boolValue) {
            if ([obj isKindOfClass:NSNull.class]) {
                [tempArray removeLastObject];
                [tempArray addObject:@NO];
            } else {
                [levelArray addObject:[NSNumber numberWithInt:level]];
                level++;
                [tempArray addObject:@YES];
            }
        } else {
            if ([obj isKindOfClass:NSNull.class]) {
                while (!tempArray.lastObject.boolValue) {
                    [tempArray removeLastObject];
                    level--;
                }
                [tempArray removeLastObject];
                [tempArray addObject:@NO];
            } else {
                [levelArray addObject:[NSNumber numberWithInt:level]];
                level++;
                [tempArray addObject:@YES];
            }
        }
    }

    if (levelArray.count == 0) {
        return  @[];
    }

    int max = [[levelArray valueForKeyPath:@"@max.intValue"] intValue];
    NSMutableArray<NSMutableArray*>* resultArray = [NSMutableArray new];

    for (int i = 0; i<= max; i++) {
        [resultArray addObject:[NSMutableArray new]];
    }

    int j = 0;
    for (int i = 0; i < tree.count; i++) {
        if (![tree[i] isKindOfClass:NSNull.class]) {
            [resultArray[levelArray[j].intValue] addObject: tree[i]];
            j++;
        }
    }

    return resultArray;
}
