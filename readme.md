# PB-Win32-GetconsoleProcessList
Include that provides a wrapper for the `GetconsoleProcessList` Win32 function that isn't available by default in PureBasic.


## Usage
TODO: Indicate how to clone and add as a sub-module.


## Examples
Some examples can be found in the [Examples/](Examples/) sub-folder.

Alternatively, here is a shortened version of [Examples/IsProgramRunDirectly.pb](Examples/IsProgramRunDirectly.pb):
```purebasic
XIncludeFile "../Includes/Win32_GetConsoleProcessList.pbi"

Procedure.b IsProgramRunDirectly()
	; Acts as a DWORD[2]
	Define ProcessListBuffer.q
	
	ProcedureReturn Bool(GetConsoleProcessList_(@ProcessListBuffer, 2) <= 1)
EndProcedure

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
```


## Technical Remarks
I was unable to use `.lib` files on x86 for this include for some weird reason.\
The linker kept saying it couldn't find the symbol even when dumpbin showed it, and when I made my own `.lib` out of a `.def`.

If you can fix this issue, feel free to contribute, or make your own repository.


## License
All the code in this repo is released in the [Public Domain](LICENSE).
