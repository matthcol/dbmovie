# Fetch the Oracle DB Dockerfiles for a given version from the official
# oracle/docker-images repo, without cloning the whole (huge) repository.
# Usage: .\fetch-oracle-dockerfiles.ps1 [-Version 21.3.0]

param(
    [string]$Version = "21.3.0",
    [string]$Repo = "https://github.com/oracle/docker-images.git",
    [string]$Branch = "main"
)

$subPath = "OracleDatabase/SingleInstance/dockerfiles/$Version"
$tempDir = Join-Path $env:TEMP "oracle-docker-images-$([guid]::NewGuid())"

git clone --no-checkout --depth 1 --filter=blob:none --branch $Branch $Repo $tempDir
if ($LASTEXITCODE -ne 0) { throw "git clone failed" }

Push-Location $tempDir
git sparse-checkout init --cone
git sparse-checkout set $subPath
git checkout $Branch
Pop-Location

$source = Join-Path $tempDir $subPath
if (-not (Test-Path $source)) {
    Remove-Item -Recurse -Force $tempDir
    throw "Path '$subPath' not found in $Repo@$Branch"
}

New-Item -ItemType Directory -Force -Path $Version | Out-Null
Copy-Item -Path (Join-Path $source '*') -Destination $Version -Recurse -Force

Remove-Item -Recurse -Force $tempDir

Write-Host "Fetched Oracle DB $Version Dockerfiles into .\$Version"

# Detect which no-login, free-tier Dockerfile variant this version ships
# (naming changed from "Dockerfile.xe" to "Containerfile.free" starting with 23ai)
if (Test-Path (Join-Path $Version 'Dockerfile.xe')) {
    Write-Host "Free/XE variant: Dockerfile.xe  ->  build with: -f Dockerfile.xe"
}
elseif (Test-Path (Join-Path $Version 'Containerfile.free')) {
    Write-Host "Free/XE variant: Containerfile.free  ->  build with: -f Containerfile.free"
}
else {
    Write-Warning "No free/XE variant found for $Version - only the Enterprise/Standard Dockerfile is available, which requires a manual login-gated download from Oracle."
}
