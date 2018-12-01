@echo off
rem parse the input parameterss

rem set src=".\cp_src"
rem set dest=".\cp_dest"

rem get the input form the dos

echo pls input absolute src :
rem set /p src=

set src=.\Views\DevelopmentView\Build\SC2\

if not exist "%src%" goto :ERROR
 
echo pls input absolute dest : 
set /p dest=
rem set dest=.\ProjectInformation\Releases\Executables\SC2_2S_P11_Release\
rem if the dest is not exit, then create
rem 这里输入的是绝对路径
if not exist "%dest%" mkdir "%dest%"

rem 下面一定要注意字符串 引号的作用

rem XCOPY "%src%" "%dest%"
rem %%取变量值 ”“具体字符串还是文字

rem relative path copy command
rem XCOPY cp_src cp_dest this is ok
rem XCOPY "C:\Sean Jin\workspace_test\BAT\cp_src" "C:\Sean Jin\workspace_test\BAT\cp_dest" this case is OK
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\AlgoVar1FixedCal\*.s37" "%dest%"
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\AlgoVar1FixedCal\AlgoVar1FixedCal.map" "%dest%" 
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\AlgoVar1FixedCal\*.elf" "%dest%"
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\AlgoVar1FixedCal\*.mdf" "%dest%"

XCOPY /Y ".\Views\DevelopmentView\Build\SC2\AlgoVar2FixedCal\*.s37" "%dest%"
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\AlgoVar2FixedCal\AlgoVar2FixedCal.map" "%dest%" 
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\AlgoVar2FixedCal\*.elf" "%dest%"
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\AlgoVar2FixedCal\*.mdf" "%dest%"

XCOPY /Y ".\Views\DevelopmentView\Build\SC2\AlgoVar3FixedCal\*.s37" "%dest%"
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\AlgoVar3FixedCal\AlgoVar3FixedCal.map" "%dest%" 
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\AlgoVar3FixedCal\*.elf" "%dest%"
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\AlgoVar3FixedCal\*.mdf" "%dest%"

XCOPY /Y ".\Views\DevelopmentView\Build\SC2\Application\*.s37" "%dest%"
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\Application\Application.map" "%dest%" 
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\Application\*.elf" "%dest%"
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\Application\*.mdf" "%dest%"

XCOPY /Y ".\Views\DevelopmentView\Build\SC2\DynamicEEP\*.s37" "%dest%"
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\DynamicEEP\DynamicEEP.map" "%dest%" 
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\DynamicEEP\*.elf" "%dest%"
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\DynamicEEP\*.mdf" "%dest%"

XCOPY /Y ".\Views\DevelopmentView\Build\SC2\IPFixedCal\*.s37" "%dest%"
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\IPFixedCal\IPFixedCal.map" "%dest%" 
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\IPFixedCal\*.elf" "%dest%"
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\IPFixedCal\*.mdf" "%dest%"


XCOPY /Y ".\Views\DevelopmentView\Build\SC2\PrimaryBootloader\*.s37" "%dest%"
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\PrimaryBootloader\PrimaryBootloader.map" "%dest%" 
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\PrimaryBootloader\*.elf" "%dest%"
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\PrimaryBootloader\*.mdf" "%dest%"

XCOPY /Y ".\Views\DevelopmentView\Build\SC2\PrimaryBootReloader\*.s37" "%dest%"
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\PrimaryBootReloader\PrimaryBootReloader.map" "%dest%" 
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\PrimaryBootReloader\*.elf" "%dest%"
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\PrimaryBootReloader\*.mdf" "%dest%"

XCOPY /Y ".\Views\DevelopmentView\Build\SC2\ScrapDrvr\*.s37" "%dest%"
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\ScrapDrvr\ScrapDrvr.map" "%dest%" 
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\ScrapDrvr\*.elf" "%dest%"
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\ScrapDrvr\*.mdf" "%dest%"

XCOPY /Y ".\Views\DevelopmentView\Build\SC2\SecondaryBootloader\*.s37" "%dest%"
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\SecondaryBootloader\SecondaryBootloader.map" "%dest%" 
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\SecondaryBootloader\*.elf" "%dest%"
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\SecondaryBootloader\*.mdf" "%dest%"

XCOPY /Y ".\Views\DevelopmentView\Build\SC2\VehFixedCal\*.s37" "%dest%"
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\VehFixedCal\VehFixedCal.map" "%dest%" 
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\VehFixedCal\*.elf" "%dest%"
XCOPY /Y ".\Views\DevelopmentView\Build\SC2\VehFixedCal\*.mdf" "%dest%"

goto :DONE

:DONE
pause
exit

:ERROR
echo Input Path : %src% not exist, Please make sure you have compiled.
goto :DONE