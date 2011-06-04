#define	__MIG_check__Reply__MobileXRPC_subsystem__ 1
#define	__NDR_convert__Reply__MobileXRPC_subsystem__ 1
#define	__NDR_convert__mig_reply_error_subsystem__ 1

#include "MXRemote.h"


#ifndef	mig_internal
#define	mig_internal	static __inline__
#endif	/* mig_internal */

#ifndef	mig_external
#define mig_external
#endif	/* mig_external */

#if	!defined(__MigTypeCheck) && defined(TypeCheck)
#define	__MigTypeCheck		TypeCheck	/* Legacy setting */
#endif	/* !defined(__MigTypeCheck) */

#if	!defined(__MigKernelSpecificCode) && defined(_MIG_KERNEL_SPECIFIC_CODE_)
#define	__MigKernelSpecificCode	_MIG_KERNEL_SPECIFIC_CODE_	/* Legacy setting */
#endif	/* !defined(__MigKernelSpecificCode) */

#ifndef	LimitCheck
#define	LimitCheck 0
#endif	/* LimitCheck */

#ifndef	min
#define	min(a,b)  ( ((a) < (b))? (a): (b) )
#endif	/* min */

#if !defined(_WALIGN_)
#define _WALIGN_(x) (((x) + 3) & ~3)
#endif /* !defined(_WALIGN_) */

#if !defined(_WALIGNSZ_)
#define _WALIGNSZ_(x) _WALIGN_(sizeof(x))
#endif /* !defined(_WALIGNSZ_) */

#ifndef	UseStaticTemplates
#define	UseStaticTemplates	0
#endif	/* UseStaticTemplates */

#ifndef	__MachMsgErrorWithTimeout
#define	__MachMsgErrorWithTimeout(_R_) { \
switch (_R_) { \
case MACH_SEND_INVALID_DATA: \
case MACH_SEND_INVALID_DEST: \
case MACH_SEND_INVALID_HEADER: \
mig_put_reply_port(InP->Head.msgh_reply_port); \
break; \
case MACH_SEND_TIMED_OUT: \
case MACH_RCV_TIMED_OUT: \
default: \
mig_dealloc_reply_port(InP->Head.msgh_reply_port); \
} \
}
#endif	/* __MachMsgErrorWithTimeout */

#ifndef	__MachMsgErrorWithoutTimeout
#define	__MachMsgErrorWithoutTimeout(_R_) { \
switch (_R_) { \
case MACH_SEND_INVALID_DATA: \
case MACH_SEND_INVALID_DEST: \
case MACH_SEND_INVALID_HEADER: \
mig_put_reply_port(InP->Head.msgh_reply_port); \
break; \
default: \
mig_dealloc_reply_port(InP->Head.msgh_reply_port); \
} \
}
#endif	/* __MachMsgErrorWithoutTimeout */

#ifndef	__DeclareSendRpc
#define	__DeclareSendRpc(_NUM_, _NAME_)
#endif	/* __DeclareSendRpc */

#ifndef	__BeforeSendRpc
#define	__BeforeSendRpc(_NUM_, _NAME_)
#endif	/* __BeforeSendRpc */

#ifndef	__AfterSendRpc
#define	__AfterSendRpc(_NUM_, _NAME_)
#endif	/* __AfterSendRpc */

#ifndef	__DeclareSendSimple
#define	__DeclareSendSimple(_NUM_, _NAME_)
#endif	/* __DeclareSendSimple */

#ifndef	__BeforeSendSimple
#define	__BeforeSendSimple(_NUM_, _NAME_)
#endif	/* __BeforeSendSimple */

#ifndef	__AfterSendSimple
#define	__AfterSendSimple(_NUM_, _NAME_)
#endif	/* __AfterSendSimple */

#define msgh_request_port	msgh_remote_port
#define msgh_reply_port		msgh_local_port



#if ( __MigTypeCheck || __NDR_convert__ )
#if __MIG_check__Reply__MobileXRPC_subsystem__
#if !defined(__MIG_check__Reply__CopyApplicationList_t__defined)
#define __MIG_check__Reply__CopyApplicationList_t__defined
#ifndef __NDR_convert__int_rep__Reply__CopyApplicationList_t__list__defined
#if	defined(__NDR_convert__int_rep__MobileXRPC__serialized_t__defined)
#define	__NDR_convert__int_rep__Reply__CopyApplicationList_t__list__defined
#define	__NDR_convert__int_rep__Reply__CopyApplicationList_t__list(a, f, c) \
__NDR_convert__int_rep__MobileXRPC__serialized_t((serialized_t *)(a), f, c)
#elif	defined(__NDR_convert__int_rep__serialized_t__defined)
#define	__NDR_convert__int_rep__Reply__CopyApplicationList_t__list__defined
#define	__NDR_convert__int_rep__Reply__CopyApplicationList_t__list(a, f, c) \
__NDR_convert__int_rep__serialized_t((serialized_t *)(a), f, c)
#endif /* defined(__NDR_convert__*__defined) */
#endif /* __NDR_convert__int_rep__Reply__CopyApplicationList_t__list__defined */


