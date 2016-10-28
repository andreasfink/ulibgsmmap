//
//  UMGSMMAP_AbsentSubscriberDiagnosticSM.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

@interface UMGSMMAP_AbsentSubscriberDiagnosticSM : UMASN1Integer<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
}
@property(readwrite,strong)    NSString *operationName;

@end
