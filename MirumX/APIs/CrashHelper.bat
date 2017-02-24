@echo off
goto :MirumXAPI

This API provides a crash helper for MirumX
USAGE:
	Example Script:
		
		@echo off
		if /i "%API.CrashHelper.status%"=="running" (goto :core)
		set "MirumX_file=%~nx0"&set "MirumX=%~0"&set "MirumX_ext=%~x0"&set "MirumX_folder=%~dp0"&set "MirumX_switches=%*"
		CrashHelper
		:core
		echo Crash Protected!
		echo Press any key to crash
		pause >nul
		&|&|
		
	
	
:MirumXAPI
if /i "%API.CrashHelper%"=="disable" (
set "API.CrashHelper.status=disabled"
goto :EOF)

:CrashHelper.initiate
set "API.CrashHelper.status=running"
if defined MirumX_switches (goto :MirumX_switches) else (goto :MirumX)

:MirumX
call cmd /t:f0 /c "%MirumX%"
goto :exit.check

:MirumX_switches
call cmd /t:f0 /c "%MirumX%" %MirumX_switches%
goto :exit.check


:exit.check
if "%errorlevel%"=="200" (goto exit.normal)
if "%errorlevel%"=="300" (goto reboot.new)
if "%errorlevel%"=="301" (goto reboot.keep)
goto exit.crash

:reboot.keep
goto :MirumX

:reboot.new
goto :MirumX


:exit.normal
for /F "eol=[ delims=" %%A in (main.settings) do set "%%A">nul 2>&1
if "%exit.window.title%"=="" set "exit.window.title=Exit"
if "%exit.window.height%"=="" set "exit.window.height=14"
if "%exit.window.width%"=="" set "exit.window.width=45"
if "%exit.window.color%"=="" set "exit.window.color=f0"
if "%exit.window.color.ASCII%"=="" set "exit.window.color.ASCII=fd"
if "%exit.window.color.copyrighttext%"=="" set "exit.window.color.copyrighttext=f8"
if "%exit.window.color.linktext%"=="" set "exit.window.color.linktext=f9"
color %exit.window.color%
title %exit.window.title% %window.title.suffix%
mode con: cols=%exit.window.width% lines=%exit.window.height%
%API%DeleteChar
set "normal=&%API%clr {f0}&<nul set /p =.%DeleteChar%"
set "copyright=&%API%clr {%exit.window.color.copyrighttext%}&<nul set /p ="
set "link=&%API%clr {%exit.window.color.linktext%}&<nul set /p ="
set "ASCII=&%API%clr {%exit.window.color.ASCII%}&<nul set /p ="
<nul set /p = ^
���������������������������������������������^
� %ASCII%������ͻ  ���ͻ���ͻ  �����ͻ  ��������ͻ%normal% �^
� %ASCII%������ͼ  Ȼ��ȼ��ɼ  Ȼ���ɼ  ��ɻ��ɻ��%normal% �^
� %ASCII%������ͻ   Ȼ����ɼ    �����   �ͼ�����ͼ%normal% �^
� %ASCII%������ͼ   ɼ����Ȼ    �����      ����   %normal% �^
� %ASCII%������ͻ  ɼ��ɻ��Ȼ  ɼ���Ȼ     ����   %normal% �^
� %ASCII%������ͼ  ���ͼ���ͼ  �����ͼ     ��ͼ   %normal% �^
���������������������������������������������^
�    %copyright%MirumX was designed by Samuel Denty,%normal%   �^
�              %copyright%�2017 MirumCode.%normal%             �^
�                                           �^
���������������������������������������������^
   �   %link%http://Mirum.weebly.com/#MirumX&%API%clr {f0}%normal%   �   ^
   ���������������������������������������
timeout /nobreak /t 5 >nul
goto :exit

:exit.crash
color 0c
echo.
%API%FillScreen �
echo   � CRITICAL ERROR: CORE CRASH
%API%FillScreen �
echo.&echo.
echo MirumX has just crashed due to an unknown reason.
echo.
%API%List "Report to developers" "start mailto:samddenty+mirumx@gmail.com" "Reboot (New session)" "goto :MirumX" Exit "goto :exit.normal"
%ListCommand%
goto :exit.normal



:exit
exit