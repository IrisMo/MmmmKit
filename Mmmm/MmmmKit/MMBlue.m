//
//  MMBlue.m
//  MmmmKit
//
//  Created by minew on 2020/10/21.
//

#import "MMBlue.h"

@implementation MMBlue

+ (instancetype)sharedInstance
{
    static MMBlue *m = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        m = [[MMBlue alloc] init];
    });
    return m;
}

- (void)print {
    NSLog(@"233333");
}

@end
