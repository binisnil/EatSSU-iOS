# EatSSU-iOS
"숭실대에서 먹자!" 숭실대학교 학식 리뷰 iOS 앱


<br><br>


## Commit Type
`Setting` 프로젝트 세팅, 라이브러리 설치

`Feat` 새로운 기능 구현 (new feature)

`Add` 파일 추가

`fix` 버그 수정 (bug fix)

`docs` 문서 작성, 수정 (documentation)

`refactor` 코드 리팩토링 (refactoring)

`test` 테스트 코드, 리팩토링 테스트 코드 추가

`chore` 빌드 업무 수정, 패키지 매니저 수정, 파일 이동 및 이름 변경 등 (production code 변경이 없는 경우)


<br>

## **Issue Title**

```
[Commit Type] 이슈 제목
```


<br>
  
## **커밋 메세지 Description**

```
[Commit Type] 이슈번호 해당 커밋 요약
### Description
- [Setting] #1 Project Setting
- [Feat] #2 Add AlermBar
```

<br>


## **Code Convention**

### 1. 네이밍

- 함수, 메서드 : **lowerCamelCase** 사용하고, 동사로 시작한다.
- 변수, 상수 : **lowerCamelCase** 사용한다.
- 약어
    - 약어로 시작하는 경우: 소문자로 표기
    - 그 외의 경우에는 약어를 항상 대문자로 표기합니다
- 클래스, 구조체, enum, extension 등 : **UpperCamelCase** 사용한다.
    - enum의 각 case에는 **lowerCamelCase**를 사용

### 2. 임포트

- 모듈 임포트는 **알파벳 순으로 정렬**
- **내장 프레임워크를 먼저 임포트**하고, 빈 줄로 구분하여 서드파티 프레임워크를 임포트

### 3. 띄어쓰기, 들여쓰기, 공백

- MARK 주석 위와 아래에는 공백 필수
- 콜론(`:`)을 쓸 때에는 콜론의 오른쪽에만 공백 두기 (단, 삼항 연산자의 경우 콜론 앞뒤로 띄우기)
- `if let`, `guard let` 구문이 긴 경우에는 줄바꿈하고 한 칸 들여쓰기
- 콤마(`,`) 뒤에 공백 추가
- 연산자 앞뒤로 공백을 추가합니다.
- 화살표(`->`) 양쪽에 가독성을 위해 빈 공백을 추가합니다.
- `@objc`, `블럭 단위` 사이에는 줄바꿈을 추가합니다.

### 4. 주석

- `///` 를 사용해서 문서화에 사용되는 주석 남기기
- `// MARK:` 를 사용해서 연관된 코드를 구분짓기
