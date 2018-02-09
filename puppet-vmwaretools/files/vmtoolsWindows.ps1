REM ### Check Operating System Version
IF EXIST "C:PROGRAM FILES (x86)" (GOTO WIN64) ELSE (GOTO WIN32)

:WIN64
setup64.exe /S /v "/qn /l*v ""%TEMP%\vmmsi.log"" REBOOT=R ADDLOCAL=ALL REMOVE=Hgfs"
GOTO EOF
:WIN32
setup.exe /S /v "/qn /l*v ""%TEMP%\vmmsi.log"" REBOOT=R ADDLOCAL=ALL REMOVE=Hgfs"
:EOF
