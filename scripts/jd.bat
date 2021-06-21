@ECHO OFF

set SCRIPT_DIR=%~dp0

IF "%1" == "" goto list
IF "%1" == "-s" goto save
IF "%1" == "-r" goto remove
IF "%1" == "-h" goto help
IF "%1" == "--help" goto help
goto jump

:list
python %SCRIPT_DIR%\jumpdir.py
goto exit

:save
python %SCRIPT_DIR%\jumpdir.py -s
goto exit

:remove
python %SCRIPT_DIR%\jumpdir.py -r
goto exit

:jump
for /f %%i in ('python %SCRIPT_DIR%\jumpdir.py %1') do set VAR=%%i
cd %VAR%
goto exit

:help
python %SCRIPT_DIR%\jumpdir.py --help
goto exit

:exit