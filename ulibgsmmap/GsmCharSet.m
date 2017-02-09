//
//  GsmCharSet.m
//
//  Copyright © 2017 Andreas Fink (andreas@fink.org). All rights reserved.
//
// This source is dual licensed either under the GNU GENERAL PUBLIC LICENSE
// Version 3 from 29 June 2007 and other commercial licenses available by
// the author.
//
#import <Foundation/Foundation.h>
#import "GsmCharSet.h"


const unichar gsmToUnicode[] =
{
    /* 0 - 15 */
    '@',
    0xA3,		/* pound */
    '$',
    0xA5,		/* YEN */
    0xE8,		/* e grave */
    0xE9,		/* e egue */
    0xF9,		/* u grave */
    0xEC,		/* i grave */
    0xF2,		/* o grave */
    0xC7,		/* C cedile */
    10,			/* linefeed */
    0xd8,		/* stroken O */
    0xF8,		/* stroken o */
    13,			/* carriage return */
    0xC5,		/* A with circle */
    0xE5,		/* a with circle */
    /* 16 - 31 */
    0x394,		/* GREEK CAPITAL LETTER DELTA */
    '_',		/* UNDERSCORE */
    0x3A6,		/* GREEK CAPITAL LETTER PHI */
    0x393,		/* GREEK CAPITAL LETTER GAMMA */
    0x39B,		/* GREEK CAPITAL LETTER LAMBDA */
    0x3A9,		/* GREEK CAPITAL LETTER OMEGA */
    0x3A0,		/* GREEK CAPITAL LETTER PI */
    0x3A8,		/* GREEK CAPITAL LETTER PSI */
    0x3A3,		/* GREEK CAPITAL LETTER SIGMA */
    0x398,		/* GREEK CAPITAL LETTER THETA */
    0x39E,		/* GREEK CAPITAL LETTER XI */
    0x27,		/* ESCAPE */
    0xC6,		/* AE ligature */
    0xE6,		/* ae ligature */
    0xDF,		/* sharp S */
    0xC9,		/* E EGUE */
    /* 32 - 47 */
    ' ',   '!',   '"',   '#',  0xA4,   '%',   '&',  '\'',
    '(',   ')',   '*',   '+',   ',',   '-',   '.',   '/',
    '0',   '1',   '2',   '3',   '4',   '5',   '6',   '7',
    '8',   '9',   ':',   ';',   '<',   '=',   '>',   '?',
    0xA1,  'A',   'B',   'C',   'D',   'E',   'F',   'G',
    'H',   'I',   'J',   'K',   'L',   'M',   'N',   'O',
    'P',   'Q',   'R',   'S',   'T',   'U',   'V',   'W',
    'X',   'Y',   'Z',  0xC4,  0xD6,  0xD1,  0xDC,  0xA7,  /* XYZÄÖÑÜ§ */
    0xBF,   'a',   'b',   'c',   'd',   'e',   'f',   'g',
    'h',   'i',   'j',   'k',   'l',   'm',   'n',   'o',
    'p',   'q',   'r',   's',   't',   'u',   'v',   'w',
    'x',   'y',   'z',  0xE4,  0xF6,  0xF1,  0xFC,  0xE0    /* äöñüà */
};

int gsmToUnicode_table_size = sizeof(gsmToUnicode);
