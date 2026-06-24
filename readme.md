# PB-Win32-GetConsoleProcessList
Include that provides a wrapper for the [GetConsoleProcessList](https://learn.microsoft.com/en-us/windows/console/getconsoleprocesslist)
Win32 function that isn't available by default in PureBasic.


## Usage
Adding submodule:
```shell
git submodule add https://github.com/aziascreations/PB-Win32-GetConsoleProcessList.git Includes/PB-Win32-GetConsoleProcessList
```

Pull latest submodule version:
```shell
git submodule update --init --recursive
```


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


## License
All the code in this repo is released in the [Public Domain](LICENSE).
