//
//  UMGSMMAP_UserIdentifier.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 12.12.17.
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMGSMMAP_UserIdentifier.h"


@implementation UMGSMMAP_UserIdentifier

- (UMGSMMAP_UserIdentifier *)initWithString:(NSString *)str
{
    self = [super init];
    if(self)
    {
        _userIdentifier = str;
    }
    return self;
}

- (NSString *)description
{
    return _userIdentifier;
}

-(UMGSMMAP_UserIdentifier *)copyWithZone:(nullable NSZone *)zone
{
    UMGSMMAP_UserIdentifier *cpy = [[UMGSMMAP_UserIdentifier allocWithZone:zone]init];
    cpy.userIdentifier = _userIdentifier;
    return cpy;
}

- (id)proxyForJson
{
    return _userIdentifier;
}

@end