#ifndef __NDR_convert__int_rep__Reply__CopyApplicationList_t__listCnt__defined
#if	defined(__NDR_convert__int_rep__MobileXRPC__mach_msg_type_number_t__defined)
#define	__NDR_convert__int_rep__Reply__CopyApplicationList_t__listCnt__defined
#define	__NDR_convert__int_rep__Reply__CopyApplicationList_t__listCnt(a, f) \
__NDR_convert__int_rep__MobileXRPC__mach_msg_type_number_t((mach_msg_type_number_t *)(a), f)
#elif	defined(__NDR_convert__int_rep__mach_msg_type_number_t__defined)
#define	__NDR_convert__int_rep__Reply__CopyApplicationList_t__listCnt__defined
#define	__NDR_convert__int_rep__Reply__CopyApplicationList_t__listCnt(a, f) \
__NDR_convert__int_rep__mach_msg_type_number_t((mach_msg_type_number_t *)(a), f)
#endif /* defined(__NDR_convert__*__defined) */
#endif /* __NDR_convert__int_rep__Reply__CopyApplicationList_t__listCnt__defined */


#ifndef __NDR_convert__char_rep__Reply__CopyApplicationList_t__list__defined
#if	defined(__NDR_convert__char_rep__MobileXRPC__serialized_t__defined)
#define	__NDR_convert__char_rep__Reply__CopyApplicationList_t__list__defined
#define	__NDR_convert__char_rep__Reply__CopyApplicationList_t__list(a, f, c) \
__NDR_convert__char_rep__MobileXRPC__serialized_t((serialized_t *)(a), f, c)
#elif	defined(__NDR_convert__char_rep__serialized_t__defined)
#define	__NDR_convert__char_rep__Reply__CopyApplicationList_t__list__defined
#define	__NDR_convert__char_rep__Reply__CopyApplicationList_t__list(a, f, c) \
__NDR_convert__char_rep__serialized_t((serialized_t *)(a), f, c)
#endif /* defined(__NDR_convert__*__defined) */
#endif /* __NDR_convert__char_rep__Reply__CopyApplicationList_t__list__defined */



#ifndef __NDR_convert__float_rep__Reply__CopyApplicationList_t__list__defined
#if	defined(__NDR_convert__float_rep__MobileXRPC__serialized_t__defined)
#define	__NDR_convert__float_rep__Reply__CopyApplicationList_t__list__defined
#define	__NDR_convert__float_rep__Reply__CopyApplicationList_t__list(a, f, c) \
__NDR_convert__float_rep__MobileXRPC__serialized_t((serialized_t *)(a), f, c)
#elif	defined(__NDR_convert__float_rep__serialized_t__defined)
#define	__NDR_convert__float_rep__Reply__CopyApplicationList_t__list__defined
#define	__NDR_convert__float_rep__Reply__CopyApplicationList_t__list(a, f, c) \
__NDR_convert__float_rep__serialized_t((serialized_t *)(a), f, c)
#endif /* defined(__NDR_convert__*__defined) */
#endif /* __NDR_convert__float_rep__Reply__CopyApplicationList_t__list__defined */




mig_internal kern_return_t __MIG_check__Reply__CopyApplicationList_t(__Reply__CopyApplicationList_t *Out0P)
{
    
	typedef __Reply__CopyApplicationList_t __Reply;
	boolean_t msgh_simple;
#if	__MigTypeCheck
	unsigned int msgh_size;
#endif	/* __MigTypeCheck */
	if (Out0P->Head.msgh_id != 800100) {
	    if (Out0P->Head.msgh_id == MACH_NOTIFY_SEND_ONCE)
		{ return MIG_SERVER_DIED; }
	    else
		{ return MIG_REPLY_MISMATCH; }
	}
    
	msgh_simple = !(Out0P->Head.msgh_bits & MACH_MSGH_BITS_COMPLEX);
#if	__MigTypeCheck
	msgh_size = Out0P->Head.msgh_size;
    
	if ((msgh_simple || Out0P->msgh_body.msgh_descriptor_count != 1 ||
         msgh_size != (mach_msg_size_t)sizeof(__Reply)) &&
	    (!msgh_simple || msgh_size != (mach_msg_size_t)sizeof(mig_reply_error_t) ||
         ((mig_reply_error_t *)Out0P)->RetCode == KERN_SUCCESS))
    { return MIG_TYPE_ERROR ; }
#endif	/* __MigTypeCheck */
    
	if (msgh_simple) {
#ifdef	__NDR_convert__mig_reply_error_t__defined
		__NDR_convert__mig_reply_error_t((mig_reply_error_t *)Out0P);
#endif	/* __NDR_convert__mig_reply_error_t__defined */
		return ((mig_reply_error_t *)Out0P)->RetCode;
	}
    
#if	__MigTypeCheck
	if (Out0P->list.type != MACH_MSG_OOL_DESCRIPTOR) {
		return MIG_TYPE_ERROR;
	}
#endif	/* __MigTypeCheck */
    
#if	defined(__NDR_convert__int_rep__Reply__CopyApplicationList_t__list__defined) || \
defined(__NDR_convert__int_rep__Reply__CopyApplicationList_t__listCnt__defined)
	if (Out0P->NDR.int_rep != NDR_record.int_rep) {
#if defined(__NDR_convert__int_rep__Reply__CopyApplicationList_t__listCnt__defined)
		__NDR_convert__int_rep__Reply__CopyApplicationList_t__listCnt(&Out0P->listCnt, Out0P->NDR.int_rep);
#endif	/* __NDR_convert__int_rep__Reply__CopyApplicationList_t__listCnt__defined */
#if defined(__NDR_convert__int_rep__Reply__CopyApplicationList_t__list__defined)
		__NDR_convert__int_rep__Reply__CopyApplicationList_t__list((serialized_t)(Out0P->list.address), Out0P->NDR.int_rep, Out0P->listCnt);
#endif /* __NDR_convert__int_rep__Reply__CopyApplicationList_t__list__defined */
	}
#endif	/* defined(__NDR_convert__int_rep...) */
    
#if	defined(__NDR_convert__char_rep__Reply__CopyApplicationList_t__list__defined) || \
0
	if (Out0P->NDR.char_rep != NDR_record.char_rep) {
#if defined(__NDR_convert__char_rep__Reply__CopyApplicationList_t__list__defined)
		__NDR_convert__char_rep__Reply__CopyApplicationList_t__list((serialized_t)(Out0P->list.address), Out0P->NDR.char_rep, Out0P->listCnt);
#endif /* __NDR_convert__char_rep__Reply__CopyApplicationList_t__list__defined */
	}
#endif	/* defined(__NDR_convert__char_rep...) */
    
#if	defined(__NDR_convert__float_rep__Reply__CopyApplicationList_t__list__defined) || \
0
	if (Out0P->NDR.float_rep != NDR_record.float_rep) {
#if defined(__NDR_convert__float_rep__Reply__CopyApplicationList_t__list__defined)
		__NDR_convert__float_rep__Reply__CopyApplicationList_t__list((serialized_t)(Out0P->list.address), Out0P->NDR.float_rep, Out0P->listCnt);
#endif /* __NDR_convert__float_rep__Reply__CopyApplicationList_t__list__defined */
	}
#endif	/* defined(__NDR_convert__float_rep...) */
    
	return MACH_MSG_SUCCESS;
}
#endif /* !defined(__MIG_check__Reply__CopyApplicationList_t__defined) */
#endif /* __MIG_check__Reply__MobileXRPC_subsystem__ */
#endif /* ( __MigTypeCheck || __NDR_convert__ ) */


