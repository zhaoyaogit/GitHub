﻿; Listing generated by Microsoft (R) Optimizing Compiler Version 16.00.40219.01 

	TITLE	C:\DUII\Simulation\GUI\Core\GUI_Valf.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	_GUI_DispFloatFix
EXTRN	__fltused:DWORD
EXTRN	__RTC_CheckEsp:PROC
EXTRN	__RTC_Shutdown:PROC
EXTRN	__RTC_InitBase:PROC
;	COMDAT rtc$TMZ
; File c:\duii\simulation\gui\core\gui_valf.c
rtc$TMZ	SEGMENT
__RTC_Shutdown.rtc$TMZ DD FLAT:__RTC_Shutdown
rtc$TMZ	ENDS
;	COMDAT rtc$IMZ
rtc$IMZ	SEGMENT
__RTC_InitBase.rtc$IMZ DD FLAT:__RTC_InitBase
; Function compile flags: /Odtp /RTCsu /ZI
rtc$IMZ	ENDS
;	COMDAT _GUI_DispFloatFix
_TEXT	SEGMENT
_f$ = 8							; size = 4
_Len$ = 12						; size = 1
_Decs$ = 16						; size = 1
_GUI_DispFloatFix PROC					; COMDAT
; Line 191
	push	ebp
	mov	ebp, esp
	sub	esp, 192				; 000000c0H
	push	ebx
	push	esi
	push	edi
	lea	edi, DWORD PTR [ebp-192]
	mov	ecx, 48					; 00000030H
	mov	eax, -858993460				; ccccccccH
	rep stosd
; Line 192
	push	0
	movzx	eax, BYTE PTR _Decs$[ebp]
	push	eax
	movzx	ecx, BYTE PTR _Len$[ebp]
	push	ecx
	push	ecx
	fld	DWORD PTR _f$[ebp]
	fstp	DWORD PTR [esp]
	call	__DispFloatFix
	add	esp, 16					; 00000010H
; Line 193
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 192				; 000000c0H
	cmp	ebp, esp
	call	__RTC_CheckEsp
	mov	esp, ebp
	pop	ebp
	ret	0
_GUI_DispFloatFix ENDP
_TEXT	ENDS
EXTRN	_GUI_DispDecShift:PROC
EXTRN	_GUI_DispSDecShift:PROC
EXTRN	_GUI_Pow10:BYTE
EXTRN	__ftol2_sse:PROC
; Function compile flags: /Odtp /RTCsu /ZI
;	COMDAT __DispFloatFix
_TEXT	SEGMENT
tv81 = -200						; size = 8
_f$ = 8							; size = 4
_Len$ = 12						; size = 1
_Decs$ = 16						; size = 1
_DrawPlusSign$ = 20					; size = 4
__DispFloatFix PROC					; COMDAT
; Line 78
	push	ebp
	mov	ebp, esp
	sub	esp, 200				; 000000c8H
	push	ebx
	push	esi
	push	edi
	lea	edi, DWORD PTR [ebp-200]
	mov	ecx, 50					; 00000032H
	mov	eax, -858993460				; ccccccccH
	rep stosd
; Line 79
	movzx	eax, BYTE PTR _Decs$[ebp]
	mov	ecx, DWORD PTR _GUI_Pow10[eax*4]
	mov	DWORD PTR tv81[ebp], ecx
	mov	DWORD PTR tv81[ebp+4], 0
	fild	QWORD PTR tv81[ebp]
	fmul	DWORD PTR _f$[ebp]
	fstp	DWORD PTR _f$[ebp]
; Line 80
	push	ecx
	fld	DWORD PTR _f$[ebp]
	fstp	DWORD PTR [esp]
	call	__RoundHalfUp
	add	esp, 4
	fstp	DWORD PTR _f$[ebp]
; Line 81
	cmp	DWORD PTR _DrawPlusSign$[ebp], 0
	je	SHORT $LN2@DispFloatF
; Line 85
	movzx	eax, BYTE PTR _Decs$[ebp]
	push	eax
	movzx	ecx, BYTE PTR _Len$[ebp]
	push	ecx
	fld	DWORD PTR _f$[ebp]
	call	__ftol2_sse
	push	eax
	call	_GUI_DispSDecShift
	add	esp, 12					; 0000000cH
; Line 86
	jmp	SHORT $LN1@DispFloatF
