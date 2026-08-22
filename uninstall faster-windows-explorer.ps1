# === RESTORE WINDOWS EXPLORER DEFAULT ===

$Shell = "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell"

# Hapus konfigurasi paksa Generic
Remove-Item "$Shell\Bags\AllFolders" -Recurse -Force -ErrorAction SilentlyContinue

# Reset cache folder view
Remove-Item "$Shell\Bags" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$Shell\BagMRU" -Recurse -Force -ErrorAction SilentlyContinue

# Restart Explorer
Stop-Process -Name explorer -Force
Start-Process explorer.exe

Write-Host "Explorer sudah dikembalikan ke perilaku default Windows." -ForegroundColor Green