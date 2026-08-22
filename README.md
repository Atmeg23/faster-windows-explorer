# 🚀 Faster Windows Explorer

Make Windows Explorer Sorting Features More Faster 10x !

By default, Windows Explorer auto-detects folder types (**Pictures, Music, Videos**, etc.) and loads extra metadata columns for each — which can slow down browsing, especially in folders with many files. This script forces **all folders** to use the generic template, so Explorer skips that extra metadata lookup.

---

## 📋 Table of Contents

- [Before vs After](#-before-vs-after)
- [Installation](#-installation)
- [Restore Default](#-restore-default)
- [How It Works](#-how-it-works)
- [Notes & Warnings](#-notes--warnings)
- [Requirements](#-requirements)
- [Credit](#-credit)

---

## ⚡ Before vs After

|             | Before                                                                | After                                                             |
| ----------- | ---------------------------------------------------------------------- | -------------------------------------------------------------------- |
| **Columns** | Varies by folder type (`Tags`, `Dimensions`, `Length`, `Album`, etc.)   | Generic for all folders: `Name`, `Date modified`, `Type`, `Size`     |
| **Sorting** | Slower — Explorer may load extra metadata per folder type              | Faster — Explorer skips loading that metadata                        |

> **Example:** Before: ~10 seconds → After: ~1 second.
> Actual results vary depending on your PC, storage type, and number of files.

---

## 📥 Installation

1. Download or clone this repository.
2. Right-click `install faster-windows-explorer.ps1`.
3. Select **Run with PowerShell**.
4. Done — Explorer will restart automatically.

### Or run directly in a PowerShell terminal

```powershell
# === FORCE ALL EXPLORER FOLDERS TO GENERIC VIEW ===

$Shell = "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell"

# Remove existing Explorer folder view cache
Remove-Item "$Shell\Bags" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$Shell\BagMRU" -Recurse -Force -ErrorAction SilentlyContinue

# Create the generic folder template
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

Write-Host "`n✓ Explorer is now using the generic folder template.`n" -ForegroundColor Green
```

---

## ↩️ Restore Default

Want to revert to normal Windows behavior? Run `Restore-ExplorerDefault.ps1`.

### Or run directly in a PowerShell terminal

```powershell
# === RESTORE WINDOWS EXPLORER DEFAULT BEHAVIOR ===

$Shell = "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell"

# Remove the forced generic configuration
Remove-Item "$Shell\Bags\AllFolders" -Recurse -Force -ErrorAction SilentlyContinue

# Reset Explorer folder view cache
Remove-Item "$Shell\Bags" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item "$Shell\BagMRU" -Recurse -Force -ErrorAction SilentlyContinue

# Restart Explorer
Stop-Process -Name explorer -Force
Start-Process explorer.exe

Write-Host "`n✓ Explorer has been restored to its default behavior.`n" -ForegroundColor Green
```

---

## ⚙️ How It Works

Windows stores per-folder view settings (columns, sort order, icon size, template type) in the registry under:
HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags


Explorer looks up a folder's `FolderType` to decide which columns and metadata to load. This script clears the existing cache and inserts a single generic template (`FolderType = NotSpecified`) that applies to every folder, so Explorer no longer needs to auto-detect or fetch type-specific metadata.

---

## ⚠️ Notes & Warnings

- This only affects **your current Windows user account** — no admin rights required, and no system-wide settings are modified.
- Running the script resets Explorer's folder view cache. Any custom per-folder layouts, column choices, sort order, or icon sizes you've set may be reset to default.
- Speed improvements depend on your hardware, storage type (HDD vs SSD), and how many files/folders you typically browse. Results will vary.
- Always back up your registry (or create a System Restore point) before running scripts that modify `HKCU`, especially if you're unsure.

---

## 🖥️ Requirements

- Windows 10 or 11
- PowerShell (built-in, no extra install needed)

✅ **Tested on:** Windows 11 IoT LTSC 24H2, build 26100.9168

---

## 🤖 Credit

Made with assistance from **ChatGPT by OpenAI**.

---

## Contact me
instagram: @atmeg_

⭐ If this helped you, consider starring the repository!
