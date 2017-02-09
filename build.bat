@ECHO OFF

SET BINPATH=D:\bennu\bin\windows\bgd-runtime

:: compilo el ejemplo
%BINPATH%\bgdc.exe -g test.prg

IF NOT ERRORLEVEL 2 GOTO right
IF ERRORLEVEL 2 GOTO wrong

:right
:: si se compilo correctamente

cls

%BINPATH%\bgdi.exe test.dcb

:: contruyo la release
del "release\wiz-keyboard.lib"
del "release\wiz-keyboard.fpg"

type "readme.txt" >> "release\wiz-keyboard.lib"
type "prg\keyboard.prg" >> "release\wiz-keyboard.lib"

copy "fpg\keyboard.fpg" "release\wiz-keyboard.fpg"


GOTO end

:wrong
:: si hubo error en la compilacion

pause

:end



