# 열거형과 익스텐션

* **열거형** : 문자열이나 정수를 직접 입력받아야 할 정보들을 선택할 수 있도록 만들어주어서, 값의 범위를 제한하고 무작위로 값이 입력되는 것을 방지하여 코드의 안정성을 높여주는 역할을 한다. 이를 통해 입력값의 오류를 줄이는 것이 가능하다.
* **익스텐션** : 기존 객체를 수정없이 기능 추가하는 것을 제공한다. 생산성을 높여주는 강력한 도구이다.

## 열거형

열거형(Enumeration)에서 데이터는 객체 정의 시점에 함께 정의된다. 삭제나 변경이 불가능하다. 수정 방법은 단 한 가지, 구문의 직접 수정 뿐이다. 열겨형 데이터들은 타입으로 사용할 수 있고, 컴파일러가 미리 인지할 수 있다.

다음과 같은 경우는 열거형을 사용하는 것을 권장한다.

* 원치 않는 값이 잘못 입력되는 것을 막고 싶을 때
* 입력받을 값을 미리 특정할 수 있을 때
* 제한된 값 중에서만 선택하는 것을 유도하고 싶을 때(약간의 강제성)

성별, 국가, 지역, 직급, 색상, 방향 등이 이에 해당한다.

### 열거형의 정의

열거형 객체 정의는 `enum` 키워드를 사용한다.

```swift
enum 열거형 이름 {
	// 열거형 멤버 정의
	case 멤버값 1
	case 멤버값 2
	case ......
}
```

열거형 이름은 소문자로 작성하지만 *첫 글자만 대문자로*(카멜 표기법 - CamelCasing), 그리고 *단어마다 첫 글자는 대문자로* 작성한다.

```swift
enum Gender {
	case man
	case woman
}

// enum 사용법
let m = Gender.man
let w = Gender.woman
```

열거형 사용은 위 예시 말고도 여러 가지 방법이 있다.

```swift
var m1 = Gender.man
var m2 : Gender = Gender.man
var m3 = .man
var m4 : Gender = .man
```

> 열거형은 switch 구문에 활용이 가능하다 ?

```swift
switch m1 {
	case Gender.man :
		// something
	case Gendar.woman :
		// something
}
```

### 멤버와 값 분리

http 코드와 같은 값은 코드만 보고 의미를 파악하기 어려운 경우가 있다. 이러한 경우는 코드를 멤버와 값으로 나누는 방법이 있다.

```swift
enum HTTPCode : Int {
	case OK = 200
	case NOT_MODIFY = 304
	case INCORRECT_PAGE = 404
	case SERVER_ERROR = 500
}

// 사용할 때는 rawValue를 활용한다.
HTTPCode.OK.rawValue // 200
HTTPCode.NOT_MODIFY.rawValue // 304
HTTPCode.INCORRECT_PAGE.rawValue // 404
HTTPCode.SERVER_ERROR.rawValue // 500
```

열거형 객체의 멤버와 값은 선언할 때 정의되지만, 사용 시에 멤버에 보조 값을 설정할 수 있다. 이를 Associated Values(연관된 값)이라고 한다.

```swift
enum ImageFormat {
	case JPEG
	case PNG(Bool)
	case GIF(Int, Bool)
}

var image = ImageFormat.PNG(true)
	imgae = .GIF(256, false)
```

열거형은 클래스나 구조체처럼 내부에 연산 프로퍼티와 메소드 또한 정의가 가능하다. 인스턴스를 만들 수는 없지만, 인스턴스처럼 사용할 수 있어서 인스턴스 프로퍼티, 타입 프로퍼티, 메소드를 모두 정의할 수 있다.

```swift
enum httpCode : Int {
	case OK = 200
	case NOT_MODIFY = 304
	case INCORRECT_PAGE = 404
	case SERVER_ERROR = 500
	
	var value : String {
		return "httpCode is \(self.rawValue)"
	}
	
	func getDescription() -> String {
		switch self {
			case .OK :
				return "\(self.rawValue)"
			case .NOT_MODIFY :
				return "\(self.rawValue)"
			case .INCORRECT_PAGE :
				return "\(self.rawValue)"
			case .SERVER_ERROR :
				return "\(self.rawValue)"
		}
	}
	
	static func getName() -> String {
		return "httpCode"
	}
}

var res = httpCode.OK
	res = .NOT_MODIFY
res.value // 304
res.getDescription()

httpCode.getName()
```

### 열거형의 활용

열거형은 추후 나오는 코코아터치 프레임워크에서 자주 쓰이는 객체이다. 메소드 호출 옵션이나 스타일을 설정할 때 열거형으로 미리 정의해 둔 멤버들을 속성값으로 사용하는 경우가 많다.

```swift
enum UIImagePickerControllerSourceType : Int {
	case photoLibrary
	case camera
	case savedPhotosAlbum
}
```

위 소스는 이미지 피커 컨트롤러에서 이미지를 어디서 가져올 것인가를 결정하는 열거형 객체이다. 만약에 이것을 열거형이 아닌 다른 것으로 정의한다면 외부에서 수정이 가능할 것이다. 가변적인 성격을 띄는 것이 아니므로 열거형으로 해야 옳다.

이처럼 지정된 값만 허용되게 할 때는 열거형 객체를 이용하는 것이다. 적절한 경우에 열거형을 적극 활용하도록 하자.

## 익스텐션

익스텐션은 `확장 구문`이라고 번역된다. 