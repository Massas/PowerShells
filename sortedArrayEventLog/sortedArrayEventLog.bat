set TODAY=%DATE:/=%
set PATH=%C:fuga%
set LOGPATH=%C:hoge%

echo %DATE% %TIME% >> %LOGPATH%\sortedArrayEventLog_bat_%TODAY%.log

powershell -ExecutionPolicy RemoteSigned -File %PATH%sortedArrayEventLog.ps1 -verb runas >> %LOGPATH%\sortedArrayEventLog_bat_%TODAY%.log

pause
