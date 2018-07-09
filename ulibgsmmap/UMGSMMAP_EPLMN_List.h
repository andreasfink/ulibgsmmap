//
//  UMGSMMAP_EPLMN_List.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 09.07.18.
//  Copyright © 2018 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"
#import "UMGSMMAP_PLMN_Id.h"

@interface UMGSMMAP_EPLMN_List : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
    NSString *operationName;
    NSMutableArray *_sequenceEntries;
}
- (void)processBeforeEncode;
- (UMGSMMAP_PLMN_Id *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
@property(readwrite,strong,atomic) NSMutableArray *sequenceEntries;

@end

