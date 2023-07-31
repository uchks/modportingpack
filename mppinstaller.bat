@echo off
rem https://ci.tterrag.com/job/BON2/lastSuccessfulBuild/artifact/build/libs/BON-2.4.0.15-all.jar
rem https://github.com/deathmarine/Luyten/releases/download/v0.5.4_Rebuilt_with_Latest_depenencies/luyten-0.5.4.jar
rem Thank god for 2Pi <3
set workdir="%cd%"
set installBON2=No
set installLuyten=No

:print
set "input="
cls
echo.
echo Welcome to the Mod Porting Pack Downloader!
echo ###########################################
echo Type the number in front of the setting to toggle it (or view), type "go" to start downloading:
echo.
echo 1. Download Bearded Octo Nemesis 2: %installBON2%
echo 2. Download Luyten: %installLuyten%
echo.
echo The files will be installed to where this file is! Make sure it's in the correct folder!
echo.
set /p input="Enter 1, 2 or go: "

if "%input%"=="1" (
    if "%installBON2%"=="No" (
        set installBON2=Yes
    ) else (
        set installBON2=No
    )
    goto print
) else (
        if "%input%"=="2" (
            if "%installLuyten%"=="No" (
                set installLuyten=Yes
            ) else (
                set installLuyten=No
            )
            goto print
        ) else (
            goto start
   )
  )
 )
)

:start
if "%installBON2%"=="No" if "%installLuyten%"=="No" goto errorNoInstallsSelected

cls
echo.
echo By continuing, you confirm that this Downloader is going to install the files into the correct folder.
echo.
pause

if "%installBON2%"=="Yes" (
    goto installBON2
)
:L
if "%installLuyten%"=="Yes" (
    goto installLuyten
)
:END
cls
echo All files downloaded to %cd%
echo.
pause
exit

:installBON2
cls
echo Downloading BON2...
curl https://ci.tterrag.com/job/BON2/lastSuccessfulBuild/artifact/build/libs/BON-2.4.0.15-all.jar --output "BON.jar"
goto L

:installLuyten
cls
echo Downloading Luyten...
curl -L https://github.com/deathmarine/Luyten/releases/download/v0.5.4_Rebuilt_with_Latest_depenencies/luyten-0.5.4.jar > luyten.jar
goto END

:errorNoInstallsSelected
echo.
echo Error: You didn't select anything to be downloaded! Please set at least one of the two options to Yes!
echo.
pause
goto print