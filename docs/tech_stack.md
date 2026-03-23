## TechStack

### Architecture

- MVVM에 기반한 Clean Architecture을 적용, MVI 기반으로 유저 액션을 처리

### Routing

- go_router

### Dependency Injection

- get_it

### State Management

- ListenableBuilder + ChangeNotifier

### Etc

- freezed
- build_runner

### Backend

- **Firebase (인증·부가 기능)**
  - Firebase Authentication (소셜 로그인, 토큰 발급 등)
  - FCM (푸시 알림)
  - Analytics
  - Crashlytics
- **Supabase (핵심 데이터 저장)**
  - PostgreSQL 기반 RDBMS
  - 예약, 업장, 자원, 리뷰 등 정합성이 필요한 본데이터 저장