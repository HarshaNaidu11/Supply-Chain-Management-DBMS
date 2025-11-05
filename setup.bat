@echo off
echo === Supply Chain Management DBMS Setup ===
echo.

REM Check Python installation
echo Checking Python installation...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python not found. Please install Python 3.8 or higher.
    pause
    exit /b 1
)

python --version
echo [OK] Python found
echo.

REM Create virtual environment
echo Creating virtual environment...
if exist venv (
    echo Virtual environment already exists.
) else (
    python -m venv venv
    echo [OK] Virtual environment created
)
echo.

REM Activate virtual environment
echo Activating virtual environment...
call venv\Scripts\activate.bat
echo.

REM Install requirements
echo Installing required packages...
echo This may take a few minutes...
echo NOTE: Using python-oracledb (no Oracle Instant Client needed)
pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo [ERROR] Failed to install packages
    pause
    exit /b 1
)
echo [OK] Packages installed
echo.

REM Create .env file if it doesn't exist
if not exist .env (
    echo Creating .env file...
    copy .env.example .env >nul
    echo [OK] .env file created
    echo.
    echo IMPORTANT: Edit .env file and set your Oracle database credentials:
    echo   - DB_USER
    echo   - DB_PASSWORD
    echo   - DB_DSN
) else (
    echo .env file already exists.
)
echo.

echo === Setup Complete ===
echo.
echo ✅ All Python packages installed (including Flask-SocketIO + gevent for chat)
echo.
echo Next steps:
echo.
echo 1. UPDATE DATABASE CREDENTIALS:
echo    Edit .env file with your Oracle database credentials
echo    - DB_USER (e.g., system)
echo    - DB_PASSWORD (your Oracle password)
echo    - DB_DSN (e.g., localhost:1521/XE)
echo    - SECRET_KEY (generate a random key for production)
echo.
echo 2. SETUP DATABASE SCHEMA:
echo    Run these SQL scripts in Oracle SQL*Plus or SQL Developer:
echo    a. sqlplus system/password@localhost:1521/XE
echo    b. @schema.sql              (Main database tables)
echo    c. @add_authentication.sql  (User authentication)
echo    d. @chat_schema.sql         (Chat system)
echo    e. @sample_data.sql         (Sample data - optional)
echo    f. exit
echo.
echo 3. START THE APPLICATION:
echo    run.bat
echo.
echo 4. ACCESS THE APPLICATION:
echo    Open browser: http://localhost:5000
echo    Default login: admin / password123
echo.
echo 📝 For detailed documentation, see README.md
echo.

pause
