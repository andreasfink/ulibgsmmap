//
//  UMGSMMAP_LSAInformationWithdraw.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_LSAIdentityList.h"

@interface UMGSMMAP_LSAInformationWithdraw : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	BOOL allLSAData;
	UMGSMMAP_LSAIdentityList *lsaIdentityList;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,assign)	BOOL allLSAData;
@property(readwrite,strong)	UMGSMMAP_LSAIdentityList *lsaIdentityList;


- (void)processBeforeEncode;
- (UMGSMMAP_LSAInformationWithdraw *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;

@end
