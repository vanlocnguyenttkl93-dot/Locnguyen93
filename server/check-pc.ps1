# Kiem tra PC va thu muc client MU truoc khi dung server OpenMU.
# Chay: check-pc.bat  (hoac: powershell -ExecutionPolicy Bypass -File check-pc.ps1 -ClientPath "D:\MU")
param([string]$ClientPath = '')

$out = New-Object System.Collections.Generic.List[string]
function Say([string]$m) { Write-Host $m; $out.Add($m) }

Say "=== Kiem tra PC ($(Get-Date -Format s)) ==="
Say "Windows: $([System.Environment]::OSVersion.VersionString)"

foreach ($tool in 'docker', 'git', 'dotnet') {
    $c = Get-Command $tool -ErrorAction SilentlyContinue
    if ($c) { Say "[OK]  $tool : $($c.Source)" } else { Say "[THIEU] $tool chua cai" }
}
if (Get-Command docker -ErrorAction SilentlyContinue) {
    docker info *> $null
    if ($LASTEXITCODE -eq 0) { Say "[OK]  Docker dang chay" } else { Say "[LOI] Docker da cai nhung chua chay (mo Docker Desktop)" }
}
if (Get-Command dotnet -ErrorAction SilentlyContinue) {
    $rt = (dotnet --list-runtimes) -join '; '
    if ($rt -match '(Microsoft\.NETCore\.App|Microsoft\.WindowsDesktop\.App) (1[0-9])\.') { Say "[OK]  .NET runtime >= 10 (cho ClientLauncher)" }
    else { Say "[THIEU] Can .NET 10 runtime cho ClientLauncher: https://dotnet.microsoft.com/download/dotnet/10.0" }
} else { Say "[THIEU] Can .NET 10 runtime cho ClientLauncher: https://dotnet.microsoft.com/download/dotnet/10.0" }

Say "--- Cong (port) can trong ---"
foreach ($p in 80, 44405, 44406, 55901, 55902, 55903, 55904, 55905, 55906, 55980) {
    $l = Get-NetTCPConnection -LocalPort $p -State Listen -ErrorAction SilentlyContinue
    if ($l) { Say "[BAN] Port $p dang bi chuong trinh khac dung (PID $($l[0].OwningProcess))" } else { Say "[OK]  Port $p trong" }
}

Say "--- Client MU ---"
if (-not $ClientPath) { $ClientPath = Read-Host 'Nhap duong dan thu muc client MU (co main.exe), hoac Enter de bo qua' }
if ($ClientPath) {
    $ClientPath = $ClientPath.Trim('"')
    if (-not (Test-Path $ClientPath)) { Say "[LOI] Khong tim thay thu muc: $ClientPath" }
    else {
        $exe = Join-Path $ClientPath 'main.exe'
        if (Test-Path $exe) {
            $fi = Get-Item $exe
            Say "[OK]  main.exe: $([math]::Round($fi.Length / 1KB)) KB, sua doi $($fi.LastWriteTime.ToString('s'))"
            Say "      FileVersion: $($fi.VersionInfo.FileVersion) | Product: $($fi.VersionInfo.ProductName)"
            Say "      SHA256: $((Get-FileHash $exe -Algorithm SHA256).Hash)"
        } else { Say "[LOI] Khong co main.exe trong thu muc nay" }
        $data = Join-Path $ClientPath 'Data'
        if (Test-Path $data) {
            Say "[OK]  Thu muc Data: $((Get-ChildItem $data -Directory).Count) thu muc con, $((Get-ChildItem $data -Recurse -File).Count) file"
            foreach ($d in 'Local', 'Player', 'Item', 'World1', 'Effect', 'Interface') {
                if (Test-Path (Join-Path $data $d)) { Say "      Data\$d : co" } else { Say "      Data\$d : THIEU" }
            }
        } else { Say "[LOI] Khong co thu muc Data" }
        Say "File .exe/.dll o goc: $((Get-ChildItem $ClientPath -File | Where-Object { $_.Extension -in '.exe','.dll' } | ForEach-Object Name) -join ', ')"
        $apk = Get-ChildItem $ClientPath -Recurse -Include *.apk, *.obb -ErrorAction SilentlyContinue | Select-Object -First 1
        if ($apk) { Say "[CANH BAO] Co file APK/OBB: day la client MOBILE, OpenMU khong ho tro." }
    }
}

$report = Join-Path $PSScriptRoot 'check-report.txt'
$out | Set-Content -Encoding UTF8 $report
Write-Host "`nDa luu bao cao: $report  (gui noi dung file nay cho Claude de kiem tra)"
