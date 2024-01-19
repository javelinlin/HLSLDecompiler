@echo off

rem USAGE:
rem 	1. Put this batch file and cmd_Decompiler.exe in the same directory
rem 	2. Renderdoc -> Tools -> Settings -> Shader Viewer -> Add
rem 		2.1. Name: whatever you like
rem 		2.2. Tool Type: Custom Tool
rem 		2.3. Executable: Choose this batch file instead of cmd_Decompiler.exe
rem 		2.4. Command Line: {input_file} {output_file}
rem 		2.5. Input/Output: DXBC/HLSL
rem 	3. Renderdoc -> Pipeline State View -> Choose Any Shader Stage
rem 		3.1. Edit -> Decompile with ${Name}
rem 	4. Modify shader as you wish, and click Refresh button to see the change


set raw_input="%1"
set raw_output="%2"

:: The test found that it needed to change the "/" sign of the original input path to a "\" sign
set fix_input=%raw_input:/=\% 
copy %fix_input% "%~dp0temp.dxbc"
"%~dp0cmd_Decompiler.exe" -D "%~dp0temp.dxbc"
mk "%~dp0temp.hlsl"
copy "%~dp0temp.hlsl" %raw_output%
