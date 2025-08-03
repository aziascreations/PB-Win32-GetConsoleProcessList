;{- Code Header
; ==- Basic Info -================================
;     Name: IsProgramRunDirectly.pbi
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
;  License: CC0 1.0 Universal (Public Domain)
;  GitHub: https://github.com/aziascreations/PB-Win32-GetConsoleProcessList
;}

;- Compiler directives
EnableExplicit


;- Imports
XIncludeFile "../Includes/Win32_GetConsoleProcessList.pbi"


;- Procedures

; Checks if the current process was started via another process (CMD), or not.
; Returns `#True` is there is not parent process, returns `#False` otherwise.
Procedure.b IsProgramRunDirectly()
	; Acts as a DWORD[2]
	Define ProcessListBuffer.q
	
	ProcedureReturn Bool(GetConsoleProcessList_(@ProcessListBuffer, 2) <= 1)
EndProcedure


;- Main program
If Not OpenConsole("Demo - IsProgramRunDirectly")
	End 1
EndIf

If IsProgramRunDirectly()
	Debug "Program was ran directly."
	PrintN("Press enter to exit...")
	Input()
Else
	Debug "Program was ran through another process or CLI."	
EndIf

End 0
