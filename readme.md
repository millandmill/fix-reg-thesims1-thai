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

- Windows 7 / 8 / 10 / 11
- ควรรันด้วยสิทธิ์ Administrator หาก Import แล้วไม่เข้า

---

## 📜 เครดิต

พัฒนาเพื่อช่วยผู้เล่นเกม **The Sims 1 Complete Collection ภาษาไทย** ให้ติดตั้งง่ายขึ้น ลดขั้นตอนการแก้ Registry ด้วยตนเอง

---