/* Routine CopyApplicationList */
mig_external kern_return_t MXRCopyApplicationList
(
 mach_port_t server,
 serialized_t *list,
 mach_msg_type_number_t *listCnt
 )
{
    
#ifdef  __MigPackStructs
#pragma pack(4)
#endif
	typedef struct {
		mach_msg_header_t Head;
	} Request;
#ifdef  __MigPackStructs
#pragma pack()
#endif
    
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
		mach_msg_trailer_t trailer;
	} Reply;
#ifdef  __MigPackStructs
#pragma pack()
#endif
    
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
	} __Reply;
#ifdef  __MigPackStructs
#pragma pack()
#endif
	/*
	 * typedef struct {
	 * 	mach_msg_header_t Head;
	 * 	NDR_record_t NDR;
	 * 	kern_return_t RetCode;
	 * } mig_reply_error_t;
	 */
    
	union {
		Request In;
		Reply Out;
	} Mess;
    
	Request *InP = &Mess.In;
	Reply *Out0P = &Mess.Out;
    
	mach_msg_return_t msg_result;
    
#ifdef	__MIG_check__Reply__CopyApplicationList_t__defined
	kern_return_t check_result;
#endif	/* __MIG_check__Reply__CopyApplicationList_t__defined */
    
	__DeclareSendRpc(800000, "CopyApplicationList")
    
	InP->Head.msgh_bits =
    MACH_MSGH_BITS(19, MACH_MSG_TYPE_MAKE_SEND_ONCE);
	/* msgh_size passed as argument */
	InP->Head.msgh_request_port = server;
	InP->Head.msgh_reply_port = mig_get_reply_port();
	InP->Head.msgh_id = 800000;
    
	__BeforeSendRpc(800000, "CopyApplicationList")
	msg_result = mach_msg(&InP->Head, MACH_SEND_MSG|MACH_RCV_MSG|MACH_MSG_OPTION_NONE, (mach_msg_size_t)sizeof(Request), (mach_msg_size_t)sizeof(Reply), InP->Head.msgh_reply_port, MACH_MSG_TIMEOUT_NONE, MACH_PORT_NULL);
	__AfterSendRpc(800000, "CopyApplicationList")
	if (msg_result != MACH_MSG_SUCCESS) {
		__MachMsgErrorWithoutTimeout(msg_result);
		{ return msg_result; }
	}
    
    
#if	defined(__MIG_check__Reply__CopyApplicationList_t__defined)
	check_result = __MIG_check__Reply__CopyApplicationList_t((__Reply__CopyApplicationList_t *)Out0P);
	if (check_result != MACH_MSG_SUCCESS)
    { return check_result; }
#endif	/* defined(__MIG_check__Reply__CopyApplicationList_t__defined) */
    
	*list = (serialized_t)(Out0P->list.address);
	*listCnt = Out0P->listCnt;
    
	return KERN_SUCCESS;
}

#if ( __MigTypeCheck || __NDR_convert__ )
#if __MIG_check__Reply__MobileXRPC_subsystem__
#if !defined(__MIG_check__Reply__LaunchApplication_t__defined)
#define __MIG_check__Reply__LaunchApplication_t__defined
#ifndef __NDR_convert__int_rep__Reply__LaunchApplication_t__RetCode__defined
#if	defined(__NDR_convert__int_rep__MobileXRPC__kern_return_t__defined)
#define	__NDR_convert__int_rep__Reply__LaunchApplication_t__RetCode__defined
#define	__NDR_convert__int_rep__Reply__LaunchApplication_t__RetCode(a, f) \
__NDR_convert__int_rep__MobileXRPC__kern_return_t((kern_return_t *)(a), f)
#elif	defined(__NDR_convert__int_rep__kern_return_t__defined)
#define	__NDR_convert__int_rep__Reply__LaunchApplication_t__RetCode__defined
#define	__NDR_convert__int_rep__Reply__LaunchApplication_t__RetCode(a, f) \
__NDR_convert__int_rep__kern_return_t((kern_return_t *)(a), f)
#endif /* defined(__NDR_convert__*__defined) */
#endif /* __NDR_convert__int_rep__Reply__LaunchApplication_t__RetCode__defined */





