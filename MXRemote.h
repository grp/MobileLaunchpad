__BEGIN_DECLS


/*
 * MobileX RPC
 * Common
 */


#ifndef _MISC_TYPES_MX_H_
#define _MISC_TYPES_MX_H_

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <mach/mach.h>
#include "BootstrapServices.h"

/* server port */
#define MIG_MXRPC "com.mx.mx.rpcserver"

typedef const char* string_t;
typedef char* serialized_t;

#ifndef	_MobileXRPC_user_
#define	_MobileXRPC_user_

/* Module MobileXRPC */

#include <string.h>
#include <mach/ndr.h>
#include <mach/boolean.h>
#include <mach/kern_return.h>
#include <mach/notify.h>
#include <mach/mach_types.h>
#include <mach/message.h>
#include <mach/mig_errors.h>
#include <mach/port.h>

#ifdef AUTOTEST
#ifndef FUNCTION_PTR_T
#define FUNCTION_PTR_T
typedef void (*function_ptr_t)(mach_port_t, char *, mach_msg_type_number_t);
typedef struct {
    char            *name;
    function_ptr_t  function;
} function_table_entry;
typedef function_table_entry   *function_table_t;
#endif /* FUNCTION_PTR_T */
#endif /* AUTOTEST */

#ifndef	MobileXRPC_MSG_COUNT
#define	MobileXRPC_MSG_COUNT	4
#endif	/* MobileXRPC_MSG_COUNT */

#include <mach/std_types.h>
#include <mach/mig.h>
#include <mach/mig.h>
#include <mach/mach_types.h>

#ifdef __BeforeMigUserHeader
__BeforeMigUserHeader
#endif /* __BeforeMigUserHeader */

#include <sys/cdefs.h>
__BEGIN_DECLS


/* Routine CopyApplicationList */
#ifdef	mig_external
mig_external
#else
extern
#endif	/* mig_external */
kern_return_t MXRCopyApplicationList
(
 mach_port_t server,
 serialized_t *list,
 mach_msg_type_number_t *listCnt
 );

/* Routine LaunchApplication */
#ifdef	mig_external
mig_external
#else
extern
#endif	/* mig_external */
kern_return_t MXRLaunchApplication
(
 mach_port_t server,
 string_t identifier
 );

/* Routine CheckIn */
#ifdef	mig_external
mig_external
#else
extern
#endif	/* mig_external */
kern_return_t MXRCheckIn
(
 mach_port_t server,
 boolean_t isFullscreen,
 integer_t windowLevel,
 boolean_t shouldOffsetizeContext,
 boolean_t keepAlive,
 float contextSizeWidth,
 float contextSizeHeight,
 float contextOriginX,
 float contextOriginY
 );

/* Routine CopyScreenDimensions */
#ifdef	mig_external
mig_external
#else
extern
#endif	/* mig_external */
kern_return_t MXRCopyScreenDimensions
(
 mach_port_t server,
 integer_t *width,
 integer_t *height
 );

__END_DECLS

/********************** Caution **************************/
/* The following data types should be used to calculate  */
/* maximum message sizes only. The actual message may be */
/* smaller, and the position of the arguments within the */
/* message layout may vary from what is presented here.  */
/* For example, if any of the arguments are variable-    */
/* sized, and less than the maximum is sent, the data    */
/* will be packed tight in the actual message to reduce  */
/* the presence of holes.                                */
/********************** Caution **************************/

/* typedefs for all requests */

#ifndef __Request__MobileXRPC_subsystem__defined
#define __Request__MobileXRPC_subsystem__defined

#ifdef  __MigPackStructs
#pragma pack(4)
#endif
typedef struct {
    mach_msg_header_t Head;
} __Request__CopyApplicationList_t;
#ifdef  __MigPackStructs
#pragma pack()
#endif

#ifdef  __MigPackStructs
#pragma pack(4)
#endif
typedef struct {
    mach_msg_header_t Head;
    NDR_record_t NDR;
    mach_msg_type_number_t identifierOffset; /* MiG doesn't use it */
    mach_msg_type_number_t identifierCnt;
    char identifier[1024];
} __Request__LaunchApplication_t;
#ifdef  __MigPackStructs
#pragma pack()
#endif

#ifdef  __MigPackStructs
#pragma pack(4)
#endif
typedef struct {
    mach_msg_header_t Head;
    NDR_record_t NDR;
    boolean_t isFullscreen;
    integer_t windowLevel;
    boolean_t shouldOffsetizeContext;
    boolean_t keepAlive;
    float contextSizeWidth;
    float contextSizeHeight;
    float contextOriginX;
    float contextOriginY;
} __Request__CheckIn_t;
#ifdef  __MigPackStructs
#pragma pack()
#endif

