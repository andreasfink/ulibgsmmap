//
//  UMGSMMAP_LocationArea.m
//  ulibgsmmap
//
//  Created by Andreas Fink on 07.12.16.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//

#import <ulibgsmmap/UMGSMMAP_LocationArea.h>
#import <ulibgsmmap/UMGSMMAP_LAIFixedLength.h>
#import <ulibgsmmap/UMGSMMAP_LAC.h>

@implementation UMGSMMAP_LocationArea


- (UMGSMMAP_LocationArea *)initWithString:(NSString *)str
{
    if(str.length == 10) /* 5 bytes */
    {
        UMGSMMAP_LAIFixedLength *laifl = [[UMGSMMAP_LAIFixedLength alloc]initWithString:str];
        laifl.asn1_tag.tagClass =UMASN1Class_ContextSpecific;
        laifl.asn1_tag.tagNumber = 0;
        return (UMGSMMAP_LocationArea *)laifl;
    }
    UMGSMMAP_LAC *lac = [[UMGSMMAP_LAC alloc]initWithString:str];
    lac.asn1_tag.tagClass =UMASN1Class_ContextSpecific;
    lac.asn1_tag.tagNumber = 1;
    return (UMGSMMAP_LocationArea *)lac;
}
@end
