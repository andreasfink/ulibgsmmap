//
//  UMGSMMAP_TeleserviceList.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

@interface UMGSMMAP_TeleserviceList : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	NSMutableArray *sequenceEntries;
}
@property(readwrite,strong)    NSString *operationName;
@property(readwrite,strong)    NSMutableArray *sequenceEntries;

- (void)processBeforeEncode;
- (UMGSMMAP_TeleserviceList *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;

@end
