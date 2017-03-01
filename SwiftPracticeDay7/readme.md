# 함수와 클로저 (Closure)

독립적으로 처리될 수 있는 것을 분리하여 구조화한 객체.

## 함수의 이점

* 동일 코드가 여러 번 실행될 때, 재작성이 필요가 없다.
* 기능 단위로 함수화하게 되면, 가독성이 좋아진다.
* 유지 보수 차원에서 이점이 있다.

## 함수의 정의

func 키워드를 사용하여 함수를 정의한다.

```swift
/*
func 함수명(매개변수) -> 반환타입 {
  // 함수 내용
}
*/

func funcExample(name: String, age: Int) -> String {
  var string = ""
  string += "Hello \(name) !"
  
  return string
}
```

## 함수의 호출

일반적으로 함수를 호출하듯이 정의된 함수를 호출하여 실행한다.

```swift
funcExample(name: "devhwi", age: 28)
```

함수 호출 시 사용하는 파라미터 이름과 함수 내부에서 사용하는 파라미터 이름을 다르게 하고 싶다면 다음과 같은 방법을 사용한다.

```swift
func funcExample(userName name: String, userAge age: Int) {
  print(name)
}

funcExample(userName: "devhwi", userAge: 28)
```

파라미터 이름을 _ (언더바)로 지정하면 함수 호출 시 이름을 생략할 수 있다.

```swift
func funcExample(_ name: String) {
  print(name)
}

funcExample("devhwi")

// 다른 언어에서 호출하는 방식과 비슷하다.
```

파라미터 기본값을 지정하면 호출 시 생략이 가능하다.

```swift
func funcExample(_ name: String, age: Int = 28) {
  print(name)
}

funcExample("devhwi")
```

```...```를 사용하면 개수가 정해지지 않은 파라미터를 받을 수 있다.

```swift
func funcExample(_ numbers: Int...) -> Int {
  var sum = 0
  for number in numbers {
    sum += number
  }
  
  return sum
}
```

함수 중첩이 가능하다.

```swift
func funcOuter(message: String) -> (String) -> String {
  func funcInner(name: String) -> String {
    return name + message
  }
  return hello
}

let hello = helloGenerator(message: "hello!")
hello("devhwi")
```

눈여겨 볼 점은 funcOuter 의 return type이 ```(String) -> String```이라는 점이다. funcOuter는 funcInner의 String 을 받아서 String으로 return 하는 함수라는 것이다.

같은 예시지만 중첩 내부에서 다수의 파라미터를 받아서 처리하는 경우이다.

```swift
func funcOuter(message: String) -> (String, String) -> String {
  func funcInner(firstName: String, lastName: String) -> String {
    return lastName + firstName + message
  }
  
  return funcInner
}
```

기존의 ```(String) -> String```에서 ```(String, String) -> String```으로 변화했다. 두 파라미터를 받아 최종적으로 하나로 처리한다는 뜻이다.

## 함수의 튜플 반환

함수는 여러 개의 값을 반환할 수 있다.

```swift
func getIndvInfo() -> (Int, String) {
  let height = 177
  let name = "devhwi"
  
  return (height, name)
}

var info = getIndvInfo()
info.0 // 177
info.1 // "devhwi"
```


# 클로저 (Closure)

함수를 좀 더 간결하게 짤 수 있게끔 도와주는 개념이다. 클로저는 ```{}```로 감싸여진 ***실행 가능한 코드블럭***이다.

위에서 살펴보았던 함수 중첩을 클로저를 사용하여 재구성한다면,

```swift
func funcOuter(message: String) -> (String, String) -> String {
  return { (firstName: String, lastName: String) -> String in
    return lastName + firstName + message
  }
}
```

일반적인 함수와는 다르게 함수명이 존재하지 않는다. 허나, 함수와 기능은 동일하게 수행이 가능하다. 파라미터를 받아 return 값을 뱉어낼 수 있다는 점에서 크게 다를 건 없지만, 모양이 다르다. 결국 클로저는 ***이름 없는 함수***라고 볼 수 있고, 함수는 ***이름 없는 클로저***라고 볼 수 있다.

클로저는 중괄호( ```{ }``` )로 감싸져 있고, 파라미터를 괄호로 감싸서 정의한다. 함수와 동일하게 ```->```로 return type을 정의할 수 있다. ```in``` 키워드는 파라미터, return type과 실제 클로저 코드를 분리하고 있다.

단순히 비주얼적으로 본다면 이걸 왜 쓰나 하는 생각이 들 수 있다.

사실 클로저의 장점은 *간결함*, *유연함*이다. 이제, 생략 가능한 요소들을 제거해보자.

```swift
func funcOuter(message: String) -> (String, String) -> String {
  return { firstName, lastName in
    return lastName + firstName + message
  }
}
```

매우 간결해졌다. 이미 funcOuter에서 정의한 중첩된 내부 함수의 타입이 선언이 되었으므로, 내부에서는 다시 한 번 타입을 정의해 줄 필요가 없는 것이다. return type 역시 마찬가지로 funcOuter에서 정의해주었기 때문에 생략된 것이다.

swift 클로저를 알게 되면서 더욱 놀라웠던 점은 여기서 더 생략이 가능하다는 것이다. 위 코드에서 더 생략한 결과이다.

```swift
func funcOuter(message: String) -> (String, String) -> String {
  return {
    return $1 + $0 + message
  }
}
```

이제서야 클로저를 쓰는 의미가 보인다. 타이핑해야 할 분량이 줄어들었다.

클로저는 변수처럼 정의가 가능하다.

```swift
let funcOuter: (String, String) -> String = { $1 + $0 + ", hello!" }

funcOuter("hwi", "dev")
```

옵셔널로도 정의가 가능하다.

```swift
let funcOuter: ((String, String) -> String)?

funcOuter?("hwi", "dev")
```

클로저를 변수로 정의하고 함수에서 return이 가능하듯이, 파라미터로 역시 받을 수 있다.

```swift
func closureExample(number: Int, using block: Int -> Int) -> Int {
  return block(number)
}

closureExample(number: 10, using: { (number: Int) -> Int in
  return number * 2
})

// 생략을 해보자.
closureExample(number: 10, using: {
  $0 * 2
})

// 함수의 마지막 파라미터가 클로저라면 괄호와 파라미터 이름까지 생략 가능하다.

closureExample(number: 10) {
  $0 * 2
}

// 이게 근데 유지보수 측면에서 다소 불편할 수도 있다고 생각한다.
```

### 클로저 활용하기

* sort()
* filter()
* map()
* reduce()

```swift
let numbers = [1, 3, 2, 6, 7, 5, 8, 4]

let sortedNumbers = numbers.sort { $0 < $1 }
print(sortedNumbers) // [1, 2, 3, 4, 5, 6, 7, 8]

let evens = numbers.filter { $0 % 2 == 0 }
print(evens) // [2, 6, 8, 4]

let arr1 = [1, 3, 6, 2, 7, 9]
let arr2 = arr1.map { $0 * 2 } // [2, 6, 12, 4, 14, 18]

arr1.reduce(0) { $0 + $1 } // 28

arr1.reduce(0, +) // 28
```