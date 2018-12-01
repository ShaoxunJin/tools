@echo off
echo *****************************************************************
echo This is used for compare the file generated by Davici with Source
echo You should locate this file in the folder where dem is generated
echo *****************************************************************
rem echo Begin to call Beyond Compare

rem before and after = shall not input any space
set tool_path=c:\Engineer_Program\Beyond Compare 3\
set tool_bin=BCompare.exe

rem set left_file=C:\sean jin\workspace_test\BeyondComapre\1.h
rem set right_file=C:\sean jin\workspace_test\BeyondComapre\2.h

set current_path=%~dp0
set right_folder=Dcm_latest
set right_folder_string=%current_path%%right_folder%
echo %right_folder_string%
if not exist %right_folder_string% mkdir %right_folder_string%

if not exist Dcm_*.c goto DONE_DME_FILE_NOT_EXIST
if not exist Dcm_*.h goto DONE_DME_FILE_NOT_EXIST

xcopy /y Dcm_*.c %right_folder_string%
xcopy /y Dcm_*.h %right_folder_string%

set left_folder=..\..\..\..\DevelopmentView\Application\Qm\DiagSrvs\Dcm\Cfg
echo befor_replace   %right_folder_string%
cd %left_folder%
set left_folder_path=%cd%
echo %left_folder_path%

start /d "%tool_path%" %tool_bin% "%left_folder_path%" "%right_folder_string%"

goto DONE_NORMAL_EXIT

:DONE_DME_FILE_NOT_EXIST
echo DEM file not exist
pause

:DONE_NORMAL_EXIT
echo Process Finish Successfully.....
echo ................................
pause