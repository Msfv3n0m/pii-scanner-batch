@echo off
:: cant scan xls/xlsx files
echo "" > flolf.txt
FOR /r C:\Users\ %%f IN (*.txt, *.csv, *.doc, *.docx, *.xlsx, *.xls) DO ( 
    findstr /i "name credit ssn email birthday social" "%%f">NUL
    IF not ERRORLEVEL 1 (
        echo %%f >> flolf.txt
    )
)

FOR /r C:\inetpub\ %%f IN (*.txt, *.csv, *.doc, *.docx, *.xlsx, *.xls) DO ( 
    findstr /i "name credit card ssn email birthday social" "%%f">NUL
    IF not ERRORLEVEL 1 (
        echo %%f >> flolf.txt
    )
)

FOR /r C:\xampp\ %%f IN (*.txt, *.csv, *.doc, *.docx, *.xlsx, *.xls) DO (
    findstr /i "name credit ssn email birthday social" "%%f">NUL
    IF not ERRORLEVEL 1 (
        echo %%f >> flolf.txt
    )
)
