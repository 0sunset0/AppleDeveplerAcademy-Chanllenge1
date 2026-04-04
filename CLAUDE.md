# challenge1 프로젝트

## 프로젝트 개요

SwiftUI 기반 챌린지 인증 앱. 사용자가 동물 캐릭터를 선택하고, 일일 챌린지를 완료한 후 사진으로 인증하는 앱.

## 아키텍처

- **상태 관리**: SwiftData를 제거하고 `@Observable` 클래스(`ChallengeStore`)로 전환
- **의존성 주입**: `ChallengeStore`를 `challenge1App`에서 생성 후 `.environment(store)`로 전달
- **뷰에서 접근**: `@Environment(ChallengeStore.self) private var store`

```
challenge1App
└── ContentView
    ├── OnboardingView  (hasSeenOnboarding == false)
    └── HomeView        (hasSeenOnboarding == true)
        ├── TodayActivityView → ChallengeCertificationButton → ActivityCertificationView
        ├── CharacterView
        ├── StickerView
        └── CalendarView → ActivityDetailCard
```

## 디렉토리 구조

```
challenge1/
├── Models/           # 순수 struct (Animal, Challenge, CompletedActivity, Sticker)
├── Stores/           # ChallengeStore (@Observable)
└── Views/
    ├── home/
    ├── onboarding/
    ├── certification/
    └── calendar/
```

## 핵심 규칙

- 모델은 **순수 struct** + `UUID` id 사용. `@Model`(SwiftData) 금지
- 전역 상태는 `ChallengeStore`에만 추가. 뷰 로컬 상태는 `@State`
- `profileAnimal`은 `UserDefaults`에 `String?`(UUID string)으로 저장 (`@AppStorage("profileAnimal")`)
- Preview에는 반드시 `.environment(ChallengeStore())` 추가

## 주요 데이터 흐름

1. 온보딩 → 동물 선택 → `profileAnimal`(UUID string) UserDefaults 저장
2. 홈 → `store.challenges.first` 로 오늘 챌린지 표시
3. 인증 버튼 → `ActivityCertificationView(challenge:)` fullScreenCover
4. 인증 완료 → `store.complete(challenge:imageName:)` 호출 → `completedActivities` 추가
5. 캘린더 → `store.completedActivities`를 날짜 필터링해서 표시
