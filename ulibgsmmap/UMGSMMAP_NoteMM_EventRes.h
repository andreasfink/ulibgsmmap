//
//  UMGSMMAP_NoteMM_EventRes.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 05.05.19.
//  Copyright © 2019 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibasn1/ulibasn1.h>

#import <ulibgsmmap/UMGSMMAP_ExtensionContainer.h>

@interface UMGSMMAP_NoteMM_EventRes : UMASN1Sequence
{
    UMGSMMAP_ExtensionContainer *_extensionContainer;
}
@property(readwrite,strong,atomic)    UMGSMMAP_ExtensionContainer *extensionContainer;

@end


