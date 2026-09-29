//
//  UMGSMMAP_Problem.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 02.01.2024.
//  Copyright © 2024 Andreas Fink (andreas@fink.org). All rights reserved.
//

#import <ulibtcap/ulibtcap.h>

typedef enum UMGSMMAP_Problem_enum
{
    UMGSMMAP_Problem_mistypedComponent = 1,
}UMGSMMAP_Problem_enum;

@interface UMGSMMAP_Problem : UMASN1Enumerated
{
}

@end

