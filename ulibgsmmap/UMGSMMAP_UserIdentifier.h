//
//  UMGSMMAP_UserIdentifier.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 12.12.17.
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulib/ulib.h>

@interface UMGSMMAP_UserIdentifier : UMObject
{
    NSString *_userIdentifier;
}

@property(readwrite,strong) NSString *userIdentifier;

- (UMGSMMAP_UserIdentifier *)initWithString:(NSString *)str;

@end

