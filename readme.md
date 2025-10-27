# 🛠️ The Sims 1 : Complete Collection Thai Registry Generator

สคริปต์นี้ถูกสร้างขึ้นเพื่อช่วยผู้ใช้ The Sims 1 Complete Collection (CD/DVD) ที่ต้องการแก้ไขข้อมูล Registry ให้รองรับภาษาไทย และแก้ปัญหาการตั้งค่า InstallPath, SIMS_LANGUAGE และค่า Expansion ต่าง ๆ โดยสามารถสร้างไฟล์ `.reg` สำหรับทั้งระบบ 32-bit และ 64-bit ได้โดยอัตโนมัติ พร้อมปุ่ม Import ใช้งานสะดวกผ่าน GUI

---

## ✨ ฟีเจอร์ของโปรแกรม

- ✅ เลือกโฟลเดอร์ติดตั้งเกมผ่านปุ่ม Browse
- 🔧 สร้างไฟล์ Registry ทั้ง **32-bit** และ **64-bit** โดยอัตโนมัติ
- 📍 แสดงสถานะ InstallPath ของ Registry แบบ Real-time (อัปเดตทุก 1 วินาที)
- 🚀 ปุ่ม Import ให้ผู้ใช้กดเพื่อเพิ่มค่าลง Registry ได้ทันที
- 🛑 แจ้งเตือนหากผู้ใช้ยังไม่กด Generate ก่อน Import
- 🧹 ลบไฟล์ .reg เก่าก่อนสร้างใหม่ เพื่อป้องกันไฟล์ซ้ำ

---

## 📂 ไฟล์ที่สคริปต์สร้างขึ้น

เมื่อกดปุ่ม **Generate** โปรแกรมจะสร้างไฟล์:

| ไฟล์ | อธิบาย |
|------|----------|
| `sims-thai-fix-32bit.reg` | สำหรับ Windows ที่อ่าน Registry แบบ 32-bit |
| `sims-thai-fix-64bit.reg` | สำหรับ Windows ที่อ่าน Registry แบบ 64-bit (WOW6432Node) |

---

## 🧑‍💻 วิธีใช้งาน

1. **เปิดไฟล์ create-sims-reg.exe** เพื่อรันโปรแกรม  
2. **กดปุ่ม Browse** แล้วเลือกโฟลเดอร์ติดตั้งเกม The Sims 1 Complete Collection
3. กดปุ่ม **ขั้นตอนที่ 2 : Generate .reg** เพื่อสร้างไฟล์รีจิสทรี  
4. กด **ขั้นตอนที่ 3** หรือ **ขั้นตอนที่ 4** เพื่อ Import ลงระบบ (เลือกตามระบบ Windows ของคุณ)

> ⚠️ เมื่อกด Import จะมีหน้าต่าง Windows Registry Editor เด้งขึ้น ให้กด **Yes** ตามด้วย **OK**

---

## 🧠 การทำงานของสคริปต์

### 🔍 อ่านค่า Registry อัตโนมัติ

สคริปต์ใช้ `SetTimer` เช็คค่า InstallPath ทุก ๆ 1 วินาที  
และแสดงในช่อง **InstallPath (32-bit)** และ **InstallPath (64-bit)**

หากยังไม่มีค่าใน Registry จะแสดงข้อความ:
ยังไม่ได้ตั้งค่าตำแหน่งของเกม

### 🗂️ โครงสร้าง Registry ที่โปรแกรมเซ็ตให้

- SIMS_LANGUAGE = `Thai`
- Language (dword) = `041e`  *(Thai)*
- ติดตั้ง Expansion ครบ 1–8 เวอร์ชั่น CD/DVD
- ตั้งค่า SIMS_SOUND, SIMS_DATA, InstallPath ให้ตรงกับโฟลเดอร์เกม

---

## 🧩 ความต้องการของระบบ

- Windows XP / 7 / 8 / 10 / 11
- ควรรันด้วยสิทธิ์ Administrator หาก Import แล้วไม่เข้า

---

## 📜 เครดิต

พัฒนาเพื่อช่วยผู้เล่นเกม **The Sims 1 Complete Collection ภาษาไทย** ให้ติดตั้งง่ายขึ้น ลดขั้นตอนการแก้ Registry ด้วยตนเอง
โปรแกรมนี้พัฒนาโดยใช้ AutoHotkey 1.1.37

---

# 🛠️ The Sims 1: Complete Collection – Thai Registry Generator

This script was created to help users of **The Sims 1 Complete Collection (CD/DVD)** fix and configure Windows Registry entries to enable full Thai language support. It automatically sets the correct values for **InstallPath**, **SIMS_LANGUAGE**, and all Expansion Pack registry keys.  
The tool can generate `.reg` files for both **32-bit** and **64-bit** systems and includes a user-friendly GUI with one-click Import buttons.

---

## ✨ Features

- ✅ Browse and select your game installation folder
- 🔧 Automatically generate Registry files for **both 32-bit and 64-bit** Windows
- 📍 Real-time display of current Registry InstallPath values (updates every 1 second)
- 🚀 One-click Import buttons to apply the generated Registry entries instantly
- 🛑 Warns users if they attempt to Import before generating the .reg files
- 🧹 Removes old .reg files before generating new ones to prevent duplicates

---

## 📂 Files Generated by the Script

When the **Generate** button is pressed, the program creates the following files:

| File | Description |
|------|--------------|
| `sims-thai-fix-32bit.reg` | For Windows using 32-bit Registry paths |
| `sims-thai-fix-64bit.reg` | For Windows using 64-bit Registry (WOW6432Node) paths |

---

## 🧑‍💻 How to Use

1. **Run** `create-sims-reg.exe`  
2. Click **Browse** and select your *The Sims 1 Complete Collection* installation folder  
3. Press **Step 2: Generate .reg** to create the registry files  
4. Press **Step 3** or **Step 4** to Import the Registry entries (choose based on your Windows version)

> ⚠️ When you import, Windows will show a confirmation pop-up. Click **Yes**, then **OK** to proceed.

---

## 🧠 How the Script Works

### 🔍 Automatic Registry Detection

The script uses `SetTimer` to check the current InstallPath every 1 second and displays the values for:

- **InstallPath (32-bit)**
- **InstallPath (64-bit)**

If the Registry entries do not exist, the program will show the message:  
**Game path has not been set yet**

### 🗂️ Registry Values Configured

The following registry keys are set:

- `SIMS_LANGUAGE` = `Thai`
- `Language` (DWORD) = `041e` *(Thai)*
- Expansion Packs 1–8 set to “installed” (CD/DVD version)
- `SIMS_SOUND`, `SIMS_DATA`, and `InstallPath` values mapped to the selected installation folder

---

## 🧩 System Requirements

- Windows XP / 7 / 8 / 10 / 11  
- Administrator rights are recommended if Import does not apply correctly

---

## 📜 Credits

Developed to assist players of **The Sims 1 Complete Collection (Thai version)** by simplifying the Registry configuration process and removing the need for manual editing.  
This tool was built using **AutoHotkey 1.1.37**.
