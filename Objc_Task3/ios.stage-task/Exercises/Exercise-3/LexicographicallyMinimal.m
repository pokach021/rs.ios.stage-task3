#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    NSMutableString *result = [[NSMutableString alloc] init];
        
        unichar buffer1[string1.length+1];
        unichar buffer2[string2.length+1];
        [string1 getCharacters:buffer1];
        [string2 getCharacters:buffer2];
        
        NSMutableArray *stringArray1 = [[NSMutableArray alloc] init];
        NSMutableArray *stringArray2 = [[NSMutableArray alloc] init];
        
        for (int i=0; i<string1.length; i++) {
            [stringArray1 insertObject:[NSString stringWithFormat:@"%c", buffer1[i]] atIndex:0];
        }
        for (int i=0; i<string2.length; i++) {
            [stringArray2 insertObject:[NSString stringWithFormat:@"%c", buffer2[i]] atIndex:0];
        }
        
        while (stringArray1.count > 0 && stringArray2.count>0) {
            if (([[stringArray1 lastObject] compare:[stringArray2 lastObject]] == NSOrderedAscending) ||
                [[stringArray1 lastObject] compare:[stringArray2 lastObject]] == NSOrderedSame) {
                [result appendString:[stringArray1 lastObject]];
                [stringArray1 removeLastObject];
            } else {
                [result appendString:[stringArray2 lastObject]];
                [stringArray2 removeLastObject];
            }
        }
        
        switch (stringArray1.count) {
            case 0:
                while (stringArray2.count > 0) {
                    [result appendString:stringArray2.lastObject];
                    [stringArray2 removeLastObject];
                }
                break;
            default:
                while(stringArray1.count > 0) {
                    [result appendString:stringArray1.lastObject];
                    [stringArray1 removeLastObject];
                }
                break;
        }
    return result;
}

@end
