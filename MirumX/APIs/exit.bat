@echo off
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
call DeleteChar
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
�              %copyright%�2016 MirumCode.%normal%             �^
�                                           �^
���������������������������������������������^
   �    %link%http://Mirum.weebly.com/MirumX&%API%clr {f0}%normal%   �   ^
   ���������������������������������������
pause >nul
