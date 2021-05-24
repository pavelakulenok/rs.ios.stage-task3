#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {

    NSMutableString *mutableString1 = [NSMutableString stringWithString: string1];
    NSMutableString *mutableString2 = [NSMutableString stringWithString: string2];
    NSMutableString *resultString = [NSMutableString new];

    while ([mutableString1 length] != 0 && [mutableString2 length] != 0) {
        if ([mutableString1 UTF8String][0] <= [mutableString2 UTF8String][0]) {
            [resultString appendFormat:@"%c", [mutableString1 characterAtIndex:0]];
            [mutableString1 deleteCharactersInRange:NSMakeRange(0, 1)];
        } else {
            [resultString appendFormat:@"%c", [mutableString2 characterAtIndex:0]];
            [mutableString2 deleteCharactersInRange:NSMakeRange(0, 1)];
        }
    }

    if ([mutableString1 length] == 0) {
        [resultString appendString: mutableString2];
    } else {
        [resultString appendString: mutableString1];
    }

    return resultString;
}

@end