$LN2@DispFloatF:
; Line 90
	movzx	eax, BYTE PTR _Decs$[ebp]
	push	eax
	movzx	ecx, BYTE PTR _Len$[ebp]
	push	ecx
	fld	DWORD PTR _f$[ebp]
	call	__ftol2_sse
	push	eax
	call	_GUI_DispDecShift
	add	esp, 12					; 0000000cH
$LN1@DispFloatF:
; Line 92
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 200				; 000000c8H
	cmp	ebp, esp
	call	__RTC_CheckEsp
	mov	esp, ebp
	pop	ebp
	ret	0
__DispFloatFix ENDP
_TEXT	ENDS
PUBLIC	__real@3f000000
PUBLIC	__real@00000000
EXTRN	_floor:PROC
EXTRN	_ceil:PROC
;	COMDAT __real@3f000000
CONST	SEGMENT
__real@3f000000 DD 03f000000r			; 0.5
CONST	ENDS
;	COMDAT __real@00000000
CONST	SEGMENT
__real@00000000 DD 000000000r			; 0
; Function compile flags: /Odtp /RTCsu /ZI
CONST	ENDS
;	COMDAT __RoundHalfUp
_TEXT	SEGMENT
_f$ = 8							; size = 4
__RoundHalfUp PROC					; COMDAT
; Line 47
	push	ebp
	mov	ebp, esp
	sub	esp, 192				; 000000c0H
	push	ebx
	push	esi
	push	edi
	lea	edi, DWORD PTR [ebp-192]
	mov	ecx, 48					; 00000030H
	mov	eax, -858993460				; ccccccccH
	rep stosd
; Line 48
	fldz
	fcomp	DWORD PTR _f$[ebp]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $LN2@RoundHalfU
; Line 52
	fld	DWORD PTR _f$[ebp]
	fsub	DWORD PTR __real@3f000000
	fstp	DWORD PTR _f$[ebp]
; Line 53
	fld	DWORD PTR _f$[ebp]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_ceil
	add	esp, 8
	fstp	DWORD PTR _f$[ebp]
; Line 54
	jmp	SHORT $LN1@RoundHalfU
$LN2@RoundHalfU:
; Line 58
	fld	DWORD PTR _f$[ebp]
	fadd	DWORD PTR __real@3f000000
	fstp	DWORD PTR _f$[ebp]
; Line 59
	fld	DWORD PTR _f$[ebp]
	sub	esp, 8
	fstp	QWORD PTR [esp]
	call	_floor
	add	esp, 8
	fstp	DWORD PTR _f$[ebp]
$LN1@RoundHalfU:
; Line 61
	fld	DWORD PTR _f$[ebp]
; Line 62
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 192				; 000000c0H
	cmp	ebp, esp
	call	__RTC_CheckEsp
	mov	esp, ebp
	pop	ebp
	ret	0
__RoundHalfUp ENDP
_TEXT	ENDS
PUBLIC	_GUI_DispFloatMin
; Function compile flags: /Odtp /RTCsu /ZI
;	COMDAT _GUI_DispFloatMin
_TEXT	SEGMENT
_f$ = 8							; size = 4
_Fract$ = 12						; size = 1
_GUI_DispFloatMin PROC					; COMDAT
; Line 199
	push	ebp
	mov	ebp, esp
	sub	esp, 192				; 000000c0H
	push	ebx
	push	esi
	push	edi
	lea	edi, DWORD PTR [ebp-192]
	mov	ecx, 48					; 00000030H
	mov	eax, -858993460				; ccccccccH
	rep stosd
; Line 200
	push	0
	movzx	eax, BYTE PTR _Fract$[ebp]
	push	eax
	push	ecx
	fld	DWORD PTR _f$[ebp]
	fstp	DWORD PTR [esp]
	call	__DispFloatMin
	add	esp, 12					; 0000000cH
; Line 201
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 192				; 000000c0H
	cmp	ebp, esp
	call	__RTC_CheckEsp
	mov	esp, ebp
	pop	ebp
	ret	0
