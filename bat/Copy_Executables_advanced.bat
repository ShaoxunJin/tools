
@echo off
rem @ echo off = not show this line
echo this is used to display all the directory

rem /ad used only show the directory
rem type ddd.txt

set dest=%~dp0

set number_s37=0
set src=.\Views\DevelopmentView\Build
echo %src%

cd %src%

for /f "delims=" %%i in ('dir /b /a-d /s "*.s37"') do (
echo %%i
XCOPY /Y "%%i" "%dest%"
set /a number_s37+=1
)

for /f "delims=" %%i in ('dir /b /a-d /s "*.map"') do echo %%i
for /f "delims=" %%i in ('dir /b /a-d /s "*.elf"') do echo %%i
for /f "delims=" %%i in ('dir /b /a-d /s "*.mdf"') do echo %%i


echo %number_s37%

:DONE_NORMAL_EXIT
echo Process Finish Successfully.....
echo ................................
pause