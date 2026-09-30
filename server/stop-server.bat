@echo off
rem Tat server OpenMU. Du lieu (tai khoan, nhan vat) van con trong Docker volume.
cd /d "%~dp0OpenMU\deploy\all-in-one" || (echo Chua co thu muc OpenMU. & pause & exit /b 1)
docker compose down
pause
