# 클래스와 구조체

구조체와 클래스는 하나의 큰 코드 블록이다. 안에 변수 또는 상수를 넣어 값을 정의하거나, 함수를 넣어서 기능을 정의할 수도 있다. 스위프트는 객체지향 언어이기 때문에 구조체와 클래스는 문법 상 중요한 요소 중 하나이다.

* 프로퍼티(Properties) : 구조체와 클래스 내부의 변수와 상수
* 메서드(Method) : 구조체와 클래스 내부에서 정의된 함수
* 멤버(Member) : 프로퍼티와 메소드를 합하여 구조체나 클래스의 멤버라고 한다.

### 구조체 vs 클래스

* 공통점
  * 프로퍼티
  * 메소드
  * 서브스크립트 : 속성값에 접근할 수 있는 방법을 제공
  * 초기화 블록 : 객체를 원하는 초기 상태로 설정
  * 확장 : 객체에 함수적 기능을 추가하는 확장(extends) 구문 사용
  * 프로토콜 : 특정 형식의 함수적 표준을 제공
* 클래스만 할 수 있는 기능
  * 상속 : 클래스의 특성을 다른 클래스에게 물려줄 수 있다.
  * 타입 캐스팅 : 실행 시 컴파일러가 클래스 인스턴스의 타입을 미리 파악하고 검사할 수 있다.
  * 소멸화 구문 : 인스턴스가 소멸되기 직전에 처리해야 할 구문을 미리 등록할 수 있다.
  * 참조에 의한 전달 : 클래스 인스턴스가 전달될 때에는 참조 형식으로 제공되며, 이 때 참조가 가능한 개수는 제약이 없다.

## 기본 개념

### 정의

구조체와 클래스의 이름은 대문자로 시작한다. 명명 규칙에 따르도록 하자.

```swift
// 구조체
struct 구조체 이름 {
  // 정의 내용
}

// 클래스
class 클래스 이름 {
  // 정의 내용
}
```

### 메소드와 프로퍼티

선언된 값에 따라 타입 선언이 가능하다.

```swift
struct Resolution {
  var width = 0
  var height = 0
  
  func desc() -> String {
    return "Resolution 구조체"
  }
}

class VideoMode {
  var interlaced = false
  var frameRate = 0.0
  var name : String?
}
```

### 인스턴스

클래스와 구조체를 생성한 후 여러 개를 찍어내듯이 만들고 할당할 수 있다. 이 찍어낸 복사본과 같은 개념을 인스턴스라고 한다. 같은 건물의 설계도를 가지고 여러 개의 건물을 세우는 것과 유사한 방식이라고 보면 되겠다.

```swift
let g = guJoChae()

let c = makeClass()
```

```. (dot)```을 이용하여클래스와 구조체 내의 프로퍼티에 접근할 수 있다. 예를 들어 ```g.name```, ```c.width```와 같이 말이다. 

### 초기화

구조체나 클래스 뒤에 빈괄호를 붙이면 기본적인 인스턴스가 만들어진다. 때로는 파라미터를 괄호 속에 넣어주기도 하는데, 이를 초기화(Initialize)하기 위해 반드시 필요한 값들입니다.

구조체나 클래스를 초기화할 때는 매개변수의 값 역시 초기화가 필요하다.

```swift
let initTest = testMethod(a: 1, b: 2)
```

### 구조체의 값 전달 방식: 복사에 의한 전달

구조체와 클래스의 차이는 값 전달 방식이다. 구조체는 인스턴스를 생성한 후 이를 변수나 상수에 할당하거나 함수의 인자값으로 전달할 때 값을 복사하여 전달하는 방식이다. 이를 **값 타입(Value Type)**, 또는 **복사에 의한 전달**이라고 한다. 앞서 자료형은 모두 복사를 통해 값이 전달된다고 언급한 적이 있는데, 이는 자료형 자체가 실제로는 구조체로 구현되었기 때문이다.

구조체 인스턴스는 변수에 대입 시, 복사한 값으로 대입되는 것이다. 그러므로 기존 인스턴스와 대입된 인스턴스는 독립적이다. 한 쪽에서 변경이 되어도 다른 쪽에 영향을 주지 않는다.

### 클래스의 값 전달 방식 : 참조에 의한 전달

메모리 주소를 사용하여 객체 자체를 전달한다. 따로 주소값을 전달할 필요 없이, 객체 주소값만 넘긴다면, 자유롭게 사용이 가능하다. 클래스 초기화와 동시에 프로퍼티를 사용하는 것이 가능하다.

> 인스턴스 비교 연산자

```swift
// === : 동일 인스턴스인지 비교
// !== : 다른 인스턴스인지 비교
```

일반적으로 다음 조건에 하나 이상 해당한다면 구조체 사용을 권장한다.

1. 서로 연관된 몇 개의 기본 데이터 타입들을 캡슐화하여 묶는 것이 목적일 때
2. 캡슐화된 데이터에 상속이 필요하지 않을 때
3. 캡슐화된 데이터를 전달하거나 할당하는 과정에서 참조 방식보다는 값이 복사되는 것이 합리적일 때
4. 캡슐화된 원본 데이터를 보존해야 할 때