mig_internal kern_return_t __MIG_check__Reply__LaunchApplication_t(__Reply__LaunchApplication_t *Out0P)
{
    
	typedef __Reply__LaunchApplication_t __Reply;
	if (Out0P->Head.msgh_id != 800101) {
	    if (Out0P->Head.msgh_id == MACH_NOTIFY_SEND_ONCE)
		{ return MIG_SERVER_DIED; }
	    else
		{ return MIG_REPLY_MISMATCH; }
	}
    
#if	__MigTypeCheck
	if ((Out0P->Head.msgh_bits & MACH_MSGH_BITS_COMPLEX) ||
	    (Out0P->Head.msgh_size != (mach_msg_size_t)sizeof(__Reply)))
    { return MIG_TYPE_ERROR ; }
#endif	/* __MigTypeCheck */
    
#if defined(__NDR_convert__int_rep__Reply__LaunchApplication_t__RetCode__defined)
	if (Out0P->NDR.int_rep != NDR_record.int_rep)
		__NDR_convert__int_rep__Reply__LaunchApplication_t__RetCode(&Out0P->RetCode, Out0P->NDR.int_rep);
#endif	/* __NDR_convert__int_rep__Reply__LaunchApplication_t__RetCode__defined */
	{
		return Out0P->RetCode;
	}
}
#endif /* !defined(__MIG_check__Reply__LaunchApplication_t__defined) */
#endif /* __MIG_check__Reply__MobileXRPC_subsystem__ */
#endif /* ( __MigTypeCheck || __NDR_convert__ ) */


/* Routine LaunchApplication */
mig_external kern_return_t MXRLaunchApplication
(
 mach_port_t server,
 string_t identifier
 )
{
    
#ifdef  __MigPackStructs
#pragma pack(4)
#endif
	typedef struct {
		mach_msg_header_t Head;
		NDR_record_t NDR;
		mach_msg_type_number_t identifierOffset; /* MiG doesn't use it */
		mach_msg_type_number_t identifierCnt;
		char identifier[1024];
	} Request;
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
		mach_msg_trailer_t trailer;
	} Reply;
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
	} __Reply;
#ifdef  __MigPackStructs
#pragma pack()
#endif
	/*
	 * typedef struct {
	 * 	mach_msg_header_t Head;
	 * 	NDR_record_t NDR;
	 * 	kern_return_t RetCode;
	 * } mig_reply_error_t;
	 */
    
	union {
		Request In;
		Reply Out;
	} Mess;
    
	Request *InP = &Mess.In;
	Reply *Out0P = &Mess.Out;
    
	mach_msg_return_t msg_result;
	unsigned int msgh_size;
    
#ifdef	__MIG_check__Reply__LaunchApplication_t__defined
	kern_return_t check_result;
#endif	/* __MIG_check__Reply__LaunchApplication_t__defined */
    
	__DeclareSendRpc(800001, "LaunchApplication")
    
	InP->NDR = NDR_record;
    
	InP->identifierCnt = mig_strncpy(InP->identifier, identifier, 1024);
    
	msgh_size = (mach_msg_size_t)(sizeof(Request) - 1024) + (_WALIGN_(InP->identifierCnt));
	InP->Head.msgh_bits =
    MACH_MSGH_BITS(19, MACH_MSG_TYPE_MAKE_SEND_ONCE);
	/* msgh_size passed as argument */
	InP->Head.msgh_request_port = server;
	InP->Head.msgh_reply_port = mig_get_reply_port();
	InP->Head.msgh_id = 800001;
    
	__BeforeSendRpc(800001, "LaunchApplication")
	msg_result = mach_msg(&InP->Head, MACH_SEND_MSG|MACH_RCV_MSG|MACH_MSG_OPTION_NONE, msgh_size, (mach_msg_size_t)sizeof(Reply), InP->Head.msgh_reply_port, MACH_MSG_TIMEOUT_NONE, MACH_PORT_NULL);
	__AfterSendRpc(800001, "LaunchApplication")
	if (msg_result != MACH_MSG_SUCCESS) {
		__MachMsgErrorWithoutTimeout(msg_result);
		{ return msg_result; }
	}
    
    
#if	defined(__MIG_check__Reply__LaunchApplication_t__defined)
	check_result = __MIG_check__Reply__LaunchApplication_t((__Reply__LaunchApplication_t *)Out0P);
	if (check_result != MACH_MSG_SUCCESS)
    { return check_result; }
#endif	/* defined(__MIG_check__Reply__LaunchApplication_t__defined) */
    
	return KERN_SUCCESS;
}

#if ( __MigTypeCheck || __NDR_convert__ )
#if __MIG_check__Reply__MobileXRPC_subsystem__
#if !defined(__MIG_check__Reply__CheckIn_t__defined)
#define __MIG_check__Reply__CheckIn_t__defined
#ifndef __NDR_convert__int_rep__Reply__CheckIn_t__RetCode__defined
#if	defined(__NDR_convert__int_rep__MobileXRPC__kern_return_t__defined)
#define	__NDR_convert__int_rep__Reply__CheckIn_t__RetCode__defined
#define	__NDR_convert__int_rep__Reply__CheckIn_t__RetCode(a, f) \
__NDR_convert__int_rep__MobileXRPC__kern_return_t((kern_return_t *)(a), f)
#elif	defined(__NDR_convert__int_rep__kern_return_t__defined)
#define	__NDR_convert__int_rep__Reply__CheckIn_t__RetCode__defined
#define	__NDR_convert__int_rep__Reply__CheckIn_t__RetCode(a, f) \
__NDR_convert__int_rep__kern_return_t((kern_return_t *)(a), f)
#endif /* defined(__NDR_convert__*__defined) */
#endif /* __NDR_convert__int_rep__Reply__CheckIn_t__RetCode__defined */





