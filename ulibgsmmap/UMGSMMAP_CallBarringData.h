//
//  UMGSMMAP_CallBarringData.h
//  ulibgsmmap
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <ulibasn1/ulibasn1.h>
#import "UMGSMMAP_asn1_protocol.h"

#import "UMGSMMAP_Ext_CallBarFeatureList.h"
#import "UMGSMMAP_Password.h"
#import "UMGSMMAP_WrongPasswordAttemptsCounter.h"
#import "UMGSMMAP_ExtensionContainer.h"

@interface UMGSMMAP_CallBarringData : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_Ext_CallBarFeatureList *callBarringFeatureList;
	UMGSMMAP_Password *password;
	UMGSMMAP_WrongPasswordAttemptsCounter *wrongPasswordAttemptsCounter;
	BOOL notificationToCSE;
	UMGSMMAP_ExtensionContainer *extensionContainer;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_Ext_CallBarFeatureList *callBarringFeatureList;
@property(readwrite,strong)	UMGSMMAP_Password *password;
@property(readwrite,strong)	UMGSMMAP_WrongPasswordAttemptsCounter *wrongPasswordAttemptsCounter;
@property(readwrite,assign)	BOOL notificationToCSE;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;


- (void)processBeforeEncode;
- (UMGSMMAP_CallBarringData *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_InternalOperation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end
