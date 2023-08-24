@ECHO OFF

TITLE Ping To LoL LAN1 Server 


COLOR 0B
ECHO LoL Server


:section1
ECHO --------------------------

:: Cambiaron el servidor tal vez. Esta era la dirección anterior -> 104.160.136.3
ping.exe   104.160.136.3

ECHO --------------------------

:section2
ECHO Run Again?

ECHO Enter Y for Yes

ECHO Enter N for No

CHOICE /c YN /m "Yes or No"

IF errorlevel 2 GOTO end
IF errorlevel 1 GOTO section1

:end
EXIT

PAUSE