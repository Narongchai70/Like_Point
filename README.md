# like_point

LikePoint คือแอป Flutter ที่ช่วยให้ผู้เล่น League of Legends สามารถค้นหาข้อมูลผู้เล่น ดูประวัติการเล่น และติดตามผู้เล่นคนโปรดผ่าน Riot API

## รายละเอียดโปรเจกต์ (Project Description)
ช่วยให้คุณติดตามผู้เล่น League of Legends ได้ง่าย โดย API Riot เน้นการใช้งาน Flutter ในการสร้าง UI และการเชื่อมต่อ API 

## ฟีเจอร์ (Features)
- ค้นหา Riot ID ได้ง่าย
- ติดตามผู้เล่นด้วยปุ่มดาว
- ดูโปรไฟล์, แรงค์ และประวัติแมตช์
- บันทึกภาพสถิติของผู้เล่น
- เชื่อม Firebase + Riot API
- ดูข้อมูลรายละเอียดแชมป์เปี้ยนได้ง่าย
- มี Darkmode

## วิธีติดตั้ง (Installation)
Clone Repository
```
https://github.com/Narongchai70/Like_Point.git
cd Like_Point
```
Install Dependencies
```
flutter pub get
```
Setup Firebase
- เปิด Firebase Console และสร้างโปรเจค
- ดาวน์โหลด google-services.json และ GoogleService-Info.plist ไปไว้ใน android/app ตามลำดับ

Run Project
```
flutter run
```
## Technologies Used (เทคโนโลยีที่ใช้)
GetX - State Management & Navigation

- Firebase - Authentication & Firestore
- Riot API - Game Data API
- Dio - HTTP Requests
- SharePlus - Image Sharing
- Gallery Saver - Image Saving
- Google Fonts - Custom Fonts

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