#ifdef  __MigPackStructs
#pragma pack(4)
#endif
typedef struct {
    mach_msg_header_t Head;
} __Request__CopyScreenDimensions_t;
#ifdef  __MigPackStructs
#pragma pack()
#endif
#endif /* !__Request__MobileXRPC_subsystem__defined */

/* union of all requests */

#ifndef __RequestUnion__MXRMobileXRPC_subsystem__defined
#define __RequestUnion__MXRMobileXRPC_subsystem__defined
union __RequestUnion__MXRMobileXRPC_subsystem {
	__Request__CopyApplicationList_t Request_MXRCopyApplicationList;
	__Request__LaunchApplication_t Request_MXRLaunchApplication;
	__Request__CheckIn_t Request_MXRCheckIn;
	__Request__CopyScreenDimensions_t Request_MXRCopyScreenDimensions;
};
#endif /* !__RequestUnion__MXRMobileXRPC_subsystem__defined */
/* typedefs for all replies */

#ifndef __Reply__MobileXRPC_subsystem__defined
#define __Reply__MobileXRPC_subsystem__defined

#ifdef  __MigPackStructs
#pragma pack(4)
#endif
typedef struct {
    mach_msg_header_t Head;
    /* start of the kernel processed data */
    mach_msg_body_t msgh_body;
    mach_msg_ool_descriptor_t list;
    /* end of the kernel processed data */
    NDR_record_t NDR;
    mach_msg_type_number_t listCnt;
} __Reply__CopyApplicationList_t;
#ifdef  __MigPackStructs
#pragma pack()
#endif

#ifdef  __MigPackStructs
#pragma pack(4)
#endif
typedef struct {
    mach_msg_header_t Head;
    NDR_record_t NDR;
    kern_return_t RetCode;
} __Reply__LaunchApplication_t;
#ifdef  __MigPackStructs
#pragma pack()
#endif

#ifdef  __MigPackStructs
#pragma pack(4)
#endif
typedef struct {
    mach_msg_header_t Head;
    NDR_record_t NDR;
    kern_return_t RetCode;
} __Reply__CheckIn_t;
#ifdef  __MigPackStructs
#pragma pack()
#endif

#ifdef  __MigPackStructs
#pragma pack(4)
#endif
typedef struct {
    mach_msg_header_t Head;
    NDR_record_t NDR;
    kern_return_t RetCode;
    integer_t width;
    integer_t height;
} __Reply__CopyScreenDimensions_t;
#ifdef  __MigPackStructs
#pragma pack()
#endif
#endif /* !__Reply__MobileXRPC_subsystem__defined */

/* union of all replies */

#ifndef __ReplyUnion__MXRMobileXRPC_subsystem__defined
#define __ReplyUnion__MXRMobileXRPC_subsystem__defined
union __ReplyUnion__MXRMobileXRPC_subsystem {
	__Reply__CopyApplicationList_t Reply_MXRCopyApplicationList;
	__Reply__LaunchApplication_t Reply_MXRLaunchApplication;
	__Reply__CheckIn_t Reply_MXRCheckIn;
	__Reply__CopyScreenDimensions_t Reply_MXRCopyScreenDimensions;
};
#endif /* !__RequestUnion__MXRMobileXRPC_subsystem__defined */

#ifndef subsystem_to_name_map_MobileXRPC
#define subsystem_to_name_map_MobileXRPC \
{ "CopyApplicationList", 800000 },\
{ "LaunchApplication", 800001 },\
{ "CheckIn", 800002 },\
{ "CopyScreenDimensions", 800003 }
#endif

#ifdef __AfterMigUserHeader
__AfterMigUserHeader
#endif /* __AfterMigUserHeader */

#endif	 /* _MobileXRPC_user_ */


/* Routine CopyApplicationList */
#ifdef	mig_external
mig_external
#else
extern
#endif	/* mig_external */
kern_return_t MXRCopyApplicationList
(
 mach_port_t server,
 serialized_t *list,
 mach_msg_type_number_t *listCnt
 );

/* Routine LaunchApplication */
#ifdef	mig_external
mig_external
#else
extern
#endif	/* mig_external */
kern_return_t MXRLaunchApplication
(
 mach_port_t server,
 string_t identifier
 );

/* Routine CheckIn */
#ifdef	mig_external
mig_external
#else
extern
#endif	/* mig_external */
kern_return_t MXRCheckIn
(
 mach_port_t server,
 boolean_t isFullscreen,
 integer_t windowLevel,
 boolean_t shouldOffsetizeContext,
 boolean_t keepAlive,
 float contextSizeWidth,
 float contextSizeHeight,
 float contextOriginX,
 float contextOriginY
 );

/* Routine CopyScreenDimensions */
#ifdef	mig_external
mig_external
#else
extern
#endif	/* mig_external */
kern_return_t MXRCopyScreenDimensions
(
 mach_port_t server,
 integer_t *width,
 integer_t *height
 );

__END_DECLS


#endif // _MISC_TYPES_H_


