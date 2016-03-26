@echo off
cd ..
if not exist repo mkdir repo
if not exist repo\sn.fossil goto :getLogin
goto :cloneCore
:getLogin
set name=$$$
set /p name="������ ����� �� snegopat.ru: "
if "%name%"=="$$$" (
	echo �� 㪠��� �����
	goto :end
)

:cloneCore
if exist repo\sn.fossil goto :openCore
echo.
echo �����஢���� ९������ ᭥�����:
echo.
core\fossil clone "http://%name%@snegopat.ru:9005" -A %name% repo\sn.fossil
if not errorlevel 0 (
	echo �� 㤠���� �����஢��� ९����਩ ��������
	goto :end
)

:openCore
if exist _fossil_ goto :updateCore
core\fossil open repo\sn.fossil
if not errorlevel 0 (
	echo �� 㤠���� ������ �᭮���� ९����਩
	goto :end
)
core\fossil set autosync off

:updateCore
echo.
echo ���������� �᭮����� ९������:
echo.
core\fossil pull
core\fossil update
echo.
echo �� ��諮 �ᯥ譮!
echo.

:end
pause