mig_internal kern_return_t __MIG_check__Reply__CheckIn_t(__Reply__CheckIn_t *Out0P)
{
    
	typedef __Reply__CheckIn_t __Reply;
	if (Out0P->Head.msgh_id != 800102) {
	    if (Out0P->Head.msgh_id == MACH_NOTIFY_SEND_ONCE)
		{ return MIG_SERVER_DIED; }
	    else
		{ return MIG_REPLY_MISMATCH; }
	}
    
#if	__MigTypeCheck
	if ((Out0P->Head.msgh_bits & MACH_MSGH_BITS_COMPLEX) ||
	    (Out0P->Head.msgh_size != (mach_msg_size_t)sizeof(__Reply)))
    { return MIG_TYPE_ERROR ; }
#endif	/* __MigTypeCheck */
    
#if defined(__NDR_convert__int_rep__Reply__CheckIn_t__RetCode__defined)
	if (Out0P->NDR.int_rep != NDR_record.int_rep)
		__NDR_convert__int_rep__Reply__CheckIn_t__RetCode(&Out0P->RetCode, Out0P->NDR.int_rep);
#endif	/* __NDR_convert__int_rep__Reply__CheckIn_t__RetCode__defined */
	{
		return Out0P->RetCode;
	}
}
#endif /* !defined(__MIG_check__Reply__CheckIn_t__defined) */
#endif /* __MIG_check__Reply__MobileXRPC_subsystem__ */
#endif /* ( __MigTypeCheck || __NDR_convert__ ) */


/* Routine CheckIn */
mig_external kern_return_t MXRCheckIn
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
 )
{
    
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
	} Request;
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
		mach_msg_trailer_t trailer;
	} Reply;
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
	} __Reply;
#ifdef  __MigPackStructs
#pragma pack()
#endif
	/*
	 * typedef struct {
	 * 	mach_msg_header_t Head;
	 * 	NDR_record_t NDR;
	 * 	kern_return_t RetCode;
	 * } mig_reply_error_t;
	 */
    
	union {
		Request In;
		Reply Out;
	} Mess;
    
	Request *InP = &Mess.In;
	Reply *Out0P = &Mess.Out;
    
	mach_msg_return_t msg_result;
    
#ifdef	__MIG_check__Reply__CheckIn_t__defined
	kern_return_t check_result;
#endif	/* __MIG_check__Reply__CheckIn_t__defined */
    
	__DeclareSendRpc(800002, "CheckIn")
    
	InP->NDR = NDR_record;
    
	InP->isFullscreen = isFullscreen;
    
	InP->windowLevel = windowLevel;
    
	InP->shouldOffsetizeContext = shouldOffsetizeContext;
    
	InP->keepAlive = keepAlive;
    
	InP->contextSizeWidth = contextSizeWidth;
    
	InP->contextSizeHeight = contextSizeHeight;
    
	InP->contextOriginX = contextOriginX;
    
	InP->contextOriginY = contextOriginY;
    
	InP->Head.msgh_bits =
    MACH_MSGH_BITS(19, MACH_MSG_TYPE_MAKE_SEND_ONCE);
	/* msgh_size passed as argument */
	InP->Head.msgh_request_port = server;
	InP->Head.msgh_reply_port = mig_get_reply_port();
	InP->Head.msgh_id = 800002;
    
	__BeforeSendRpc(800002, "CheckIn")
	msg_result = mach_msg(&InP->Head, MACH_SEND_MSG|MACH_RCV_MSG|MACH_MSG_OPTION_NONE, (mach_msg_size_t)sizeof(Request), (mach_msg_size_t)sizeof(Reply), InP->Head.msgh_reply_port, MACH_MSG_TIMEOUT_NONE, MACH_PORT_NULL);
	__AfterSendRpc(800002, "CheckIn")
	if (msg_result != MACH_MSG_SUCCESS) {
		__MachMsgErrorWithoutTimeout(msg_result);
		{ return msg_result; }
	}
    
    
#if	defined(__MIG_check__Reply__CheckIn_t__defined)
	check_result = __MIG_check__Reply__CheckIn_t((__Reply__CheckIn_t *)Out0P);
	if (check_result != MACH_MSG_SUCCESS)
    { return check_result; }
#endif	/* defined(__MIG_check__Reply__CheckIn_t__defined) */
    
	return KERN_SUCCESS;
}

#if ( __MigTypeCheck || __NDR_convert__ )
#if __MIG_check__Reply__MobileXRPC_subsystem__
#if !defined(__MIG_check__Reply__CopyScreenDimensions_t__defined)
#define __MIG_check__Reply__CopyScreenDimensions_t__defined
#ifndef __NDR_convert__int_rep__Reply__CopyScreenDimensions_t__RetCode__defined
#if	defined(__NDR_convert__int_rep__MobileXRPC__kern_return_t__defined)
#define	__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__RetCode__defined
#define	__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__RetCode(a, f) \
__NDR_convert__int_rep__MobileXRPC__kern_return_t((kern_return_t *)(a), f)
#elif	defined(__NDR_convert__int_rep__kern_return_t__defined)
#define	__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__RetCode__defined
#define	__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__RetCode(a, f) \
__NDR_convert__int_rep__kern_return_t((kern_return_t *)(a), f)
#endif /* defined(__NDR_convert__*__defined) */
#endif /* __NDR_convert__int_rep__Reply__CopyScreenDimensions_t__RetCode__defined */


