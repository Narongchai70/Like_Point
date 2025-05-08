# like_point

LikePoint คือแอป Flutter ที่ช่วยให้ผู้เล่น League of Legends สามารถค้นหาข้อมูลผู้เล่น ดูประวัติการเล่น และติดตามผู้เล่นคนโปรดผ่าน Riot API

##ฟีเจอร์ (Features)
- ค้นหา Riot ID ได้ง่าย
- ติดตามผู้เล่นด้วยปุ่มดาว
- ดูโปรไฟล์, แรงค์ และประวัติแมตช์
- บันทึกภาพสถิติของผู้เล่น
- เชื่อม Firebase + Riot API
- ดูข้อมูลรายละเอียดแชมป์เปี้ยนได้ง่าย
- มี Darkmode

## โครงสร้างโปรเจกต์ (Project Structure)
```
├── app/
│   ├── data/
│   │   ├── model/
│   │   ├── providers/
│   │   └── repositories/
│   └── ui/
│       ├── modules/
│       │   ├── champion/
│       │   ├── current_password/
│       │   ├── followed/
│       │   ├── home/
│       │   ├── login/
│       │   ├── profile/
│       │   ├── register/
│       │   ├── settings/
│       │   └── summoner/
│       └── widget/
│           ├── appbar/
│           ├── champion/
│           ├── home/
│           ├── match/
│           ├── navbar_service/
│           ├── register/
│           ├── setting/
│           └── summoner/
├── app_binding.dart
├── main.dart
```
This project is a starting point for a Flutter application.


A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
