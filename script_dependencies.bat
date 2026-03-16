@echo off
setlocal enabledelayedexpansion
color 00
cls

for /f %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"

set "CYAN=%ESC%[96m"
set "WHITE=%ESC%[97m"
set "GRAY=%ESC%[90m"
set "YELLOW=%ESC%[93m"
set "GREEN=%ESC%[92m"
set "RED=%ESC%[91m"
set "RESET=%ESC%[0m"

echo.
echo  %CYAN%+------------------------------------------+%RESET%
echo  %CYAN%^|                                          ^|%RESET%
echo  %CYAN%^|%RESET%           %WHITE%A N O N Y M I Z E R%RESET%            %CYAN%^|%RESET%
echo  %CYAN%^|%RESET%           %GRAY%Dependency Installer%RESET%           %CYAN%^|%RESET%
echo  %CYAN%^|                                          ^|%RESET%
echo  %CYAN%+------------------------------------------+%RESET%
echo.
echo  %GRAY%  Clinical Document Anonymization Tool%RESET%
echo.
echo  %CYAN%-------------------------------------------%RESET%
echo.

python --version >nul 2>&1
if errorlevel 1 (
    echo  %RED%  [x] Python - NOT FOUND%RESET%
    echo.
    echo  %RED%  ERROR: Python is not installed.%RESET%
    echo  %GRAY%  Download from: https://www.python.org/downloads/%RESET%
    echo  %GRAY%  IMPORTANT: Check "Add Python to PATH" during install.%RESET%
    echo.
    pause
    exit /b 1
)
echo  %GREEN%  [+] Python - OK%RESET%
echo.
echo  %GRAY%  Checking existing dependencies...%RESET%
echo.

set ALLOK=1

python -c "import streamlit" >nul 2>&1
if errorlevel 1 set ALLOK=0

python -c "import spacy" >nul 2>&1
if errorlevel 1 set ALLOK=0

python -c "import presidio_analyzer" >nul 2>&1
if errorlevel 1 set ALLOK=0

python -c "import lxml" >nul 2>&1
if errorlevel 1 set ALLOK=0

python -c "import spacy; spacy.load('en_core_web_lg')" >nul 2>&1
if errorlevel 1 set ALLOK=0

if %ALLOK%==1 (
    echo  %GREEN%  All dependencies are already installed.%RESET%
    echo.
    echo  %GRAY%  You can run %WHITE%Anonymizer.bat%GRAY% to start the application.%RESET%
    echo.
    echo  %CYAN%-------------------------------------------%RESET%
    echo.
    pause
    exit /b 0
)

echo  %YELLOW%  Some dependencies are missing. Installing now...%RESET%
echo  %GRAY%  This may take several minutes.%RESET%
echo.
echo  %CYAN%-------------------------------------------%RESET%
echo.

python -m pip install --upgrade pip

pip install streamlit lxml presidio-analyzer presidio-anonymizer openpyxl "numpy<2.0.0"

python -c "import spacy" >nul 2>&1
if errorlevel 1 (
    pip install "spacy>=3.7.0"
)

python -c "import spacy; spacy.load('en_core_web_lg')" >nul 2>&1
if errorlevel 1 (
    echo.
    echo  %YELLOW%  Downloading spaCy model (en_core_web_lg)...%RESET%
    pip install https://github.com/explosion/spacy-models/releases/download/en_core_web_lg-3.7.0/en_core_web_lg-3.7.0-py3-none-any.whl
)

python -c "import spacy; spacy.load('es_core_news_md')" >nul 2>&1
if errorlevel 1 (
    echo.
    echo  %YELLOW%  Downloading spaCy model (es_core_news_md)...%RESET%
    pip install https://github.com/explosion/spacy-models/releases/download/es_core_news_md-3.7.0/es_core_news_md-3.7.0-py3-none-any.whl
)

python -c "import spacy; nlp=spacy.load('en_ner_bc5cdr_md')" >nul 2>&1
if errorlevel 1 (
    echo.
    echo  %YELLOW%  Downloading biomedical model (en_ner_bc5cdr_md)...%RESET%
    pip install https://s3-us-west-2.amazonaws.com/ai2-s2-scispacy/releases/v0.5.4/en_ner_bc5cdr_md-0.5.4.tar.gz
)

echo.
echo  %CYAN%-------------------------------------------%RESET%
echo.
echo  %GREEN%  Installation complete!%RESET%
echo.
echo  %GRAY%  You can now run %WHITE%Anonymizer.bat%GRAY% to start the application.%RESET%
echo.
echo  %GRAY%  NOTE: The application requires %WHITE%Google Chrome%GRAY%.%RESET%
echo  %GRAY%  Download: https://www.google.com/chrome/%RESET%
echo.
echo  %CYAN%-------------------------------------------%RESET%
echo.
pause