_GUI_DispFloatMin ENDP
_TEXT	ENDS
PUBLIC	__real@bf000000
PUBLIC	__real@bf800000
PUBLIC	__real@3f800000
EXTRN	_GUI_Long2Len:PROC
;	COMDAT __real@bf000000
CONST	SEGMENT
__real@bf000000 DD 0bf000000r			; -0.5
CONST	ENDS
;	COMDAT __real@bf800000
CONST	SEGMENT
__real@bf800000 DD 0bf800000r			; -1
CONST	ENDS
;	COMDAT __real@3f800000
CONST	SEGMENT
__real@3f800000 DD 03f800000r			; 1
; Function compile flags: /Odtp /RTCsu /ZI
CONST	ENDS
;	COMDAT __DispFloatMin
_TEXT	SEGMENT
tv201 = -236						; size = 8
_Decs$ = -32						; size = 4
_fRound$ = -20						; size = 4
_Len$ = -8						; size = 4
_f$ = 8							; size = 4
_Fract$ = 12						; size = 1
_DrawPlusSign$ = 16					; size = 4
__DispFloatMin PROC					; COMDAT
; Line 119
	push	ebp
	mov	ebp, esp
	sub	esp, 236				; 000000ecH
	push	ebx
	push	esi
	push	edi
	lea	edi, DWORD PTR [ebp-236]
	mov	ecx, 59					; 0000003bH
	mov	eax, -858993460				; ccccccccH
	rep stosd
; Line 124
	fld	DWORD PTR _f$[ebp]
	fstp	DWORD PTR _fRound$[ebp]
; Line 125
	fld	DWORD PTR _f$[ebp]
	fldz
	fucompp
	fnstsw	ax
	test	ah, 68					; 00000044H
	jp	SHORT $LN23@DispFloatM
; Line 126
	fld1
	fstp	DWORD PTR _fRound$[ebp]
	jmp	$LN3@DispFloatM
$LN23@DispFloatM:
; Line 127
	fldz
	fcomp	DWORD PTR _f$[ebp]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jp	$LN21@DispFloatM
	fld1
	fcomp	DWORD PTR _f$[ebp]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $LN21@DispFloatM
; Line 128
	push	ecx
	fld	DWORD PTR _f$[ebp]
	fstp	DWORD PTR [esp]
	call	__GetDecs
	add	esp, 4
	mov	DWORD PTR _Decs$[ebp], eax
; Line 129
	movzx	eax, BYTE PTR _Fract$[ebp]
	cmp	DWORD PTR _Decs$[ebp], eax
	jg	SHORT $LN20@DispFloatM
; Line 130
	fld	DWORD PTR _fRound$[ebp]
	fadd	DWORD PTR __real@3f800000
	fstp	DWORD PTR _fRound$[ebp]
; Line 131
	jmp	SHORT $LN13@DispFloatM
$LN20@DispFloatM:
; Line 132
	fld	DWORD PTR __real@3f000000
	fcomp	DWORD PTR _f$[ebp]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jp	SHORT $LN18@DispFloatM
; Line 133
	movzx	eax, BYTE PTR _Fract$[ebp]
	test	eax, eax
	je	SHORT $LN17@DispFloatM
; Line 134
	fld1
	fstp	DWORD PTR _fRound$[ebp]
; Line 135
	jmp	SHORT $LN16@DispFloatM
$LN17@DispFloatM:
; Line 136
	fldz
	fstp	DWORD PTR _fRound$[ebp]
; Line 137
	fld1
	fstp	DWORD PTR _f$[ebp]
$LN16@DispFloatM:
; Line 139
	jmp	SHORT $LN13@DispFloatM
$LN18@DispFloatM:
; Line 140
	movzx	eax, BYTE PTR _Fract$[ebp]
	test	eax, eax
	je	SHORT $LN14@DispFloatM
; Line 141
	fld1
	fstp	DWORD PTR _fRound$[ebp]
; Line 142
	fldz
	fstp	DWORD PTR _f$[ebp]
; Line 143
	jmp	SHORT $LN13@DispFloatM
$LN14@DispFloatM:
; Line 144
	fldz
	fstp	DWORD PTR _fRound$[ebp]
; Line 145
	fldz
	fstp	DWORD PTR _f$[ebp]
$LN13@DispFloatM:
; Line 148
	jmp	$LN3@DispFloatM
$LN21@DispFloatM:
; Line 149
	fldz
	fcomp	DWORD PTR _f$[ebp]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	$LN3@DispFloatM
	fld	DWORD PTR __real@bf800000
	fcomp	DWORD PTR _f$[ebp]
	fnstsw	ax
	test	ah, 5
	jp	SHORT $LN3@DispFloatM
