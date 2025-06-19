# 📱 앱 테스트 화면 확인 방법

본 프로젝트는 Android 및 iOS 환경에서 테스트할 수 있으며, 테스트 화면을 확인하기 위한 절차는 아래와 같습니다.

---

## ✅ Android 환경에서 앱 테스트 (Android Studio)

### 1. Android Studio 설치
- 공식 사이트에서 Android Studio 다운로드 및 설치  
  👉 [https://developer.android.com/studio](https://developer.android.com/studio)

### 2. 프로젝트 열기
- Android Studio 실행 후 `Open` 클릭
- 본 프로젝트 디렉토리를 선택하여 열기

### 3. 에뮬레이터 설정 및 실행
- 메뉴에서 `Tools > Device Manager` 클릭
- `Create Device` 선택 → 원하는 디바이스 선택 (예: Pixel 6)
- 시스템 이미지 다운로드 및 설치 → Finish
- 생성된 디바이스 우측의 ▶️ 버튼 클릭 → 에뮬레이터 실행

### 4. 앱 실행
- Android Studio 상단의 ▶️ (Run) 버튼 클릭
- 에뮬레이터 또는 실제 기기를 선택하여 앱 실행
- 앱이 자동으로 빌드되어 실행됨

### 5. 실제 Android 기기에서 테스트 (선택 사항)
- Android 기기를 USB로 연결
- 기기에서 `설정 > 개발자 옵션 > USB 디버깅` 활성화
- Android Studio에서 연결된 기기를 선택 후 ▶️ 실행

---

## 🍎 iOS 환경에서 앱 테스트 (macOS + Xcode)

> ⚠️ iOS 테스트는 **macOS 환경**에서만 가능합니다.

### 1. Xcode 설치
- App Store 또는 공식 사이트에서 Xcode 설치  
  👉 [https://developer.apple.com/xcode/](https://developer.apple.com/xcode/)
---
### 2. CocoaPods 설치 (필요 시)

- sudo gem install cocoapods
- pod install

---

### 3. 프로젝트 열기
- .xcworkspace 파일을 더블 클릭하여 Xcode에서 프로젝트 열기

---
### 4. 시뮬레이터 실행 및 앱 빌드
- Xcode 상단에서 실행할 디바이스 선택 (예: iPhone 14 Pro)

---
- ▶️ (Run) 버튼 클릭 → 앱이 선택한 시뮬레이터에서 실행됨
- 앱 실행 후 테스트 화면을 확인할 수 있음

---
### 5. 실제 iOS 기기에서 테스트 (선택 사항)
- iPhone을 Mac에 USB로 연결
- 연결된 기기를 Xcode에서 신뢰하고 디바이스로 선택
- ▶️ 버튼 클릭 → 실제 iOS 기기에서 앱 실행됨