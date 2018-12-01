@echo off
echo *****************************************************************
echo This is used for compare the file between Asil and Qm
echo You can locate this file in the folder where Davinci code is generate
echo *****************************************************************
rem echo Begin to call Beyond Compare

rem before and after = shall not input any space
set tool_path=c:\Engineer_Program\Beyond Compare 3\
set tool_bin=BCompare.exe

rem set left_file=C:\sean jin\workspace_test\BeyondComapre\1.h
rem set right_file=C:\sean jin\workspace_test\BeyondComapre\2.h

set current_path=%~dp0
set asil_folder=..\..\..\..\DevelopmentView\Application\Asil\DiagSrvs\Dcm\Cfg
echo entering the asil_foler
cd %asil_folder%
set asil_fold_input_string=%cd%
echo asil_fold_input_string

set qm_folder=..\..\..\..\Qm\DiagSrvs\Dcm\Cfg
echo entering the qm_folder
cd %qm_folder%
set qm_folder_input_string=%cd%
echo qm_folder_input_string

start /d "%tool_path%" %tool_bin% "%asil_fold_input_string%" "%qm_folder_input_string%"

goto DONE_NORMAL_EXIT

:DONE_DME_FILE_NOT_EXIST
echo Dcm file not exist
pause

:DONE_NORMAL_EXIT
echo Process Finish Successfully.....
echo ................................
pause