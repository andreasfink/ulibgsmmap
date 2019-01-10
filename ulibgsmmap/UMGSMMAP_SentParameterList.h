//
//  UMGSMMAP_SentParameterList.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 09.01.19.
//  Copyright © 2019 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"


@interface UMGSMMAP_SentParameterList : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
    NSString *operationName;
    NSMutableArray *_sequenceEntries;
}
@end

