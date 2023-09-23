//
//  UMGSMMAP_AuthenticationSetList.h
//  ulibgsmmap
//
//  © 2016  by Andreas Fink
//
//

#import <ulibasn1/ulibasn1.h>
#import <ulibgsmmap/UMGSMMAP_asn1_protocol.h>

#import <ulibgsmmap/UMGSMMAP_AuthenticationTripletList.h>
#import <ulibgsmmap/UMGSMMAP_AuthenticationQuintupletList.h>

@interface UMGSMMAP_AuthenticationSetList : UMASN1Sequence<UMGSMMAP_asn1_protocol>
{
	NSString *operationName;
	UMGSMMAP_AuthenticationTripletList *tripletList;
	UMGSMMAP_AuthenticationQuintupletList *quintupletList;
}
@property(readwrite,strong)    NSString *operationName;

@property(readwrite,strong)	UMGSMMAP_AuthenticationTripletList *tripletList;
@property(readwrite,strong)	UMGSMMAP_AuthenticationQuintupletList *quintupletList;


- (void)processBeforeEncode;
- (UMGSMMAP_AuthenticationSetList *)processAfterDecodeWithContext:(id)context;
- (NSString *)objectName;
- (id)objectValue;

@end
