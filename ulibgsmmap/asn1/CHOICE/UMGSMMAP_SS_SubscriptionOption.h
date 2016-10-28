//
//  UMGSMMAP_SS_SubscriptionOption.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_CliRestrictionOption.h"
#import "UMGSMMAP_OverrideCategory.h"

@interface UMGSMMAP_SS_SubscriptionOption : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_CliRestrictionOption *cliRestrictionOption;
	UMGSMMAP_OverrideCategory *overrideCategory;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_CliRestrictionOption *cliRestrictionOption;
@property(readwrite,strong)	UMGSMMAP_OverrideCategory *overrideCategory;


- (void)processBeforeEncode;
- (UMGSMMAP_SS_SubscriptionOption *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;

@end
