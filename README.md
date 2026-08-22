# faster-windows-explorer
Make Windows Explorer faster by using a consistent Generic folder view and avoiding unnecessary metadata templates.

# 🚀 Windows Explorer Generic View — Faster Folder Sorting

> **Make Windows Explorer faster by using one consistent folder view for all folders.**

Windows Explorer automatically detects folder types and applies different templates for **Pictures, Music, Videos, Documents**, and more.

That sounds useful — until Explorer starts processing unnecessary metadata such as:

* 🏷️ Tags
* 📐 Dimensions
* 🎵 Album / Artist
* ⏱️ Duration
* 🎬 Video metadata
* 📅 Date Taken

When working with folders containing **hundreds or thousands of files**, these additional metadata operations can make sorting and browsing feel noticeably slower.

This project provides simple **PowerShell scripts** to force Windows Explorer to use a consistent **Generic Items** template.

---

## ✨ What Does It Do?

Instead of Windows automatically changing the folder template:

| Folder Type      | Windows Default   | With This Script |
| ---------------- | ----------------- | ---------------- |
| 📷 Pictures      | Picture template  | Generic          |
| 🎵 Music         | Music template    | Generic          |
| 🎬 Videos        | Video template    | Generic          |
| 📄 Documents     | Document template | Generic          |
| 📁 Other folders | Automatic         | Generic          |

The goal is a consistent Details View:

```text
Name | Date modified | Type | Size
```

No unnecessary:

```text
Tags
Dimensions
Length
Album
Artists
Genre
Date taken
```

---

# ⚡ Why?

Windows Explorer uses different folder templates depending on what it thinks a folder contains.

For example:

```text
📁 Photos
   ├── image001.jpg
   ├── image002.jpg
   └── image003.jpg
```

Explorer may automatically treat this as a **Pictures** folder and load additional image metadata.

The same happens with:

```text
🎵 Music
🎬 Videos
📷 Photos
```

If you don't need these metadata columns, they can be unnecessary overhead when browsing and sorting files.

This project tells Explorer:

> **"Treat my folders as Generic Items."**

---

# 🛠️ Features

### ✅ One view for all folders

Use the same basic columns everywhere:

```text
Name
Date modified
Type
Size
```

### 🚀 Faster folder browsing

Avoid unnecessary folder-specific metadata templates.

### 🧹 No third-party software

Only uses built-in Windows Registry and PowerShell.

### ↩️ Easy rollback

A separate script restores Windows Explorer's default behavior.

---

# 📦 Installation

# 🚀 Force Generic View

Run **PowerShell** as your normal Windows user and execute:

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
Write-Host "✓ Windows Explorer is now using the Generic folder template." -ForegroundColor Green
Write-Host ""
```

After running the script, Windows Explorer will use the Generic folder template instead of automatically applying specialized templates.

---

# ↩️ Restore Windows Explorer Default

Want to go back to the normal Windows behavior?

Run:

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
Write-Host "✓ Windows Explorer has been restored to its default behavior." -ForegroundColor Green
Write-Host ""
```

Windows will once again automatically detect folder types:

```text
📷 Pictures → Pictures template
🎵 Music    → Music template
🎬 Videos   → Videos template
📄 Documents → Documents template
📁 General  → General Items
```

---

# ⚠️ Important

These scripts modify the following user-level Registry location:

```text
HKEY_CURRENT_USER
```

They **do not modify system-wide Registry settings**.

However, the scripts remove:

```text
Bags
BagMRU
```

These Registry keys store Windows Explorer's folder-specific view settings.

Therefore, running the scripts may reset previously customized Explorer views such as:

* Icon size
* Details View
* Column configuration
* Folder-specific layouts
* Sorting preferences

### 💡 Recommendation

If you have heavily customized Explorer views, create a Registry backup before using the scripts.

---

# 🖥️ Compatibility

Tested / intended for:

* ✅ Windows 10
* ✅ Windows 11
* ✅ PowerShell 5.1+
* ✅ PowerShell 7+

No external dependencies required.

---

# 📁 Repository Structure

```text
windows-explorer-generic-view/
│
├── Force-Generic-Explorer.ps1
├── Restore-Explorer-Default.ps1
└── README.md
```

---

# 🔍 Before vs After

### Windows Default

```text
📷 Pictures

Name | Date modified | Type | Size | Tags | Dimensions | Date taken
```

### Generic View

```text
📁 Any Folder

Name | Date modified | Type | Size
```

The idea is simple:

> **Less metadata processing → less unnecessary work → potentially faster browsing and sorting.**

Actual performance improvements may vary depending on the number of files, storage device, metadata availability, and Windows configuration.

---

# 🤖 Credits

Created with assistance from **ChatGPT by OpenAI**.

The PowerShell/Registry approach was developed and refined with ChatGPT to provide a simple, reversible way to control Windows Explorer folder templates.

Additional references and inspiration come from Microsoft's documentation and the Windows community.

---

# 📜 License

This project is provided **as-is**, without warranty.

You are free to:

* Use it
* Modify it
* Fork it
* Redistribute it

Use at your own risk and always keep a Registry backup if you have important customized Explorer settings.

---

## ⭐ If This Helped You

If this project made Windows Explorer feel faster or more consistent:

**Give the repository a ⭐ Star!**

It helps others discover the project too. ❤️
