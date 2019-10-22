
@echo off
cd /d %~dp0\\..\\
%SystemRoot%\system32\cmd.exe  /C "E:\\Progra~1\\Xscript\\Program\\ndk\\ndk-build -j8 -B"
pause
