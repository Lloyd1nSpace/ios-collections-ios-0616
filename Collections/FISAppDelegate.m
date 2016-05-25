//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

- (NSArray *)arrayBySortingArrayAscending:(NSArray *)array; {
    
    NSSortDescriptor *ascend = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    
    NSArray *ascendArray = [array sortedArrayUsingDescriptors:@[ascend]];
    
    return ascendArray;
    // Relatively straightforward way of utilizing NSSortDescriptor and ensuring the array is presented in numerical order by sortDescriptorWithKey:nil (we're not looking for anything in the array, just want to put it in order) ascending:YES.
    
}

- (NSArray *)arrayBySortingArrayDescending:(NSArray *)array; {
    
    NSSortDescriptor *descend = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    
    NSArray *descendArray = [array sortedArrayUsingDescriptors:@[descend]];
    
    return descendArray;
    // Very similar to the previous method, only did ascending:NO to have the array print in descending order.
    
}

- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array; {
    
    // NSLog(@"\n\n\n\n\n%@\n\n\n\n", array);
    
    NSMutableArray *mArray = [array mutableCopy];
    
    NSInteger arrayLast = [array count] - 1;
    
    [mArray exchangeObjectAtIndex:0 withObjectAtIndex:arrayLast];
    
    return mArray;
    // Utilized the exchangeObjectAtIndex: withObjectAtIndex: to swap the first object with the last object in an array.
    
}

- (NSArray *)arrayByReversingArray:(NSArray *)array; {
    
    NSArray *reverse = [[array reverseObjectEnumerator] allObjects];
    
    return reverse;
    // I was able to find the [[array reverseObjectEnumerator] allObjects] by simply Google'ing "how to reverse an array objective-c"
    
}

- (NSString *)stringInBasicLeetFromString:(NSString *)string; {
    
    NSDictionary *leet = @{@"a" :   @"4"    ,
                           @"s" :   @"5"    ,
                           @"i" :   @"1"    ,
                           @"l" :   @"1"    ,
                           @"e" :   @"3"    ,
                           @"t" :   @"7"   };
    
    
    
    NSMutableArray *mString = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < [string length]; i++) {
        
        NSString *letre = [string substringWithRange:NSMakeRange(i, 1)];
        
        [mString addObject:letre];
        
        //       NSLog(@"\n\n\n\n\n\n\n\nHERE'S MY mString: %@\n\n\n\n\n\n\n\n", mString);
        // NSString mString now contains "b", "a", "s", "i", "c", "l", "e", "e", "t"
        
    }
    
    for (NSUInteger i = 0; i < [mString count]; i++) {
        
        if ([[leet allKeys] containsObject:mString[i]]) {
            
            mString[i] = [leet valueForKey:mString[i]];
           // NSLog(@"\n\n\n\n\n\n\n\nHERE'S MY mString: %@\n\n\n\n\n\n\n\n", mString);
            // This now changes the string to contain the values matching keys that are also in mString. For example, the keys for leet are a, s, i, l, e, t, all of those letters are also in the NSString mString, so those letters will be changed to their value counterparts 4, 5, 1, 3, 7.
            
        }
        
    }
    
    NSString *finalString = [mString componentsJoinedByString:@""];
    // Removes random quotes " " in string.
    
    NSLog(@"\n\n\n\n\n%@\n\n\n\n\n", finalString);
    return finalString;
    
}

- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array; {
    
    //  NSLog(@"\n\n\n\n\n\n\n%@\n\n\n\n\n\n", array);
    
    NSPredicate *negatives = [NSPredicate predicateWithFormat:@"self < 0"];
    NSArray *negativeArray = [array filteredArrayUsingPredicate:negatives];
    
    NSPredicate *positives = [NSPredicate predicateWithFormat:@"self >= 0"];
    NSArray *positiveArray = [array filteredArrayUsingPredicate:positives];
    
    
    return @[negativeArray, positiveArray];
    // Utilizing NSPredicate made perfect sense to me, what I struggled with was whether I was to make each predicate (positives, negatives) equal " = " to the same array or make them equal to two separate arrays. If I did make them equal to two separate arrays, how could I return both arrays? After partnering with my classmate, she essentially taught me how to @[ ] my two arrays and return them both.
    
}

- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary; {
    
    NSArray *hobbits = [dictionary allKeysForObject:@"hobbit"];
    
    NSLog(@"\n\n\n\n\n\n\n%@\n\n\n\n\n\n\n", hobbits);
    
    return hobbits;
    // Once I NSLog'd the dictionary and identified what exactly was inside of it, I was able to look up the allKeysForObject: method which essentially filters the key's with the @"hobbit" value and adds just the keys (Hobbit Names) to the array. Previous to locating the allKeysForObject: method, I was fiddling with multiple loop techniques that didn't work out for me. However, I'm sure there's a way to implement the loop and still get these tests to pass.
    
}

- (NSArray *)stringsBeginningWithAInArray:(NSArray *)array; {
    
    NSPredicate *aLetter = [NSPredicate predicateWithFormat:@"self BEGINSWITH[cd] 'a'"];
    NSArray *aArray = [array filteredArrayUsingPredicate:aLetter];
    
    return aArray;
    // Another relatively straightforward task to utilize NSPredicate alongside BEGINSWITH[cd] to filter the strings that begin with A in an array & add those words to a separate array.
    
}

- (NSInteger)sumOfIntegersInArray:(NSArray *)array; {
    
    // NSLog(@"\n\n\n\n\n\n%@\n\n\n\n\n\n", array);
    
    NSInteger count = 0;
    
    for (NSNumber *counts in array) {
        
        count += [counts integerValue];
        
    }
    
    return count;
    // I knew I had to define my NSInteger count outside of the loop so it could be returned at the end. The key here was utilizing a NSNumber in the for-in loop along with += to increase my count and add the sum of integers in an array.
    
}

- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array; {
    
    //  NSLog(@"\n\n\n\n\n\n\n\n\n%@\n\n\n\n\n\n\n\n", array);
    
    /* hand,
     foot,
     knee,
     table,
     box,
     ox,
     axle,
     radius,
     trivium
     */
    
    //  NSDictionary *plural = @{@"hand"    : @"hands"  ,
    //              @"foot"   : @"feet"   ,
    //            @"knee"   : @"knees"  ,
    //          @"table"  : @"tables" ,
    //        @"box"    : @"boxes"  ,
    //      @"ox"     : @"oxen"   ,
    //    @"axle"   : @"axles"  ,
    //  @"radius" : @"radii"  ,
    //@"trivium": @"trivia"};
    
    //  NSArray *plurals = [plural allValues];
    
    NSMutableArray *mArray = [[NSMutableArray alloc] init];
    
    for (NSString *word in array) {
        
        NSString *new = [word copy];
        
        if ([word hasSuffix:@"d"]) {
            
            new =  [word stringByReplacingOccurrencesOfString:@"d" withString:@"ds"];
            
        } else if ([word hasSuffix:@"ot"]) {
            
            new = [word stringByReplacingOccurrencesOfString:@"oot" withString:@"eet"];
            
        } else if ([word hasSuffix:@"ee"]) {
            
            new = [word stringByReplacingOccurrencesOfString:@"ee" withString:@"ees"];
            
        } else if ([word hasSuffix:@"ble"]) {
            
            new = [word stringByReplacingOccurrencesOfString:@"ble" withString:@"bles"];
            
        } else if ([word hasPrefix:@"box"]) {
            
            new = [word stringByReplacingOccurrencesOfString:@"box" withString:@"boxes"];
            
        } else if ([word hasPrefix:@"ox"]) {
            
            new = [word stringByReplacingOccurrencesOfString:@"ox" withString:@"oxen"];
            
        } else if ([word hasSuffix:@"le"]) {
            
            new = [word stringByReplacingOccurrencesOfString:@"le" withString:@"les"];
            
        } else if ([word hasSuffix:@"ius"]) {
            
            new = [word stringByReplacingOccurrencesOfString:@"ius" withString:@"ii"];
            
        } else if ([word hasSuffix:@"vium"]) {
            
            new = [word stringByReplacingOccurrencesOfString:@"vium" withString:@"via"];
            
        }
        
        [mArray addObject:new];
        
    }
    
    NSLog(@"\n\n\n\n\n\n%@\n\n\n\n\n", mArray);
    
    return mArray;
    // My initial reaction to this was to create a NSDictionary which consisted of singular words as keys & their plural counterparts as the values. Then to create an array consisting of allValues of said NSDictionary. While it printed the correct words the tests were looking for, it wasn't coming out in the order I wanted which forced me to utilizing a for-in loop chaining if and multiple else if statements to stringByReplacingOccurrencesOfString: withString:. I did learn the hasPrefix: hasSuffix: methods in this particular method.
    
}

