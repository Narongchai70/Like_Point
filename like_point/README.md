# like_point

LikePoint คือแอป Flutter ที่ช่วยให้ผู้เล่น League of Legends สามารถค้นหาข้อมูลผู้เล่น ดูประวัติการเล่น และติดตามผู้เล่นคนโปรดผ่าน Riot API

## ฟีเจอร์ (Features)
- ค้นหา Riot ID ได้ง่าย
- ติดตามผู้เล่นด้วยปุ่มดาว
- ดูโปรไฟล์, แรงค์ และประวัติแมตช์
- บันทึกภาพสถิติของผู้เล่น
- เชื่อม Firebase + Riot API
- ดูข้อมูลรายละเอียดแชมป์เปี้ยนได้ง่าย
- มี Darkmode

## Installation
Clone Repository
```https://github.com/Narongchai70/Like_Point.git  cd likepoint```

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