#ifndef __NDR_convert__int_rep__Reply__CopyScreenDimensions_t__width__defined
#if	defined(__NDR_convert__int_rep__MobileXRPC__integer_t__defined)
#define	__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__width__defined
#define	__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__width(a, f) \
__NDR_convert__int_rep__MobileXRPC__integer_t((integer_t *)(a), f)
#elif	defined(__NDR_convert__int_rep__integer_t__defined)
#define	__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__width__defined
#define	__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__width(a, f) \
__NDR_convert__int_rep__integer_t((integer_t *)(a), f)
#elif	defined(__NDR_convert__int_rep__MobileXRPC__int32_t__defined)
#define	__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__width__defined
#define	__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__width(a, f) \
__NDR_convert__int_rep__MobileXRPC__int32_t((int32_t *)(a), f)
#elif	defined(__NDR_convert__int_rep__int32_t__defined)
#define	__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__width__defined
#define	__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__width(a, f) \
__NDR_convert__int_rep__int32_t((int32_t *)(a), f)
#endif /* defined(__NDR_convert__*__defined) */
#endif /* __NDR_convert__int_rep__Reply__CopyScreenDimensions_t__width__defined */


#ifndef __NDR_convert__int_rep__Reply__CopyScreenDimensions_t__height__defined
#if	defined(__NDR_convert__int_rep__MobileXRPC__integer_t__defined)
#define	__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__height__defined
#define	__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__height(a, f) \
__NDR_convert__int_rep__MobileXRPC__integer_t((integer_t *)(a), f)
#elif	defined(__NDR_convert__int_rep__integer_t__defined)
#define	__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__height__defined
#define	__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__height(a, f) \
__NDR_convert__int_rep__integer_t((integer_t *)(a), f)
#elif	defined(__NDR_convert__int_rep__MobileXRPC__int32_t__defined)
#define	__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__height__defined
#define	__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__height(a, f) \
__NDR_convert__int_rep__MobileXRPC__int32_t((int32_t *)(a), f)
#elif	defined(__NDR_convert__int_rep__int32_t__defined)
#define	__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__height__defined
#define	__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__height(a, f) \
__NDR_convert__int_rep__int32_t((int32_t *)(a), f)
#endif /* defined(__NDR_convert__*__defined) */
#endif /* __NDR_convert__int_rep__Reply__CopyScreenDimensions_t__height__defined */



#ifndef __NDR_convert__char_rep__Reply__CopyScreenDimensions_t__width__defined
#if	defined(__NDR_convert__char_rep__MobileXRPC__integer_t__defined)
#define	__NDR_convert__char_rep__Reply__CopyScreenDimensions_t__width__defined
#define	__NDR_convert__char_rep__Reply__CopyScreenDimensions_t__width(a, f) \
__NDR_convert__char_rep__MobileXRPC__integer_t((integer_t *)(a), f)
#elif	defined(__NDR_convert__char_rep__integer_t__defined)
#define	__NDR_convert__char_rep__Reply__CopyScreenDimensions_t__width__defined
#define	__NDR_convert__char_rep__Reply__CopyScreenDimensions_t__width(a, f) \
__NDR_convert__char_rep__integer_t((integer_t *)(a), f)
#elif	defined(__NDR_convert__char_rep__MobileXRPC__int32_t__defined)
#define	__NDR_convert__char_rep__Reply__CopyScreenDimensions_t__width__defined
#define	__NDR_convert__char_rep__Reply__CopyScreenDimensions_t__width(a, f) \
__NDR_convert__char_rep__MobileXRPC__int32_t((int32_t *)(a), f)
#elif	defined(__NDR_convert__char_rep__int32_t__defined)
#define	__NDR_convert__char_rep__Reply__CopyScreenDimensions_t__width__defined
#define	__NDR_convert__char_rep__Reply__CopyScreenDimensions_t__width(a, f) \
__NDR_convert__char_rep__int32_t((int32_t *)(a), f)
#endif /* defined(__NDR_convert__*__defined) */
#endif /* __NDR_convert__char_rep__Reply__CopyScreenDimensions_t__width__defined */


#ifndef __NDR_convert__char_rep__Reply__CopyScreenDimensions_t__height__defined
#if	defined(__NDR_convert__char_rep__MobileXRPC__integer_t__defined)
#define	__NDR_convert__char_rep__Reply__CopyScreenDimensions_t__height__defined
#define	__NDR_convert__char_rep__Reply__CopyScreenDimensions_t__height(a, f) \
__NDR_convert__char_rep__MobileXRPC__integer_t((integer_t *)(a), f)
#elif	defined(__NDR_convert__char_rep__integer_t__defined)
#define	__NDR_convert__char_rep__Reply__CopyScreenDimensions_t__height__defined
#define	__NDR_convert__char_rep__Reply__CopyScreenDimensions_t__height(a, f) \
__NDR_convert__char_rep__integer_t((integer_t *)(a), f)
#elif	defined(__NDR_convert__char_rep__MobileXRPC__int32_t__defined)
#define	__NDR_convert__char_rep__Reply__CopyScreenDimensions_t__height__defined
#define	__NDR_convert__char_rep__Reply__CopyScreenDimensions_t__height(a, f) \
__NDR_convert__char_rep__MobileXRPC__int32_t((int32_t *)(a), f)
#elif	defined(__NDR_convert__char_rep__int32_t__defined)
#define	__NDR_convert__char_rep__Reply__CopyScreenDimensions_t__height__defined
#define	__NDR_convert__char_rep__Reply__CopyScreenDimensions_t__height(a, f) \
__NDR_convert__char_rep__int32_t((int32_t *)(a), f)
#endif /* defined(__NDR_convert__*__defined) */
#endif /* __NDR_convert__char_rep__Reply__CopyScreenDimensions_t__height__defined */



