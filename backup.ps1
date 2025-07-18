# path to Docker Desktop
$dockerPath = "your_path_to_dockerdesktop.exe"

# Run Docker Desktop, if isnt't running
$dockerRunning = Get-Process -Name "Docker Desktop" -ErrorAction SilentlyContinue
if (-not $dockerRunning) {
    Write-Host "Starting Docker Desktop..."
    Start-Process -FilePath $dockerPath
    Start-Sleep -Seconds 15
} else {
    Write-Host "Docker is already running"
}

# change the path to your backup folder
cd "path-to-backup-folder"

# Creating folder "dump" if not exist
if (!(Test-Path -Path "dump")) {
    New-Item -ItemType Directory -Path "dump"
}

# Current date in YYYY-MM-DD format
$date = Get-Date -Format "yyyy-MM-dd"

# Backup and pauses
Start-Sleep -Seconds 10
npx supabase db dump --db-url "your-connection-string" --file "dump/roles_$date.sql" --role-only

Start-Sleep -Seconds 10
npx supabase db dump --db-url "your-connection-string" --file "dump/schema_$date.sql" --debug

Start-Sleep -Seconds 10
npx supabase db dump --db-url "your-connection-string" --file "dump/data_$date.sql" --debug --data-only --use-copy
