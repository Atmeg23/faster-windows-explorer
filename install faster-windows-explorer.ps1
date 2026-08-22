# === FORCE ALL EXPLORER FOLDERS TO GENERIC ===

$Shell = "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell"

# Hapus cache folder view lama
Remove-Item "$Shell\Bags" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$Shell\BagMRU" -Recurse -Force -ErrorAction SilentlyContinue

# Buat default template Generic
$AllFolders = "$Shell\Bags\AllFolders\Shell"
New-Item $AllFolders -Force | Out-Null

New-ItemProperty `
    -Path $AllFolders `
    -Name "FolderType" `
    -PropertyType String `
    -Value "NotSpecified" `
    -Force | Out-Null

# Restart Explorer
Stop-Process -Name explorer -Force
Start-Process explorer.exe

Write-Host "Explorer sekarang dipaksa menggunakan template Generic." -ForegroundColor Green