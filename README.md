# faster-windows-explorer
Make Windows Explorer faster by using a consistent Generic folder view and avoiding unnecessary metadata templates.
# 🚀 Windows Explorer Generic View

**Make Windows Explorer faster when browsing and sorting files.**

Windows Explorer automatically checks folders and loads extra metadata for **Pictures, Music, Videos**, etc.

Kalau folder berisi banyak file, proses ini bisa terasa lambat.

### ⚡ Simple Example

```text
BEFORE
Windows Explorer
      ↓
Check folder type
      ↓
Load metadata
      ↓
Sort files
      ↓
🐢 10 seconds


AFTER
Windows Explorer
      ↓
Generic folder view
      ↓
Sort files
      ↓
⚡ 1 second
```

> **Example only. Actual performance depends on your PC, storage, and number of files.**

---

## ✨ What This Does

Forces Windows Explorer to use one simple folder template:

```text
Name | Date modified | Type | Size
```

Instead of automatically adding things like:

```text
Tags | Dimensions | Length | Album | Artist | Date taken
```

---

# 📥 Installation

**No Git. No installation. No complicated setup.**

### 1. Download

Click:

**Code → Download ZIP**

Extract the ZIP.

### 2. Run

Open the extracted folder.

Right-click:

```text
Force-Generic-Explorer.ps1
```

Select:

**Run with PowerShell**

Done. 🎉

Windows Explorer will restart automatically.

---

# ↩️ Want to Go Back?

Run:

```text
Restore-Explorer-Default.ps1
```

This returns Windows Explorer to its normal behavior.

---

## ⚠️ Important

The script resets Explorer's saved folder views.

Your custom:

* Folder layouts
* Column settings
* Sorting preferences
* Icon sizes

may be reset.

---

## 🖥️ Compatibility

* Windows 10
* Windows 11
* PowerShell

No additional software required.

---

## 🤖 Credit

Made with assistance from **ChatGPT by OpenAI**.

---

## ⭐ Like It?

If this helps make your Windows Explorer faster or less annoying, consider giving the repo a ⭐
