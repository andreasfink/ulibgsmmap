//
//  UMGSMMAP_Reject.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 02.01.2024.
//  Copyright © 2024 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>

@interface UMGSMMAP_Reject : UMASN1Sequence
{
    UMASN1Integer   *_invokeRejID;
    UMASN1Object    *_problem;
}

@property(readwrite,strong,atomic)  UMASN1Integer   *invokeRejID;
@property(readwrite,strong,atomic)  UMASN1Object    *problem;

@end

