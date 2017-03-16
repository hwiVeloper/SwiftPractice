# 옵셔널 (잠재적 오류를 다루다)

옵셔널(Optional)은 스위프트에 도입된 새로운 개념이다. 프로그램의 안정성을 높이기 위해 사용되는 것이다. **성공적인 결과를 보장하지 못할 경우**에 옵셔널 타입이라는 객체를 감싼 후 반환하는 개념이다. (Optional Wrapping)

```swift
Int(바꿀 문자열)

let num = Int("123")
// 이 경우는 변환이 가능하다.
```

그러나 숫자로 바꿀 수 없는 경우는 퍽 난감하다.

```swift
let num = Int("Swift")
```

다른 언어와 달리 스위프트는 앱이 중간에 꺼져버리거나 다른 예기치 못한 오류를 범할 수 있기 때문에 오류를 지양하고 어떠한 값이든 return하려고 노력한다.

그러나 0도, 다른 어떤 값도 return하기는 다소 부담이 있다. 그렇기 때문에 Null, 스위프트에서는 nil을 반환한다. 값이 없음을 의미한다.

```swift
let num = Int("Swift") // nil을 반환한다.
```

단, 안정성 보장을 위해 nil의 사용에 제약을 걸어두었다. nil은 자료형을 가질 수 없기 때문에 문자열이나 숫자에 억지로 대입할 순 없다.

결국 옵셔널이 가질 수 있는 값은 두 가지이다.

* nil이 아닌 정상적인 값
* nil

알아서 해주니까 편하다고 모든 값을 옵셔널 처리하면 또 다른 문제가 생기기 때문에 필요한 곳에만 사용한다. nil에 대한 처리를 일일이 해줘야 하는 복잡함이 생긴다.

### 옵셔널 타입의 선언과 정의
```swift
// 옵셔널 Int 타입
var optInt : Int?

// 옵셔널 String 타입
var optStr : String?

// 옵셔널 Double 타입
var optDouble : Double?

// 옵셔널 Array 타입
var optArr : [String]?

// 옵셔널 Dictionary 타입
var optDic1 : Dictionary<String, String>?
var optDic2 : [String : String]?

// 옵셔널 Class 타입
var optClass : AnyObject?

/**
 * 선언한 후에는 자유롭게 값을 대입할 수 있다.
 */
```

> 주의할 점

* 옵셔널 타입은 결합 연산 또는 더하기 연산이 가능한 데이터 타입이 아니다.
* Int?와 Int는 서로 다른 타입이므로 연산이 불가능하다.

## 옵셔널 사용하기
옵셔널 값을 사용하기 위해서는 옵셔널을 해제하는 것이 우선이다. 해제 방식은 **명시적 해제**와 **묵시적 해제**로 나뉜다.

* 명시적 해제
  * 강제적 해제
  * 비강제적 해제
* 묵시적 해제
  * 컴파일러에 의한 자동 해제
  * ! 연산자를 이용한 자동 해제

### 옵셔널 강제 해제
옵셔널 타입의 변수나 상수 뒤에 !만 붙이면 된다.

```swift
Int("123")! + Int("123")! // 246
Int("123")! + 30 // 153
```

그렇다면 옵셔널 결과가 nil인데도 불구하고 ! 연산자를 붙인다면? 이건 좀 말이 안된다. 그 경우를 대비하여 값이 nil인지 체크 후에 다음 로직을 실행해야 한다.

다소 재밌는 부분은, 옵셔널 뒤에 비교 연산자 != 를 사용할 시에, 의무적으로 공백 한 칸이 있어야 오류가 나지 않는다.

```swift
intFromstr != nil // Good
intFromstr!=nil   // Bad
```

딕셔너리의 옵셔널 역시 ! 연산자를 이용하여 해제한다.

