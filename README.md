# 🚀 Faster Windows Explorer

Make Windows Explorer simpler and potentially faster by using one consistent folder view.

Windows Explorer automatically detects **Pictures, Music, Videos**, etc. and may load additional metadata.

## ⚡ Before vs After

|             | Before                                                           | After                                                              |
| ----------- | ---------------------------------------------------------------- | ------------------------------------------------------------------ |
| **Columns** | Varies by folder (`Tags`, `Dimensions`, `Length`, `Album`, etc.) | All generic: `Name \| Date modified \| Type \| Size`               |
| **Sorting** | Potentially slower — Explorer may load additional metadata       | Potentially faster! — Explorer doesn't need to load those metadata |

> **Example:** Before: ~10 seconds → After: ~1 second.
> Actual results depend on your PC, storage, and number of files.

---

## 📥 Installation

**No Git. No installation.**

1. **Code → Download ZIP**
2. Extract the ZIP
3. Right-click `Force-Generic-Explorer.ps1`
4. Select **Run with PowerShell**
5. Done. 🎉

Explorer will restart automatically.

### Or run directly with PowerShell

```powershell
# === FORCE ALL EXPLORER FOLDERS TO GENERIC ===

$Shell = "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell"

# Remove existing Explorer folder view cache
Remove-Item "$Shell\Bags" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$Shell\BagMRU" -Recurse -Force -ErrorAction SilentlyContinue

# Create Generic folder template
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

Write-Host ""
Write-Host "✓ Explorer is now using the Generic folder template." -ForegroundColor Green
Write-Host ""
```

---

## ↩️ Restore Default

Want to go back to the normal Windows behavior?

Run `Restore-Explorer-Default.ps1`.

### Restore script

```powershell
# === RESTORE WINDOWS EXPLORER DEFAULT ===

$Shell = "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell"

# Remove forced Generic configuration
Remove-Item "$Shell\Bags\AllFolders" -Recurse -Force -ErrorAction SilentlyContinue

# Reset Explorer folder view cache
Remove-Item "$Shell\Bags" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$Shell\BagMRU" -Recurse -Force -ErrorAction SilentlyContinue

# Restart Explorer
Stop-Process -Name explorer -Force
Start-Process explorer.exe

Write-Host ""
Write-Host "✓ Explorer has been restored to its default behavior." -ForegroundColor Green
Write-Host ""
```

---

## ⚠️ Note

The scripts reset saved Explorer folder views. Some custom layouts, columns, sorting, or icon sizes may be reset.

---

## 🖥️ Requirements

* Windows 10 / 11
* PowerShell

---

## 🤖 Credit

Made with assistance from **ChatGPT by OpenAI**.

⭐ If this helps you, consider giving the repository a Star!