#ifndef __NDR_convert__float_rep__Reply__CopyScreenDimensions_t__width__defined
#if	defined(__NDR_convert__float_rep__MobileXRPC__integer_t__defined)
#define	__NDR_convert__float_rep__Reply__CopyScreenDimensions_t__width__defined
#define	__NDR_convert__float_rep__Reply__CopyScreenDimensions_t__width(a, f) \
__NDR_convert__float_rep__MobileXRPC__integer_t((integer_t *)(a), f)
#elif	defined(__NDR_convert__float_rep__integer_t__defined)
#define	__NDR_convert__float_rep__Reply__CopyScreenDimensions_t__width__defined
#define	__NDR_convert__float_rep__Reply__CopyScreenDimensions_t__width(a, f) \
__NDR_convert__float_rep__integer_t((integer_t *)(a), f)
#elif	defined(__NDR_convert__float_rep__MobileXRPC__int32_t__defined)
#define	__NDR_convert__float_rep__Reply__CopyScreenDimensions_t__width__defined
#define	__NDR_convert__float_rep__Reply__CopyScreenDimensions_t__width(a, f) \
__NDR_convert__float_rep__MobileXRPC__int32_t((int32_t *)(a), f)
#elif	defined(__NDR_convert__float_rep__int32_t__defined)
#define	__NDR_convert__float_rep__Reply__CopyScreenDimensions_t__width__defined
#define	__NDR_convert__float_rep__Reply__CopyScreenDimensions_t__width(a, f) \
__NDR_convert__float_rep__int32_t((int32_t *)(a), f)
#endif /* defined(__NDR_convert__*__defined) */
#endif /* __NDR_convert__float_rep__Reply__CopyScreenDimensions_t__width__defined */


#ifndef __NDR_convert__float_rep__Reply__CopyScreenDimensions_t__height__defined
#if	defined(__NDR_convert__float_rep__MobileXRPC__integer_t__defined)
#define	__NDR_convert__float_rep__Reply__CopyScreenDimensions_t__height__defined
#define	__NDR_convert__float_rep__Reply__CopyScreenDimensions_t__height(a, f) \
__NDR_convert__float_rep__MobileXRPC__integer_t((integer_t *)(a), f)
#elif	defined(__NDR_convert__float_rep__integer_t__defined)
#define	__NDR_convert__float_rep__Reply__CopyScreenDimensions_t__height__defined
#define	__NDR_convert__float_rep__Reply__CopyScreenDimensions_t__height(a, f) \
__NDR_convert__float_rep__integer_t((integer_t *)(a), f)
#elif	defined(__NDR_convert__float_rep__MobileXRPC__int32_t__defined)
#define	__NDR_convert__float_rep__Reply__CopyScreenDimensions_t__height__defined
#define	__NDR_convert__float_rep__Reply__CopyScreenDimensions_t__height(a, f) \
__NDR_convert__float_rep__MobileXRPC__int32_t((int32_t *)(a), f)
#elif	defined(__NDR_convert__float_rep__int32_t__defined)
#define	__NDR_convert__float_rep__Reply__CopyScreenDimensions_t__height__defined
#define	__NDR_convert__float_rep__Reply__CopyScreenDimensions_t__height(a, f) \
__NDR_convert__float_rep__int32_t((int32_t *)(a), f)
#endif /* defined(__NDR_convert__*__defined) */
#endif /* __NDR_convert__float_rep__Reply__CopyScreenDimensions_t__height__defined */



