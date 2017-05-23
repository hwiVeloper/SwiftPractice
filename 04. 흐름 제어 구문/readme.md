# 흐름 제어 구문
> 반복문 (Loop Statements<br>
> 조건문 (Conditional Statements)<br>
> 제어 전달문 (Control Transfer Statements)

## 반복문
### for ~ in 구문

```swift
for <루프 상수> in <순회 대상> {
	// 실행할 내용
}

for row in 1...5 {
	print(row)
}

for row in 1...9 {
	print("2 X \(row) = \(row * 2)")
}
```
* 순회 대상으로 사용할 수 있는 타입
	* 배열
	* 딕셔너리
	* 집합
	* 범위 데이터
	* 문자열
* 순회 대상의 값들이 루프 상수에 저장되어 쓰인다.

```swift
var chars = "swift"
for char in chars.characters {
	print("개별 문자는 \(char)입니다.")
}
```

> 루프 상수의 생략

```swift
let size = 5
let padChar = "0"
var keyword = "3"

for _ in 1...size {
	keyword = padChar + keyword
}

print("\(keyword)")
```
순회 시 대상 아이템이 필요하지 않은 경우에 생략 가능하다.

> 중첩을 활용한 구구단 코드

```swift
for i in 1..<10 {
	for j in 1..<10 {
		print("\(i) X \(j) = \(i * j)")
	}
}
```

### while 구문
> 실행 횟수가 명확하지 않을 때<br>
> 직접 실행해보기 전까지는 실행 횟수를 결코 알 수 없을 때<br>
> 실행 횟수를 기반으로 할 수 없는 조건일 때

```swift
while <조건식> {
	<실행할 구문>
}
// 조건식이 true 일 시, 무한 반복
```

### repeat ~ while 구문
다른 언어의 do ~ while 과 같은 구문이다.

```swift
repeat {
	<실행할 구문>
}
while <조건식>
```


## 조건문
> if<br>
> guard<br>
> switch

### if 구문
다른 언어에서의 if와 동일하게 사용된다.

```swift
if <조건식> {
	<실행할 구문>
}
```

> if ~ else <br>
> if 중첩 <br>
> if ~ else if ~ else

### guard 구문
표현식의 결과가 참인지 거짓인지에 따라 구문의 실행 여부를 결정한다.<br>
if와의 차이점은 참일 때의 실행 구문이 없다는 것이다.

```swift
guard <조건식 또는 표현식> else {
	<조건식 또는 표현식의 결과가 false일 때 실행될 코드>
}
```

### #available 구문
```swift
if #available(<플랫폼이름 버전>, <...>, <*>) {
	<해당 버전에서 사용할 수 있는 API 구문>
} else {
	<API를 사용할 수 없는 환경에 대한 처리>
}
```

호출 연산자()를 통해 플랫폼 이름과 버전 등의 인자값을 입력할 수 있다.

API 버전에 따라 처리하는 구문을 구별해준다.

> 사용할 만한 플랫폼

* 아이폰, 아이패드 등 터치 기반 스마트 기기에 사용되는 iOS
* 맥 컴퓨터에 사용되는 OSX
* 애플 시계에 사용되는 watchOS
* 애플 TV에 사용되는 tvOS

```swift
if #available (iOS 9, OSX 10.10, watchOS 1, *) {
	// iOS 9용 API 구문 또는 OS X 10.10용 API 구문, watchOS 1용 API 구문
} else {
	// API를 사용하지 못했을 때에 대한 실패 처리
}
```

### switch 구문
```swift
switch <비교 대상> {
	case <비교 패턴1> :
		<비교 패턴1이 일치했을 때 실행할 구문>
	case <비교 패턴2>, <비교 패턴3> :
		<비교 패턴2 또는 3이 일치했을 때 실행할 구문>
	default :
		<어느 비교 패턴과도 일치하지 않았을 때>
}
```

## 제어 전달문
한 부분에서 다른 부분으로 제어 흐름을 전달하여 코드 실행 순서를 변경해준다.

> break
> continue
> fallthrough
> return