;{- Code Header
; ==- Basic Info -================================
;     Name: Win32_GetConsoleProcessList.pbi
;  Version: 2.0.0
;   Author: Herwin Bozet (NibblePoker)
;
; ==- Compatibility -=============================
;  Compiler version:
;    * PureBasic 5.73 LTS (x86/x64)
;    * PureBasic 6.21 (x64)
;    * PureBasic 6.21 - C Backend (x64)
; 
; ==- Links & License -===========================
;  License: CC0 1.0 Universal (Public Domain)
;  GitHub: https://github.com/aziascreations/PB-Win32-GetConsoleProcessList
;}


; ------------------------------------------------------------------------------
;- Compiler directives
;EnableExplicit

CompilerIf #PB_Compiler_OS <> #PB_OS_Windows 
    CompilerError "This include can only be used on Windows !"
CompilerEndIf



; ------------------------------------------------------------------------------
;- Wrappers
; Shouldn't be needed unless you want to import them at runtime.

; CompilerIf Not Defined(GetConsoleProcessList_, #PB_OSFunction) And Not Defined(GetConsoleProcessList_, #PB_Function)
; 	Procedure.l GetConsoleProcessList_(*lpdwProcessList, dwProcessCount.l)
; 		Protected LibraryId = OpenLibrary(#PB_Any, "kernel32.dll")
; 		Protected ReturnValue.l = 0
; 		
; 		If LibraryId <> 0
; 			Protected *FunctionAddress = GetFunction(LibraryId, "GetConsoleProcessList")
; 			
; 			If LibraryId <> #Null
; 				ReturnValue = CallFunctionFast(*FunctionAddress, *lpdwProcessList, dwProcessCount)
; 			Else
; 				DebuggerError("Unable to find the 'GetConsoleProcessList' function !")
; 			EndIf
; 			
; 			CloseLibrary(LibraryId)
; 		Else
; 			DebuggerError("Unable to load 'kernel32.dll' !")
; 		EndIf
; 		
; 		ProcedureReturn ReturnValue
; 	EndProcedure
; CompilerEndIf



; ------------------------------------------------------------------------------
;- Imports
; The conditions are a bit complicated in order to support PureBasic 5.x

Import "kernel32.lib"
    CompilerIf #PB_Compiler_Processor = #PB_Processor_x86
        GetConsoleProcessList_.l(*lpdwProcessList, dwProcessCount.l) As "_GetConsoleProcessList@8"
        
    CompilerElseIf #PB_Compiler_Processor = #PB_Processor_x64
        GetConsoleProcessList_.l(*lpdwProcessList, dwProcessCount.l) As "GetConsoleProcessList"
        
    CompilerElseIf Defined(PB_Processor_Arm64, #PB_Constant)
        CompilerIf #PB_Compiler_Processor = #PB_Processor_Arm64
            GetConsoleProcessList_.l(*lpdwProcessList, dwProcessCount.l) As "GetConsoleProcessList"
        CompilerElse
            CompilerError "Please use the x64, x86 or ARM64 compilers for this include !"
        CompilerEndIf
        
    CompilerElse
        CompilerError "Please use the x64, x86 or ARM64 compilers for this include !"
        
    CompilerEndIf
EndImport
