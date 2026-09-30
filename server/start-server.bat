@echo off
rem Khoi dong server OpenMU (Docker) theo huong dan chinh thuc cua MUnique/OpenMU.
setlocal
cd /d "%~dp0"

where docker >nul 2>nul || (echo [LOI] Chua cai Docker Desktop: https://docs.docker.com/get-started/get-docker/ & pause & exit /b 1)
where git >nul 2>nul || (echo [LOI] Chua cai git: https://git-scm.com/download/win & pause & exit /b 1)
docker info >nul 2>nul || (echo [LOI] Docker chua chay. Mo Docker Desktop, doi no khoi dong xong roi chay lai file nay. & pause & exit /b 1)

if not exist "OpenMU\deploy\all-in-one\docker-compose.yml" (
  echo Dang tai OpenMU ve...
  git clone --depth 1 https://github.com/MUnique/OpenMU.git OpenMU || (echo [LOI] Khong tai duoc OpenMU & pause & exit /b 1)
)

pushd "OpenMU\deploy\all-in-one"
docker compose up -d --no-build || (echo [LOI] docker compose that bai & popd & pause & exit /b 1)
popd

echo.
echo === Server dang chay ===
echo Admin panel : http://localhost/   (lan dau: tao user admin ngay)
echo Connect port: 44405 (client goc) / 44406 (client MuMain open-source)
echo IP cho client: 127.127.127.127   (KHONG dung 127.0.0.1)
echo Tai khoan test: test0 ... test9, mat khau = ten tai khoan
echo Tat server: chay stop-server.bat
pause
