//
//  UMGSMMAP_Reset_Id_List.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 14.09.21.
//  Copyright © 2021 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_Reset_Id.h"

@interface UMGSMMAP_Reset_Id_List : UMASN1Sequence
{
    NSString *operationName;
    NSMutableArray *_sequenceEntries;
}
@property(readwrite,strong)    NSString         *operationName;
@property(readwrite,strong)    NSMutableArray   *sequenceEntries;

- (void)processBeforeEncode;
- (UMGSMMAP_Reset_Id_List *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (void)addEntry:(UMGSMMAP_Reset_Id *)e;
@end