; Line 150
	push	ecx
	fld	DWORD PTR _f$[ebp]
	fstp	DWORD PTR [esp]
	call	__GetDecs
	add	esp, 4
	mov	DWORD PTR _Decs$[ebp], eax
; Line 151
	movzx	eax, BYTE PTR _Fract$[ebp]
	cmp	DWORD PTR _Decs$[ebp], eax
	jg	SHORT $LN10@DispFloatM
; Line 152
	fld	DWORD PTR _fRound$[ebp]
	fsub	DWORD PTR __real@3f800000
	fstp	DWORD PTR _fRound$[ebp]
; Line 153
	jmp	SHORT $LN3@DispFloatM
$LN10@DispFloatM:
; Line 154
	fld	DWORD PTR __real@bf000000
	fcomp	DWORD PTR _f$[ebp]
	fnstsw	ax
	test	ah, 1
	jne	SHORT $LN8@DispFloatM
; Line 155
	movzx	eax, BYTE PTR _Fract$[ebp]
	test	eax, eax
	je	SHORT $LN7@DispFloatM
; Line 156
	fld1
	fstp	DWORD PTR _fRound$[ebp]
; Line 157
	jmp	SHORT $LN6@DispFloatM
$LN7@DispFloatM:
; Line 158
	fld	DWORD PTR __real@bf800000
	fstp	DWORD PTR _fRound$[ebp]
	fld	DWORD PTR _fRound$[ebp]
	fstp	DWORD PTR _f$[ebp]
$LN6@DispFloatM:
; Line 160
	jmp	SHORT $LN3@DispFloatM
$LN8@DispFloatM:
; Line 161
	movzx	eax, BYTE PTR _Fract$[ebp]
	test	eax, eax
	je	SHORT $LN4@DispFloatM
; Line 162
	fld1
	fstp	DWORD PTR _fRound$[ebp]
; Line 163
	jmp	SHORT $LN3@DispFloatM
$LN4@DispFloatM:
; Line 164
	fldz
	fstp	DWORD PTR _fRound$[ebp]
	fld	DWORD PTR _fRound$[ebp]
	fstp	DWORD PTR _f$[ebp]
$LN3@DispFloatM:
; Line 169
	movzx	eax, BYTE PTR _Fract$[ebp]
	mov	ecx, DWORD PTR _GUI_Pow10[eax*4]
	mov	DWORD PTR tv201[ebp], ecx
	mov	DWORD PTR tv201[ebp+4], 0
	fild	QWORD PTR tv201[ebp]
	fmul	DWORD PTR _fRound$[ebp]
	fstp	DWORD PTR _fRound$[ebp]
; Line 170
	push	ecx
	fld	DWORD PTR _fRound$[ebp]
	fstp	DWORD PTR [esp]
	call	__RoundHalfUp
	add	esp, 4
	fstp	DWORD PTR _fRound$[ebp]
; Line 171
	fld	DWORD PTR _fRound$[ebp]
	call	__ftol2_sse
	push	eax
	call	_GUI_Long2Len
	add	esp, 4
	movzx	ecx, BYTE PTR _Fract$[ebp]
	sub	eax, ecx
	mov	DWORD PTR _Len$[ebp], eax
; Line 172
	jns	SHORT $LN2@DispFloatM
; Line 173
	mov	DWORD PTR _Len$[ebp], 0
$LN2@DispFloatM:
; Line 175
	cmp	DWORD PTR _DrawPlusSign$[ebp], 1
	jne	SHORT $LN1@DispFloatM
	fldz
	fcomp	DWORD PTR _f$[ebp]
	fnstsw	ax
	test	ah, 5
	jp	SHORT $LN1@DispFloatM
; Line 176
	mov	eax, DWORD PTR _Len$[ebp]
	add	eax, 1
	mov	DWORD PTR _Len$[ebp], eax
$LN1@DispFloatM:
; Line 178
	mov	eax, DWORD PTR _DrawPlusSign$[ebp]
	push	eax
	movzx	ecx, BYTE PTR _Fract$[ebp]
	push	ecx
	movzx	edx, BYTE PTR _Fract$[ebp]
	add	edx, DWORD PTR _Len$[ebp]
	movzx	eax, BYTE PTR _Fract$[ebp]
	neg	eax
	sbb	eax, eax
	neg	eax
	add	edx, eax
	push	edx
	push	ecx
	fld	DWORD PTR _f$[ebp]
	fstp	DWORD PTR [esp]
	call	__DispFloatFix
	add	esp, 16					; 00000010H
