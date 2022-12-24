@echo off
rem cant scan doc/docx/xls/xlsx files
GOTO :Main
rem ***scan folder for pii***
:scanFolder
    FOR /r C:\%~1\ %%f IN (*.txt, *.csv, *.doc, *.docx, *.xlsx, *.xls) DO (
        IF %%f == *.txt OR IF %%f == *.csv (
            findstr /i "name credit ssn email birthday social" "%%f">NUL
            IF ERRORLEVEL 0 (
                IF not %%f == NUL (
                    echo %%f >> %~2
                )
            )
        )
    ) ELSE (
        echo %%f >> %~2
    )
    exit /B 0
rem ***Main function***
:Main
set logFile="pii_locations.txt"
call :scanFolder "Users", %logFile%
call :scanFolder "inetpub", %logFile%
call :scanFolder "xampp", %logFile%