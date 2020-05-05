@echo off
rem https://ci.tterrag.com/job/BON2/lastSuccessfulBuild/artifact/build/libs/BON-2.4.0.15-all.jar
rem https://github.com/KevinPriv/Luyten4Forge/releases/download/1.3/Luyten4Forge.1.3.jar
rem https://github.com/deathmarine/Luyten/releases/download/v0.5.4_Rebuilt_with_Latest_depenencies/luyten-0.5.4.jar
rem http://bspk.rs/MC/MCPMappingViewer/MCPMappingViewer_1.0.1.jar
rem Thank god for 2Pi <3
set workdir="%cd%"
set installBON2=No
set installLuyten4Forge=No
set installLuyten=No
set installMCPMappingViewer=No

if not exist "%workdir%/resources" goto errorNoDirectory

:print
set "input="
cls
echo.
echo Welcome to the Mod Porting Pack Downloader!
echo ###########################################
echo Type the number in front of the setting to toggle it (or view), type "go" to start downloading:
echo.
echo 1. Download Bearded Octo Nemesis 2: %installBON2%
echo 2. Download Luyten4Forge: %installLuyten4Forge%
echo 3. Download Luyten: %installLuyten%
echo 4. Download MCP Mapping Viewer: %installMCPMappingViewer%
echo.
echo The files will be installed to where this file is! Make sure it's in the correct folder!
echo.
set /p input="Enter 1, 2, 3, 4 or go: "

if "%input%"=="1" (
    if "%installBON2%"=="No" (
        set installBON2=Yes
    ) else (
        set installBON2=No
    )
    goto print
) else (
    if "%input%"=="2" (
        if "%installLuyten4Forge%"=="No" (
            set installLuyten4Forge=Yes
        ) else (
            set installLuyten4Forge=No
        )
        goto print
    ) else (
        if "%input%"=="3" (
            if "%installLuyten%"=="No" (
                set installLuyten=Yes
            ) else (
                set installLuyten=No
            )
            goto print
        ) else (
                if "%input%"=="4" (
            if "%installMCPMappingViewer%"=="Yes" (
                set installMCPMappingViewer=No
            ) else (
                set installMCPMappingViewer=Yes
            )
            goto print
        ) else (
            goto start
   )
  )
 )
)

:start
if "%installBON2%"=="No" if "%installLuyten4Forge%"=="No" if "%installLuyten%"=="No" if "%installMCPMappingViewer%"=="No" goto errorNoInstallsSelected

cls
echo.
echo By continuing, you confirm that this Downloader is going to install the files into the correct folder.
echo.
pause

if not exist "%workdir%/resources/temp" (
    mkdir "%workdir%/resources/temp"
)

if "%installBON2%"=="Yes" (
    goto installBON2
)
:L4F
if "%installLuyten4Forge%"=="Yes" (
    goto installLuyten4Forge
)
:L
if "%installLuyten%"=="Yes" (
    goto installLuyten
)
:MCP
if "%installMCPMappingViewer%"=="Yes" (
    goto installMCPMappingViewer
)
:END
cls
echo All files downloaded to /resources/temp/
echo.
pause
exit

:installBON2
cls
echo Downloading BON2...
resources\wget\wget.exe --directory-prefix=resources/temp https://ci.tterrag.com/job/BON2/lastSuccessfulBuild/artifact/build/libs/BON-2.4.0.15-all.jar -q --show-progress
goto L4F

:installLuyten4Forge
cls
echo.
echo Downloading Luyten4Forge...
resources\wget\wget.exe --directory-prefix=resources/temp https://github.com/KevinPriv/Luyten4Forge/releases/download/1.3/Luyten4Forge.1.3.jar -q --show-progress
goto L

:installLuyten
cls
echo Downloading Luyten...
resources\wget\wget.exe --directory-prefix=resources/temp https://github.com/deathmarine/Luyten/releases/download/v0.5.4_Rebuilt_with_Latest_depenencies/luyten-0.5.4.jar -q --show-progress
goto MCP

:installMCPMappingViewer
cls
echo Downloading MCPMappingViewer...
resources\wget\wget.exe --directory-prefix=resources/temp http://bspk.rs/MC/MCPMappingViewer/MCPMappingViewer_1.0.1.jar -q --show-progress
goto END

:errorNoInstallsSelected
echo.
echo Error: You didn't select anything to be downloaded! Please set at least one of the five options to Yes!
echo.
pause
goto print

:errorNoDirectory
echo.
echo Error: Couldn't find the folder "/resources/" in current folder!
echo.
echo Current working directory: "%cd%"
echo.
pause
exit