; Line 179
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 236				; 000000ecH
	cmp	ebp, esp
	call	__RTC_CheckEsp
	mov	esp, ebp
	pop	ebp
	ret	0
__DispFloatMin ENDP
_TEXT	ENDS
PUBLIC	__real@41200000
PUBLIC	__real@3089705f
;	COMDAT __real@41200000
CONST	SEGMENT
__real@41200000 DD 041200000r			; 10
CONST	ENDS
;	COMDAT __real@3089705f
CONST	SEGMENT
__real@3089705f DD 03089705fr			; 1e-009
; Function compile flags: /Odtp /RTCsu /ZI
CONST	ENDS
;	COMDAT __GetDecs
_TEXT	SEGMENT
tv93 = -232						; size = 8
tv91 = -224						; size = 4
tv88 = -218						; size = 2
_Decs$ = -17						; size = 1
_fShift$ = -8						; size = 4
_f$ = 8							; size = 4
__GetDecs PROC						; COMDAT
; Line 98
	push	ebp
	mov	ebp, esp
	sub	esp, 232				; 000000e8H
	push	ebx
	push	esi
	push	edi
	lea	edi, DWORD PTR [ebp-232]
	mov	ecx, 58					; 0000003aH
	mov	eax, -858993460				; ccccccccH
	rep stosd
; Line 100
	mov	BYTE PTR _Decs$[ebp], 0
; Line 101
	fld	DWORD PTR _f$[ebp]
	fstp	DWORD PTR _fShift$[ebp]
; Line 102
	fldz
	fcomp	DWORD PTR _fShift$[ebp]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $LN5@GetDecs
; Line 103
	fld	DWORD PTR _fShift$[ebp]
	fchs
	fstp	DWORD PTR _fShift$[ebp]
$LN5@GetDecs:
; Line 105
	fld	DWORD PTR _fShift$[ebp]
	fadd	DWORD PTR __real@3089705f
	fstp	DWORD PTR _fShift$[ebp]
; Line 106
	fld	DWORD PTR _fShift$[ebp]
	fldz
	fucompp
	fnstsw	ax
	test	ah, 68					; 00000044H
	jnp	SHORT $LN1@GetDecs
$LN3@GetDecs:
; Line 108
	fld	DWORD PTR _fShift$[ebp]
	fmul	DWORD PTR __real@41200000
	fstp	DWORD PTR _fShift$[ebp]
; Line 109
	mov	al, BYTE PTR _Decs$[ebp]
	add	al, 1
	mov	BYTE PTR _Decs$[ebp], al
; Line 110
	fld	DWORD PTR _fShift$[ebp]
	fnstcw	WORD PTR tv88[ebp]
	movzx	eax, WORD PTR tv88[ebp]
	or	eax, 3072				; 00000c00H
	mov	DWORD PTR tv91[ebp], eax
	fldcw	WORD PTR tv91[ebp]
	fistp	QWORD PTR tv93[ebp]
	fldcw	WORD PTR tv88[ebp]
	cmp	DWORD PTR tv93[ebp], 0
	je	SHORT $LN3@GetDecs
$LN1@GetDecs:
; Line 112
	movzx	eax, BYTE PTR _Decs$[ebp]
; Line 113
	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	0
__GetDecs ENDP
_TEXT	ENDS
PUBLIC	_GUI_DispFloat
; Function compile flags: /Odtp /RTCsu /ZI
;	COMDAT _GUI_DispFloat
_TEXT	SEGMENT
_Decs$ = -8						; size = 4
_f$ = 8							; size = 4
_Len$ = 12						; size = 1
_GUI_DispFloat PROC					; COMDAT
; Line 207
	push	ebp
	mov	ebp, esp
	sub	esp, 204				; 000000ccH
	push	ebx
	push	esi
	push	edi
	lea	edi, DWORD PTR [ebp-204]
	mov	ecx, 51					; 00000033H
	mov	eax, -858993460				; ccccccccH
	rep stosd
