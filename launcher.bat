@ECHO OFF
ECHO Currently running launcher version 0.1. A newer one may be available on https://github.com/DoppiePoppie/MommyMiner/releases/latest/
ECHO Checking for autorun settings.
IF EXIST "%cd%\settings.doppel" (
  ECHO Found autorun settings.
  ECHO Input Y within 10 seconds to go to settings.
  ECHO Input N or wait 10 seconds to autorun.
  CHOICE /T 10 /C YN /D N
  IF %ERRORLEVEL%==1 (
    GOTO DOWNLOAD
  )
  IF %ERRORLEVEL%==2 (
    GOTO AUTORUN
  )
) ELSE (
  ECHO No autorun settings found. Forwarding to download.
  GOTO DOWNLOAD
)

:AUTORUN
ECHO Searching for executable.
IF EXIST "%cd%\nsfminer.exe" (
  ECHO Executable exists, attempting autorun.
  GOTO RUN
) ELSE (
  ECHO Despite autorun settings, the executable doesn't exist. Forwarding to download and resetting autorun settings.
  DEL settings.doppel
  IF EXIST "%cd%\nosettings.doppel" (
    DEL nosettings.doppel
  )
  GOTO DOWNLOAD
)


:DOWNLOAD
IF EXIST "%cd%\settings.doppel" (
  SET AUTORUNSETTING=ON
) ELSE (
  SET AUTORUNSETTING=OFF
)
IF EXIST "%cd%\nosettings.doppel" (
  SET NOAUTORUNSETTING=ON
) ELSE (
  SET NOAUTORUNSETTING=OFF
)
IF NOT EXIST "%cd%\nsfminer.exe" (
  SET NOMINER=Miner not found.
) ELSE (
  SET NOMINER=Miner found.
)
ECHO -------------------------------------------------------------------------------------
ECHO 1 - Download for NVidia GPUs (CUDA).
ECHO 2 - Download for AMD GPUs (OpenCL).
ECHO 3 - Download for both GPUs (CUDA and OpenCL).
ECHO 4 - Switch autorun setting. (Currently: %AUTORUNSETTING%)
ECHO 5 - Switch autorun question setting. (Currently: %NOAUTORUNSETTING%)
ECHO 6 - Attempt to run the miner. (%NOMINER%)
ECHO -------------------------------------------------------------------------------------
ECHO.
SET /P M=Type 1, 2, 3, 4, 5, or 6, then press ENTER:
IF %M%==1 GOTO CUDA
IF %M%==2 GOTO OPENCL
IF %M%==3 GOTO BOTH
IF %M%==4 GOTO SWITCHAUTORUN
IF %M%==5 GOTO SWITCHNOAUTORUN
IF %M%==6 GOTO RUN

:CUDA
ECHO.
ECHO Downloading the CUDA miner, please wait...
%SYSTEMROOT%\SYSTEM32\bitsadmin.exe /rawreturn /nowrap /transfer starter /dynamic /download /priority foreground https://github.com/no-fee-ethereum-mining/nsfminer/releases/download/v1.3.14/nsfminer_1.3.14-windows_10-cuda_11.3.zip "%cd%\package.zip"
GOTO UNPACK

:OPENCL
ECHO.
ECHO Downloading the OpenCL miner, please wait...
%SYSTEMROOT%\SYSTEM32\bitsadmin.exe /rawreturn /nowrap /transfer starter /dynamic /download /priority foreground https://github.com/no-fee-ethereum-mining/nsfminer/releases/download/v1.3.14/nsfminer_1.3.14-windows_10-opencl.zip "%cd%\package.zip"
GOTO UNPACK

:BOTH
ECHO.
ECHO Downloading the universal miner, please wait...
%SYSTEMROOT%\SYSTEM32\bitsadmin.exe /rawreturn /nowrap /transfer starter /dynamic /download /priority foreground https://github.com/no-fee-ethereum-mining/nsfminer/releases/download/v1.3.14/nsfminer_1.3.14-windows_10-cuda_11.3-opencl.zip "%cd%\package.zip"
GOTO UNPACK

:UNPACK
ECHO.
ECHO Unpacking the downloaded file, please wait...
powershell -Command "Expand-Archive package.zip -DestinationPath %cd%\\ -Force"
GOTO SETUPAUTORUN

:SETUPAUTORUN
IF IF EXIST "%cd%\nosettings.doppel" (
  GOTO RUN
) ELSE (
  ECHO.
  ECHO -------------------------------------------------------------------------------------
  ECHO 1 - Save these settings, enabling the script to instantly run the set-up profile.
  ECHO 2 - Don't save the settings, let me redownload next time.
  ECHO -------------------------------------------------------------------------------------
  ECHO.
  SET /P M=Type 1 or 2, then press ENTER:
  IF %M%==1 GOTO CREATEAUTORUN
  IF %M%==2 GOTO AUTORUNQUESTION
)

:CREATEAUTORUN
copy /y NUL settings.doppel >NUL
GOTO RUN

:SWITCHAUTORUN
IF EXIST "%cd%\settings.doppel" (
  DEL settings.doppel
) ELSE (
  copy /y NUL settings.doppel >NUL
)
GOTO DOWNLOAD

:AUTORUNQUESTION
ECHO.
ECHO -------------------------------------------------------------------------------------
ECHO 1 - Don't ask me about autorun options again.
ECHO 2 - Do ask me about autorun again next time.
ECHO -------------------------------------------------------------------------------------
ECHO.
SET /P M=Type 1 or 2, then press ENTER:
IF %M%==1 GOTO NOMOREAUTORUN
IF %M%==2 GOTO RUN

:NOMOREAUTORUN
copy /y NUL nosettings.doppel >NUL
GOTO RUN

:SWITCHNOAUTORUN
IF EXIST "%cd%\nosettings.doppel" (
  DEL nosettings.doppel
) ELSE (
  copy /y NUL nosettings.doppel >NUL
)
GOTO DOWNLOAD

:RUN
ECHO Attempting to run the executable.
GOTO ENDOFFILE

:ENDOFFILE
PAUSE
