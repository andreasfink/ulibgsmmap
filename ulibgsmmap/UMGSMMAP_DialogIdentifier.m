//
//  UMGSMMAP_DialogIdentifier.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 12.12.17.
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import "UMGSMMAP_DialogIdentifier.h"


@implementation UMGSMMAP_DialogIdentifier

- (UMGSMMAP_DialogIdentifier *)initWithString:(NSString *)str
{
    self = [super initWithString:str];
    if(self)
    {
    }
    return self;
}


- (UMGSMMAP_DialogIdentifier *)initWithTcapUserDialogIdentifier:(UMTCAP_UserDialogIdentifier *)tcapUserDialogIdentifier
{
    self = [super init];
    if(self)
    {
        _dialogId = tcapUserDialogIdentifier.dialogId;
    }
    return self;
}

-(UMGSMMAP_DialogIdentifier *)copyWithZone:(nullable NSZone *)zone
{
    UMGSMMAP_DialogIdentifier *cpy = [[UMGSMMAP_DialogIdentifier allocWithZone:zone]init];
    cpy.dialogId = _dialogId;
    return cpy;
}


@end

