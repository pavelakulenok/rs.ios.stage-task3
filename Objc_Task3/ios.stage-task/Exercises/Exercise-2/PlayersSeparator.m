#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {

    NSInteger count = 0;

    for (NSInteger i = 0; i < ratingArray.count; ++i) {
        for (NSInteger j = i + 1; j < ratingArray.count; ++j) {
            for (NSInteger k = j + 1; k < ratingArray.count; ++k) {
                if (([ratingArray[i] longValue] < [ratingArray[j] longValue] && [ratingArray[j] longValue] < [ratingArray[k] longValue]) ||
                    ([ratingArray[i] longValue] > [ratingArray[j] longValue] && [ratingArray[j] longValue] > [ratingArray[k] longValue])) {
                    count++;
                }
            }
        }
    }
    return count;
}

@end