mig_internal kern_return_t __MIG_check__Reply__CopyScreenDimensions_t(__Reply__CopyScreenDimensions_t *Out0P)
{
    
	typedef __Reply__CopyScreenDimensions_t __Reply;
#if	__MigTypeCheck
	unsigned int msgh_size;
#endif	/* __MigTypeCheck */
	if (Out0P->Head.msgh_id != 800103) {
	    if (Out0P->Head.msgh_id == MACH_NOTIFY_SEND_ONCE)
		{ return MIG_SERVER_DIED; }
	    else
		{ return MIG_REPLY_MISMATCH; }
	}
    
#if	__MigTypeCheck
	msgh_size = Out0P->Head.msgh_size;
    
	if ((Out0P->Head.msgh_bits & MACH_MSGH_BITS_COMPLEX) ||
	    ((msgh_size != (mach_msg_size_t)sizeof(__Reply)) &&
	     (msgh_size != (mach_msg_size_t)sizeof(mig_reply_error_t) ||
	      Out0P->RetCode == KERN_SUCCESS)))
    { return MIG_TYPE_ERROR ; }
#endif	/* __MigTypeCheck */
    
	if (Out0P->RetCode != KERN_SUCCESS) {
#ifdef	__NDR_convert__mig_reply_error_t__defined
		__NDR_convert__mig_reply_error_t((mig_reply_error_t *)Out0P);
#endif	/* __NDR_convert__mig_reply_error_t__defined */
		return ((mig_reply_error_t *)Out0P)->RetCode;
	}
    
#if	defined(__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__RetCode__defined) || \
defined(__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__width__defined) || \
defined(__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__height__defined)
	if (Out0P->NDR.int_rep != NDR_record.int_rep) {
#if defined(__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__RetCode__defined)
		__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__RetCode(&Out0P->RetCode, Out0P->NDR.int_rep);
#endif /* __NDR_convert__int_rep__Reply__CopyScreenDimensions_t__RetCode__defined */
#if defined(__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__width__defined)
		__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__width(&Out0P->width, Out0P->NDR.int_rep);
#endif /* __NDR_convert__int_rep__Reply__CopyScreenDimensions_t__width__defined */
#if defined(__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__height__defined)
		__NDR_convert__int_rep__Reply__CopyScreenDimensions_t__height(&Out0P->height, Out0P->NDR.int_rep);
#endif /* __NDR_convert__int_rep__Reply__CopyScreenDimensions_t__height__defined */
	}
#endif	/* defined(__NDR_convert__int_rep...) */
    
#if	0 || \
defined(__NDR_convert__char_rep__Reply__CopyScreenDimensions_t__width__defined) || \
defined(__NDR_convert__char_rep__Reply__CopyScreenDimensions_t__height__defined)
	if (Out0P->NDR.char_rep != NDR_record.char_rep) {
#if defined(__NDR_convert__char_rep__Reply__CopyScreenDimensions_t__width__defined)
		__NDR_convert__char_rep__Reply__CopyScreenDimensions_t__width(&Out0P->width, Out0P->NDR.char_rep);
#endif /* __NDR_convert__char_rep__Reply__CopyScreenDimensions_t__width__defined */
#if defined(__NDR_convert__char_rep__Reply__CopyScreenDimensions_t__height__defined)
		__NDR_convert__char_rep__Reply__CopyScreenDimensions_t__height(&Out0P->height, Out0P->NDR.char_rep);
#endif /* __NDR_convert__char_rep__Reply__CopyScreenDimensions_t__height__defined */
	}
#endif	/* defined(__NDR_convert__char_rep...) */
    
#if	0 || \
defined(__NDR_convert__float_rep__Reply__CopyScreenDimensions_t__width__defined) || \
defined(__NDR_convert__float_rep__Reply__CopyScreenDimensions_t__height__defined)
	if (Out0P->NDR.float_rep != NDR_record.float_rep) {
#if defined(__NDR_convert__float_rep__Reply__CopyScreenDimensions_t__width__defined)
		__NDR_convert__float_rep__Reply__CopyScreenDimensions_t__width(&Out0P->width, Out0P->NDR.float_rep);
#endif /* __NDR_convert__float_rep__Reply__CopyScreenDimensions_t__width__defined */
#if defined(__NDR_convert__float_rep__Reply__CopyScreenDimensions_t__height__defined)
		__NDR_convert__float_rep__Reply__CopyScreenDimensions_t__height(&Out0P->height, Out0P->NDR.float_rep);
#endif /* __NDR_convert__float_rep__Reply__CopyScreenDimensions_t__height__defined */
	}
#endif	/* defined(__NDR_convert__float_rep...) */
    
	return MACH_MSG_SUCCESS;
}
#endif /* !defined(__MIG_check__Reply__CopyScreenDimensions_t__defined) */
#endif /* __MIG_check__Reply__MobileXRPC_subsystem__ */
#endif /* ( __MigTypeCheck || __NDR_convert__ ) */


/* Routine CopyScreenDimensions */
mig_external kern_return_t MXRCopyScreenDimensions
(
 mach_port_t server,
 integer_t *width,
 integer_t *height
 )
{
    
#ifdef  __MigPackStructs
#pragma pack(4)
#endif
	typedef struct {
		mach_msg_header_t Head;
	} Request;
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
		mach_msg_trailer_t trailer;
	} Reply;
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
	} __Reply;
#ifdef  __MigPackStructs
#pragma pack()
#endif
	/*
	 * typedef struct {
	 * 	mach_msg_header_t Head;
	 * 	NDR_record_t NDR;
	 * 	kern_return_t RetCode;
	 * } mig_reply_error_t;
	 */
    
	union {
		Request In;
		Reply Out;
	} Mess;
    
	Request *InP = &Mess.In;
	Reply *Out0P = &Mess.Out;
    
	mach_msg_return_t msg_result;
    
#ifdef	__MIG_check__Reply__CopyScreenDimensions_t__defined
	kern_return_t check_result;
#endif	/* __MIG_check__Reply__CopyScreenDimensions_t__defined */
    
	__DeclareSendRpc(800003, "CopyScreenDimensions")
    
	InP->Head.msgh_bits =
    MACH_MSGH_BITS(19, MACH_MSG_TYPE_MAKE_SEND_ONCE);
	/* msgh_size passed as argument */
	InP->Head.msgh_request_port = server;
	InP->Head.msgh_reply_port = mig_get_reply_port();
	InP->Head.msgh_id = 800003;
    
	__BeforeSendRpc(800003, "CopyScreenDimensions")
	msg_result = mach_msg(&InP->Head, MACH_SEND_MSG|MACH_RCV_MSG|MACH_MSG_OPTION_NONE, (mach_msg_size_t)sizeof(Request), (mach_msg_size_t)sizeof(Reply), InP->Head.msgh_reply_port, MACH_MSG_TIMEOUT_NONE, MACH_PORT_NULL);
	__AfterSendRpc(800003, "CopyScreenDimensions")
	if (msg_result != MACH_MSG_SUCCESS) {
		__MachMsgErrorWithoutTimeout(msg_result);
		{ return msg_result; }
	}
    
    
#if	defined(__MIG_check__Reply__CopyScreenDimensions_t__defined)
	check_result = __MIG_check__Reply__CopyScreenDimensions_t((__Reply__CopyScreenDimensions_t *)Out0P);
	if (check_result != MACH_MSG_SUCCESS)
    { return check_result; }
#endif	/* defined(__MIG_check__Reply__CopyScreenDimensions_t__defined) */
    
	*width = Out0P->width;
    
	*height = Out0P->height;
    
	return KERN_SUCCESS;
}
