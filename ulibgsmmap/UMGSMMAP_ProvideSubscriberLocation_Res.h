//
//  UMGSMMAP_ProvideSubscriberLocation_Res.h
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

#import "UMGSMMAP_Ext_GeographicalInformation.h"
#import "UMGSMMAP_AgeOfLocationInformation.h"
#import "UMGSMMAP_ExtensionContainer.h"
#import "UMGSMMAP_Add_GeographicalInformation.h"
#import "UMGSMMAP_PositioningDataInformation.h"
#import "UMGSMMAP_UtranPositioningDataInfo.h"
#import "UMGSMMAP_CellGlobalIdOrServiceAreaIdOrLAI.h"
#import "UMGSMMAP_AccuracyFulfilmentIndicator.h"
#import "UMGSMMAP_VelocityEstimate.h"

@interface UMGSMMAP_ProvideSubscriberLocation_Res : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_Ext_GeographicalInformation *locationEstimate;
	UMGSMMAP_AgeOfLocationInformation *ageOfLocationEstimate;
	UMGSMMAP_ExtensionContainer *extensionContainer;
	UMGSMMAP_Add_GeographicalInformation *add_LocationEstimate;
	BOOL deferredmt_lrResponseIndicator;
	UMGSMMAP_PositioningDataInformation *geranPositioningData;
	UMGSMMAP_UtranPositioningDataInfo *utranPositioningData;
	UMGSMMAP_CellGlobalIdOrServiceAreaIdOrLAI *cellIdOrSai;
	BOOL sai_Present;
	UMGSMMAP_AccuracyFulfilmentIndicator *accuracyFulfilmentIndicator;
	UMGSMMAP_VelocityEstimate *velocityEstimate;
	BOOL mo_lrShortCircuitIndicator;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_Ext_GeographicalInformation *locationEstimate;
@property(readwrite,strong)	UMGSMMAP_AgeOfLocationInformation *ageOfLocationEstimate;
@property(readwrite,strong)	UMGSMMAP_ExtensionContainer *extensionContainer;
@property(readwrite,strong)	UMGSMMAP_Add_GeographicalInformation *add_LocationEstimate;
@property(readwrite,assign)	BOOL deferredmt_lrResponseIndicator;
@property(readwrite,strong)	UMGSMMAP_PositioningDataInformation *geranPositioningData;
@property(readwrite,strong)	UMGSMMAP_UtranPositioningDataInfo *utranPositioningData;
@property(readwrite,strong)	UMGSMMAP_CellGlobalIdOrServiceAreaIdOrLAI *cellIdOrSai;
@property(readwrite,assign)	BOOL sai_Present;
@property(readwrite,strong)	UMGSMMAP_AccuracyFulfilmentIndicator *accuracyFulfilmentIndicator;
@property(readwrite,strong)	UMGSMMAP_VelocityEstimate *velocityEstimate;
@property(readwrite,assign)	BOOL mo_lrShortCircuitIndicator;


- (void)processBeforeEncode;
- (UMGSMMAP_ProvideSubscriberLocation_Res *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;
- (UMASN1Object<UMGSMMAP_asn1_protocol> *)decodeASN1opcode:(int64_t)opcode
                                             operationType:(UMTCAP_Operation)operation
                                             operationName:(NSString **)xop
                                               withContext:(id)context;

@end
