@echo off
echo ============================================
echo         DEPENDENCY INSTALLER
echo              Anonymizer
echo ============================================
echo.

python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed.
    echo.
    echo Please download Python from:
    echo https://www.python.org/downloads/
    echo.
    echo IMPORTANT: During installation, check the box
    echo "Add Python to PATH"
    echo.
    pause
    exit /b 1
)

echo Python found successfully.
echo.
echo Installing dependencies... This may take several minutes.
echo.

python -m pip install --upgrade pip

pip install -r requirements.txt

echo.
echo Downloading spaCy language model (en_core_web_lg)...
python -m spacy download en_core_web_lg

echo.
echo ============================================
echo   INSTALLATION COMPLETE
echo ============================================
echo.
echo You can now run "Anonymizer.bat"
echo to start the application.
echo.
echo NOTE: For best experience, use Google Chrome.
echo.
pause