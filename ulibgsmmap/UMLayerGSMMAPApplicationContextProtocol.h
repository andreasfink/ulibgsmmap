//
//  UMLayerGSMMAPApplicationContextProtocol.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 25.01.17.
//
//

#import <ulibtcap/ulibtcap.h>

@class UMLayerTCAP;

@protocol UMLayerGSMMAPApplicationContextProtocol<NSObject>
- (UMLayerTCAP *)getTCAP:(NSString *)name;
- (UMSynchronizedDictionary *)dbPools;
@end