; Line 209
	movzx	esi, BYTE PTR _Len$[ebp]
	fld	DWORD PTR _f$[ebp]
	call	__ftol2_sse
	push	eax
	call	_GUI_Long2Len
	add	esp, 4
	sub	esi, eax
	sub	esi, 1
	mov	DWORD PTR _Decs$[ebp], esi
; Line 210
	fldz
	fcomp	DWORD PTR _f$[ebp]
	fnstsw	ax
	test	ah, 65					; 00000041H
	jne	SHORT $LN2@GUI_DispFl
	fld	DWORD PTR __real@bf800000
	fcomp	DWORD PTR _f$[ebp]
	fnstsw	ax
	test	ah, 5
	jp	SHORT $LN2@GUI_DispFl
; Line 211
	mov	eax, DWORD PTR _Decs$[ebp]
	sub	eax, 1
	mov	DWORD PTR _Decs$[ebp], eax
$LN2@GUI_DispFl:
; Line 213
	cmp	DWORD PTR _Decs$[ebp], 0
	jge	SHORT $LN1@GUI_DispFl
; Line 214
	mov	DWORD PTR _Decs$[ebp], 0
$LN1@GUI_DispFl:
; Line 216
	push	0
	movzx	eax, BYTE PTR _Decs$[ebp]
	push	eax
	movzx	ecx, BYTE PTR _Len$[ebp]
	push	ecx
	push	ecx
	fld	DWORD PTR _f$[ebp]
	fstp	DWORD PTR [esp]
	call	__DispFloatFix
	add	esp, 16					; 00000010H
; Line 217
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 204				; 000000ccH
	cmp	ebp, esp
	call	__RTC_CheckEsp
	mov	esp, ebp
	pop	ebp
	ret	0
_GUI_DispFloat ENDP
_TEXT	ENDS
PUBLIC	_GUI_DispSFloatFix
; Function compile flags: /Odtp /RTCsu /ZI
;	COMDAT _GUI_DispSFloatFix
_TEXT	SEGMENT
_f$ = 8							; size = 4
_Len$ = 12						; size = 1
_Fract$ = 16						; size = 1
_GUI_DispSFloatFix PROC					; COMDAT
; Line 223
	push	ebp
	mov	ebp, esp
	sub	esp, 192				; 000000c0H
	push	ebx
	push	esi
	push	edi
	lea	edi, DWORD PTR [ebp-192]
	mov	ecx, 48					; 00000030H
	mov	eax, -858993460				; ccccccccH
	rep stosd
; Line 224
	push	1
	movzx	eax, BYTE PTR _Fract$[ebp]
	push	eax
	movzx	ecx, BYTE PTR _Len$[ebp]
	push	ecx
	push	ecx
	fld	DWORD PTR _f$[ebp]
	fstp	DWORD PTR [esp]
	call	__DispFloatFix
	add	esp, 16					; 00000010H
; Line 225
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 192				; 000000c0H
	cmp	ebp, esp
	call	__RTC_CheckEsp
	mov	esp, ebp
	pop	ebp
	ret	0
_GUI_DispSFloatFix ENDP
_TEXT	ENDS
PUBLIC	_GUI_DispSFloatMin
; Function compile flags: /Odtp /RTCsu /ZI
;	COMDAT _GUI_DispSFloatMin
_TEXT	SEGMENT
_f$ = 8							; size = 4
_Fract$ = 12						; size = 1
_GUI_DispSFloatMin PROC					; COMDAT
; Line 231
	push	ebp
	mov	ebp, esp
	sub	esp, 192				; 000000c0H
	push	ebx
	push	esi
	push	edi
	lea	edi, DWORD PTR [ebp-192]
	mov	ecx, 48					; 00000030H
	mov	eax, -858993460				; ccccccccH
	rep stosd
; Line 232
	push	1
	movzx	eax, BYTE PTR _Fract$[ebp]
	push	eax
	push	ecx
	fld	DWORD PTR _f$[ebp]
	fstp	DWORD PTR [esp]
	call	__DispFloatMin
	add	esp, 12					; 0000000cH
; Line 233
	pop	edi
	pop	esi
	pop	ebx
	add	esp, 192				; 000000c0H
	cmp	ebp, esp
	call	__RTC_CheckEsp
	mov	esp, ebp
	pop	ebp
	ret	0
_GUI_DispSFloatMin ENDP
_TEXT	ENDS
END