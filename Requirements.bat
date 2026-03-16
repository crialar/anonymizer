@echo off
echo ============================================
echo          INSTALADOR DE DEPENDENCIAS          
echo                  Anonymizer
echo ============================================
echo.

python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python no esta instalado.
    echo.
    echo Por favor, descarga Python desde:
    echo https://www.python.org/downloads/
    echo.
    echo IMPORTANTE: Durante la instalacion, marca la casilla
    echo "Add Python to PATH"
    echo.
    pause
    exit /b 1
)

echo Python encontrado correctamente.
echo.
echo Instalando dependencias... Esto puede tardar varios minutos.
echo.

python -m pip install --upgrade pip

pip install -r requirements.txt

echo.
echo Descargando modelo de lenguaje spaCy (en_core_web_lg)...
python -m spacy download en_core_web_lg

echo.
echo ============================================
echo   INSTALACION COMPLETADA
echo ============================================
echo.
echo Ahora puedes ejecutar "2_ejecutar_aplicacion.bat"
echo para iniciar la aplicacion.
echo.
pause