### 옵셔널 바인딩
비강제 해제 구문으로 바꾸어 작성 역시 가능하다. 비강제 해제 구문은 if 구문 내에서 조건식 대신 옵셔널 타입의 값을 일반 타입의 변수나 상수에 할당하는 구문을 사용하는 방식으로, 옵셔널 바인딩(Optional Binding)이라고 한다.

옵셔널 바인딩은 일반 상수에 옵셔널 값을 대입하여 결과가 true/false를 반환하도록 만드는데, 이를 체크하는 방식이다.

```swift
var str = "Swift"
if let intFromStr = Int(str) { // 이 부분이 중요하다.
	print("값이 변환되었다. 변환된 값은 \(intFromStr)")
} else {
	print("변환실패")
}
```

guard 구문을 이용하여 옵셔널 바인딩을 구현할 수 있다. guard 구문은 메서드에서 사용 가능하여 메서드를 정의 후 구문을 작성한다. 앞으로 앱의 대부분이 메서드로 이루어지기 때문에 이는 눈여겨 볼 필요가 있다.

```swift
func intStr(str:String) {
	guard let intFromStr = Int(str) else {
		print("값 변환 실패!")
		return
	}
	
	print("값이 변환되었다. 변환된 값은 \(intFromStr)")
}
```

### 컴파일러에 의한 옵셔널 자동 해제
컴파일러에서 자동으로 옵셔널을 해제하는 경우도 존재한다.

```swift
let optInt = Int("123")

if(optInt == 123) {
	print("optInt == 123")
} else {
	print("optInt != 123")
}
```

else 영역이 실행될 것으로 예상되지만, 실제로 optInt == 123 이 print된다. 앞서 살펴본 것과 딴 얘기다.

굳이 강제로 해제하지 않아도 무방할 경우가 존재한다. 비교 연산자를 사용할 때가 그 경우이다.

```swift
let tempInt = Int("12345")

tempInt  == 123           //true
tempInt  == Optional(123) //true
tempInt! == 123           //true
tempInt! == Optional(123) //true
```

### 옵셔널의 묵시적 해제
앞서 굳이 ! 연산자를 사용하지 않고 해제하는 경우를 보았다.(컴파일러가 해결해 주는 경우였다.) 이와 비슷하지만, 묵시적 해제는 옵셔널 변수를 사용하는 모든 경우에 적용할 수 있고, 옵셔널 변수의 타입을 선언할 때 묵시적 해제를 미리 선언해 주어야 한다는 차이점이 있다.

```swift
// 묵시적 옵셔널 선언
var str : String! = "Swift"
print(str)

// 결과 : Swift
```

타입 어노테이션 뒤에 연산자 하나로 결과가 달라진다.

묵시적 옵셔널을 사용하면 옵셔널 타입 변수의 연산을 처리할 수 있다.

```swift
var value01 : Int? = 10
value01 + 5 // Error

var value02 : Int! = 10
value02 + 5 // 15
```

일반적으로는 옵셔널 타입의 연산은 오류이지만, 묵시적 해제를 선언한 옵셔널 타입은 아니다. 묵시적 옵셔널 해제를 사용하는 경우는 '형식상 옵셔널로 정의해야 하지만, 실제로 사용할 때는 절대 nil 값이 대입될 가능성이 없을 변수에.'

묵시적 옵셔널은 클래스나 구조체에서다. 주로 멤버 변수를 정의할 때 선언과 초기화를 분리시켜야 하는 경우에 대항한다.(아직은 자세히 알 필요는 없다.)

옵셔널은 까다롭고 귀찮은 개념일 수도 있지만, 옵셔널의 강점은 안전성과 코드 간결성이다. 다음 예시를 통해 보고 마무리하겠다.

```Objective-C
/* Objective-C */
if (myDelegate != nil) {
	if([myDelegate respondsToSelector:@selector(scrollViewDidScroll:)] {
		[myDelegate scrollViewDidScroll:myScrollView];
	}
}
```

```swift
/* Swift */
myDelegate?.scrollViewDidScroll?(myScrollView)
```