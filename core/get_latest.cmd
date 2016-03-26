@echo off
cd ..
if not exist repo mkdir repo
if not exist repo\sn.fossil goto :getLogin
goto :cloneCore
:getLogin
set name=$$$
set /p name="Укажите логин на snegopat.ru: "
if "%name%"=="$$$" (
	echo Не указан логин
	goto :end
)

:cloneCore
if exist repo\sn.fossil goto :openCore
echo.
echo Клонирование репозитария снегопата:
echo.
core\fossil clone "http://%name%@snegopat.ru:9005" -A %name% repo\sn.fossil
if not errorlevel 0 (
	echo Не удалось клонировать репозитарий Снегопата
	goto :end
)

:openCore
if exist _fossil_ goto :updateCore
core\fossil open repo\sn.fossil
if not errorlevel 0 (
	echo Не удалось открыть основной репозитарий
	goto :end
)
core\fossil set autosync off

:updateCore
echo.
echo Обновление основного репозитария:
echo.
core\fossil pull
core\fossil update
echo.
echo Все прошло успешно!
echo.

:end
pause
