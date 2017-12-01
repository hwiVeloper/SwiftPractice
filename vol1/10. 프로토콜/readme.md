# 프로토콜 : 객체의 설계도

클래스나 구조체가 어떤 기준을 만족하거나 특수한 목적을 다성하기 위해 구현해야 하는 메소드와 프로퍼티의 목록이다. 자바의 인터페이스와 비슷한 개념이다. (이렇게 이해하니 쉬운 개념으로 와닿았다.)

각 이벤트를 관리하기 위해 대리자(delegate)를 지정하여 이벤트 처리를 위임하고, 실제 이벤트 발생 시, 지정된 대리자가 콜백 메소드를 호출해주는 델리게이트 패턴(Delegate Pattern)을 많이 사용하는데, 이 때 사용되는 것이 바로 프토콜이다.

기능에 대한 명세가 적혀 있어서 프로토콜 코드를 보면 어떤 기능을 어떻게 구현해야 하는지를 알 수 있다.

프토콜은 부모 클래스는 아니다. 프로토콜은 대상 클래스 전체를 책임지지 않으며, 일부 기능의 형식을 담당한다.

## 프로토콜의 정의

`protocol` 키워드를 사용한다.

```swift
protocol protocolName {
	<구현해야할 프로퍼티 명세 1>
	<구현해야할 프로퍼티 명세 2>
	<구현해야할 프로퍼티 명세 3>
	
	<구현해야할 메소드 명세 1  >
	<구현해야할 메소드 명세 2  >
	<구현해야할 메소드 명세 3  >
}

// 구조체, 클래스, 열거형, 익스텐션을 프로토콜로 구현할 수 있다.
```

### 프로토콜 프로퍼티

프로토콜에 선언되는 프로퍼티에는 초기값을 할당할 수 없다. 프로퍼티 종류 또한 구분하지 않는다. 프로퍼티의 종류, 이름, 변수/상수 구분, 타입, 읽기/쓰기 가능 여부를 정의한다.

```swift
protocol SomePropertyProtocol {
	var name : String { get set } // 읽고 쓰기 가능
	var descriptioin : String { get } // 읽ㄱ ㅣ가능
}

// 구현
struct RubyMember : SomePropertyProtocol {
	var name = "아모개"
	var description : String {
		return "Name : \(self.name)"
	}
}
```

### 프로토콜 메소드

```swift
protocol SomeMethodProtocol {
	func run(command : String)
	func showResult(param : Int) -> String
}

// 구현
struct RubyService : SomeMethodProtocol {
	func run(command : String) {
		if command == "start" {
			print("시작")
		}
	}
	
	func showResult(param : Int) -> String {
		return "Result : \(param)"
	}
}
```

#### mutating, static 사용

구조체 내 메소드가 프롶티를 변경하는 경우, 메소드 앞에 반드시 `mutating` 키워드를 붙여 **이 메소드가 프로퍼티 값을 수정하는 메소드임**을 표시하도록 강제한다. 메소드가 만약 프로토콜에서 선언된 메소드라면 반드시 프로토콜에 mutating 키워드가 추가되어 있어야 한다.

클래스와 같은 참조 타입은 mutating 키워드 없이 자유롭게 메소드 내의 프로퍼티를 수정할 수 있지만, 구조체나 열거형은 프로토콜의 메소드에 mutating 키워드가 추가되어 있지 않을 경우 프로퍼티 값을 변경할 수 없다. 억지로 키워드를 붙인다면 오류가 날 것이다.

보통 mutating 키워드가 붙지 않는 경우는 다음과 같은 경위다.

* 구조체나 열거형 등 값 타입의 객체에서 내부 프로퍼티의 값을 변경하기 원치 않을 때
* 주로 클래스를 대상으로 간주하고 작성된 프로토콜일 때

### 프로토콜의 초기화 메소드

일반적인 메소드와 비슷하게 초기화하는 것이 가능하다. 실행블록 없이 이름과 매개변수 등을 작성한다.

```swift
protocol initProtocol {
	init()
	init(cmd : String)
}
```

초기화 메소드 작성 시 유의사항은 외부매개변수명까지는 완전히 일치해야 한다는 점이다. 임의로 변경 시 프로토콜을 제대로 구현하지 않은 것으로 간주된다. 그리고 클래스에서 초기화 메소드를 구현할 때는 `required` 키워드를 붙여야 한다.

* 구현되는 초기화 메소드의 이름과 매개변수명은 프로토콜의 명세에 작성된 것과 완전히 일치해야 한다.
* 프로토콜 명세에 선언된 초기화 메소드는 그것이 기본 제공되는 초기화 메소드여도 직접 구현해야 한다.
* 클래스에서 초기화 메소드를 구현할 때는 `required` 키워드를 붙여야 한다.

또다른 예시를 살펴보겠다.

```swift
//initProtocol은 위에서 보았던 프로토콜에서 참조한 것이다.

struct SInit : initProtocol {
	var cmd : String
	
	init() {
		self..cmd = "start"
	}
	
	init(cmd : String) {
		self.cmd = cmd
	}
}

class CInit : initProtocol {
	var cmd : String
	
	required init() {
		self.cmd = "start"
	}
	
	required init(cmd : String) {
		self.cmd = cmd
	}
}
```

## 타입으로서의 프로토콜

때로는 프로토콜이 타입으로서의 역할을 할 때도 있다. 마치 프로토콜을 상위 클래스 타입으로 간주하여 사용하는 것과 유사하다.

* 상수나 변수, 그리고 프로퍼티의 타입으로 사용할 수 있음
* 함수, 메소드 또는 초기화 구문에서 매개변수 타입이나 반환 타입으로 프로토콜을 사용할 수 있음
* 배열이나 사전, 혹은 다른 컨테이너의 타입으로 사용할 수 있음

```swift
protocol Wheel {
	func spin()
	func hold()
}

class Bicycle : Wheel {
	var moveState = false
	
	func spin() {
		self.pedal()
	}
	
	func hold() {
		self.pullBreak()
	}
	
	func pedal() {
		self.moveState = true
	}
	
	func pullBreak() {
		self.moveState = false
	}
}
```

일반적인 경우 Bicycle 클래스는 다음과 같이 초기화된다.

```swift
let trans = Bicycle()

trans.moveState
trans.spin()
...
```

> let trans : Wheel = Bicycle()

이 경우는 trans가 사용할 수 있는 프로퍼티와 메소드에 제한이 생긴다.

> trans.spin()
> trans.hold()

기존에 Wheel이라는 프로토콜에 존재하던 메소드만 사용이 가능하게 된다.

