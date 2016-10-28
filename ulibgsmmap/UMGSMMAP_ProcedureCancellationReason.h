//
//  UMGSMMAP_ProcedureCancellationReason.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"


typedef enum UMGSMMAP_ProcedureCancellationReason_enum
{
    UMGSMMAP_ProcedureCancellationReason_handoverCancellation = 0,
    UMGSMMAP_ProcedureCancellationReason_radioChannelRelease = 1,
    UMGSMMAP_ProcedureCancellationReason_networkPathRelease = 2,
    UMGSMMAP_ProcedureCancellationReason_callRelease = 3,
    UMGSMMAP_ProcedureCancellationReason_associatedProcedureFailure = 4,
    UMGSMMAP_ProcedureCancellationReason_tandemDialogueRelease = 5,
    UMGSMMAP_ProcedureCancellationReason_remoteOperationsFailure = 6,
}  UMGSMMAP_ProcedureCancellationReason_enum;


@interface UMGSMMAP_ProcedureCancellationReason : UMASN1Enumerated<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
}
@property(readwrite,strong)    NSString *operationName;

- (UMGSMMAP_ProcedureCancellationReason *)initWithString:(NSString *)s;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end