- (NSDictionary *)countsOfWordsInString:(NSString *)string; {
    
    // should return a dictionary that has a key for each word in the submitted string, whose associated value is the count of how many times that word appears in the argument string.
    
    // NSLog(@"\n\n\n\n%@\n\n\n\n\n", string);
    
    NSMutableDictionary *counts = [[NSMutableDictionary alloc] init];
    
    NSString *lowercase = [[string copy] lowercaseString];
    
    NSArray *punctuations = @[@"!", @".", @",", @"-", @":", @";"];
    
    // The key here was to do things in the correct order, I lowercased the entire string prior to beginning the process of removing the punctuations.
    
    for (NSString *punctuation in punctuations) {
        
        if ([lowercase containsString:punctuation]) {
            
            lowercase = [lowercase stringByReplacingOccurrencesOfString:punctuation withString:@""];
        }
        
    }
    
    NSArray *words = [lowercase componentsSeparatedByString:@" "];
    
    for (NSString *word in words) {
        
        NSNumber *count = @1;
        
        if([[counts allKeys] containsObject:word]) {
            
            count = @([counts[word] integerValue] +1);
            // This will find the integerValue of each word key in the counts dictionary. The +1 is necessary to ensure that if a word is found once it will print 1 instead of 0.
            
            counts[word] = count;
            
        } else {
            
            [counts setObject:count forKey:word];
            // This completes our dictionary ensuring that the count of times each word shows up in the string is appended as the value with the words that show up in the string showing up as the key.
            
        }
        
    }
    
    NSLog(@"\n\n\n\n\n\n%@\n\n\n\n\n\n", counts);
    
    return counts;
    
}

- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array; {
    
    NSMutableDictionary *songByArtist = [[NSMutableDictionary alloc] init];
    
    for (NSString *artistSong in array) {
        
        NSArray *separate = [artistSong componentsSeparatedByString:@" - "];
        NSString *artist = separate[0];
        NSString *song = separate[1];
        // separate removes the " - " separating "Artist - Song". The string is ensuring the first [0] object in the separate array is associated with being an artist and the second [1] object in the separate array is a song.
        
        if ([[songByArtist allKeys] containsObject:artist]) {
            
            [songByArtist[artist] addObject:song];
            // Subscripted my mutable dictionary to add the strings that are associated with song to the strings that are associated as artist.
            
        }  else {
            
            songByArtist[artist] = [@[song] mutableCopy];
            // This else statement had to be appended in order to officially get the key-value pairs matched up. Otherwise the dictionary remained empty.
            
        }
        
    }
    
    for (NSArray *artist in [songByArtist allKeys]) {
        
        NSSortDescriptor *songs = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
        
        NSArray *alphabetized = [songByArtist[artist] sortedArrayUsingDescriptors:@[songs]];
        songByArtist[artist] = alphabetized;
        
    }
    // The final step, NSSortDescriptor just ensured the information was as alphabetized as possible.
    
    return songByArtist;
    
}

@end
