;{- Code Header
; ==- Basic Info -================================
;     Name: Win32_GetConsoleProcessList.pbi
;  Version: 1.0.0
;   Author: Herwin Bozet (NibblePoker)
;
; ==- Compatibility -=============================
;  Compiler version:
;    * PureBasic 5.73 LTS (x86/x64)
;    * PureBasic 6.0 LTS (x64)
;    * PureBasic 6.0 LTS - C Backend (x64)
; 
; ==- Links & License -===========================
;  License: Unlicense
;  GitHub: https://github.com/aziascreations/PB-Win32-GetConsoleProcessList
;}

;- Compiler directives
;EnableExplicit

CompilerIf #PB_Compiler_OS <> #PB_OS_Windows 
	CompilerError "This include can only be used on Windows !"
CompilerEndIf


;- Wrappers
CompilerIf Not Defined(GetConsoleProcessList_, #PB_OSFunction) And Not Defined(GetConsoleProcessList_, #PB_Function)
	Procedure.l GetConsoleProcessList_(*lpdwProcessList, dwProcessCount.l)
		Protected LibraryId = OpenLibrary(#PB_Any, "kernel32.dll")
		Protected ReturnValue.l = 0
		
		If LibraryId <> 0
			Protected *FunctionAddress = GetFunction(LibraryId, "GetConsoleProcessList")
			
			If LibraryId <> #Null
				ReturnValue = CallFunctionFast(*FunctionAddress, *lpdwProcessList, dwProcessCount)
			Else
				DebuggerError("Unable to find the 'GetConsoleProcessList' function !")
			EndIf
			
			CloseLibrary(LibraryId)
		Else
			DebuggerError("Unable to load 'kernel32.dll' !")
		EndIf
		
		ProcedureReturn ReturnValue
	EndProcedure
CompilerEndIf


;- Imports

; These imports didn't work since the proper symbol couldn't be loaded on X86.

; CompilerIf #PB_Compiler_Processor = #PB_Processor_x86
; 	#WinApi_GetConsoleProcessList_LibPath$ = "C:\Program Files (x86)\Windows Kits\10\Lib\10.0.22621.0\um\x86\kernel32.Lib"
; CompilerElseIf #PB_Compiler_Processor = #PB_Processor_x64
; 	#WinApi_GetConsoleProcessList_LibPath$ = "C:\Program Files (x86)\Windows Kits\10\Lib\10.0.22621.0\um\x64\kernel32.Lib"
; CompilerElse
; 	CompilerIf Defined(PB_Processor_Arm64, #PB_Constant)
; 		CompilerIf #PB_Compiler_Processor = #PB_Processor_Arm64
; 			#WinApi_GetConsoleProcessList_LibPath$ = "C:\Program Files (x86)\Windows Kits\10\Lib\10.0.22621.0\um\arm64\kernel32.Lib"
; 		CompilerElse
; 			CompilerError "Please use the x64, x86 or ARM64 compilers for this include !"
; 		CompilerEndIf
; 	CompilerElse
; 		CompilerError "Please use the x64, x86 or ARM64 compilers for this include !"
; 	CompilerEndIf
; CompilerEndIf
; 
; Import #WinApi_GetConsoleProcessList_LibPath$
; 	GetConsoleProcessList_.l(*lpdwProcessList, dwProcessCount.l) As "GetConsoleProcessList"
; EndImport
