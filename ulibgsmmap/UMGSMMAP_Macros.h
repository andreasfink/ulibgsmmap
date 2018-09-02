//
//  UMGSMMAP_Macros.h
//  ulibgsmmap
//
//  Created by Andreas Fink on 18.05.16.
//
//


#define GRAB_NEXT_OBJECT(o,p)    \
    o = [self getObjectAtPosition:p++];

#define IF_CONTEXT_SPECIFIC_TAG(o,tagno) \
    if((o) && (o.asn1_tag.tagNumber == tagno) && (o.asn1_tag.tagClass == UMASN1Class_ContextSpecific))

#define IF_UNIVERSAL_TAG(o,tagno) \
if((o) && (o.asn1_tag.tagNumber == tagno) && (o.asn1_tag.tagClass == UMASN1Class_Universal))


#define SET_OBJECT_OF_TYPE(var,type,o,context) if(o) { var = [[type alloc]initWithASN1Object:o context:context]; }

#define SET_OBJECT_OF_TYPE_AND_GRAB_NEXT(var,type,o,p,context) if(o) { var = [[type alloc]initWithASN1Object:o context:context]; o = [self getObjectAtPosition:p++];}


//#define DICT_ADD(dict,name,obj)             if(obj) { dict[name] = obj; }
#define DICT_ADD_BOOL(dict,name,obj)        if(obj) { dict[name] = @(YES); }
#define DICT_ADD_VALUE(dict,name,obj)  if(obj) { dict[name] = obj.objectValue; }

#define CHECK_MANDATORY_PARAMETER(var) \
if(var == NULL) \
{ \
    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"\
                                   reason:@"#var is mandatory"\
                                 userInfo:@{    @"backtrace":   UMBacktrace(NULL,0) }]);\
}


#define ADD_MANDATORY_PARAMETER(_asn1_list,var) \
if(var == NULL) \
{ \
    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"\
                                   reason:@"#var is mandatory"\
                                 userInfo:@{    @"backtrace":   UMBacktrace(NULL,0) }]);\
    [_asn1_list addObject:var]; \
}

#define ADD_OPTIONAL_PARAMETER(_asn1_list,var) \
if(var != NULL) \
{ \
    [_asn1_list addObject:var]; \
}



#define ADD_CONTEXT_SPECIFIC_OPTIONAL(list,no,o) \
if(o) \
{\
    o.asn1_tag.tagNumber = no;\
    o.asn1_tag.tagClass = UMASN1Class_ContextSpecific;\
    [list addObject:o];\
}



#define ADD_CONTEXT_SPECIFIC_MANDATORY(list,no,o) \
if(o) \
{\
    o.asn1_tag.tagNumber = no;\
    o.asn1_tag.tagClass = UMASN1Class_ContextSpecific;\
    [list addObject:o];\
} \
else \
{ \
    @throw([NSException exceptionWithName:@"PARAMETER_MISSING"\
                                   reason:@"#var is mandatory"\
                                 userInfo:@{    @"backtrace":   UMBacktrace(NULL,0) }]);\
}



#define SET_CONTEXT_SPECIFIC_NULL_TAG(list,no,o) \
if(o) \
{\
UMASN1Null *n = [[UMASN1Null alloc]init];\
n.asn1_tag.tagNumber = no;\
n.asn1_tag.tagClass = UMASN1Class_ContextSpecific;\
[list addObject:n];\
}

