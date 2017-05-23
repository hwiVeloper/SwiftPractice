# 집단 자료형
> 배열 : 일련번호로 구분되는 순서에 따라 데이터가 정렬된 목록 형태의 자료형 <br>
> 집합 : 중복되지 않은 유일 데이터들이 모인 집합 형태의 자료형 <br>
> 튜플 : 종류에 상관없이 데이터들을 모은 자료형. 수정 및 삭제 불가능 <br>
> 딕셔너리 : 배열과 유사. 일련번호 대신 키를 사용하여 키-값으로 연관된 데이터들이 순서 없이 모인 자료형


튜플 외에는 모든 데이터의 타입이 동일해야 한다. 여러 타입 섞어쓰기가 불가하다.

## 배열
* 순서를 가지는 리스트 형식의 값을 저장하는 데 사용된다.
* 다른 언어의 배열과 사용법은 같다.
* 저장하는 값의 타입이 모두 같아야 한다.
* 선언 시 배열에 저장할 값 타입을 정의해야 한다.
* 배열의 크기는 동적으로 지정이 가능하다.

```swift
var cities = ["Seoul", "New York", "LA", "Beijing"]
cities.count // 4 -> 배열의 길이

for i in 0..<length {
	print("\(i)번째 배열 원소는 \(cities[i])")
}
```

### 배열의 선언
```swift
var 배열이름 = Array<데이터 타입>()

var 배열이름 : Array<데이터 타입>
배열이름 = Array() // 배열 초기화

var 배열이름 : [데이터 타입] // 선언
배열이름 = [데이터 타입]()
배열이름 = []

var cities = Array<String>()
var cities : Array<String>
cities = Array()
```

위와 같이 배열의 선언과 초기화는 다양한 방법이 존재한다.

```swift
var arr1 : [String] // 선언
arr1 = [String]() // 초기화

var arr2 : [String] // 선언
arr2 = [] // 초기화

var arr3 : [Int] = [] // 타입 어노테이션 + 초기화

var arr4 : Array<Float> = [Float]() // 타입 어노테이션 + 제네릭 + 초기화

var arr5 : [String] = Array() // 타입 어노테이션 + 구방식의 초기화
```

배열에 아이템이 없다면 isEmpty는 true를 리턴한다.

### 배열 아이템 동적 추가
> append( _:) <br>
> insert(  _:, axt:) <br>
> append(contentsOf:)

* append( _ :)메서드는 값을 배열 맨 뒤에 추가한다.
* insert( _ :at:) 메서드는 값을 원하는 위치에 추가하고 그 뒤 아이템 인덱스는 증가한다.
* append(contentsOf:) 메서드는 배열 맨 마지막에 배열 째로 추가한다.(여러 개 아이템)

> 언더바(_)는 추가될 아이템을 지칭한다.

> Array(repeating:count:)

배열의 인덱스가 개수만큼 미리 정의되고, 여기에 기본값이 추가된 상태로 배열이 생성된다.

```swift
var arr = [String](repeating: "None", count: 3)
/*
0 -> "None"
1 -> "None"
2 -> "None"
*/
```

## 집합 (Set)
**중복이 없는** 같은 타입의 값을 저장하고자 할 때 사용된다. <br>
데이터 타입은 해시 연산을 할 수 있는 타입이어야 한다.(대부분 타입은 해시 연산이 가능하다.)

```swift
Set <데이터 타입> ()
```

### 집합의 동적 추가와 삭제
> insert

파라미터 값을 추가하지만 이미 있는 아이템이라면 아무 처리를 하지 않는다.

> remove

파라미터 값을 삭제한다. 없는 아이템이라면 아무 처리를 하지 않는다.

> removeAll

집합의 모든 아이템을 삭제한다.

### 집합 연산
> 기본 집합 연산

* intersection : 교집합. 공통된 부분
* symmetricDifference : 어느 한쪽에만 있는 아이템을 선택(합집합-교집합)
* union : 합집합
* subtract : 차집합 앞에서 뒤를 차집합시킨다.

> 부분집합과 포함관계 판단 연산

* isSubset : 부분집합인지의 여부
* isSuperset : 상위집합인지의 여부
* isStrictSubset & isStrictSuperset : 위 두개와 같지만 반대로 반환
* isDisjoint : 공통값을 확인. 있다면 false, 없다면 true

## 튜플(Tuple)
튜플은 독특한 자료형이다. 파이썬에도 등장하는 이 튜플은 한 가지 타입만을 위한 자료형이 아니다.

소괄호를 이용하여 튜플을 형성한다. 인덱스 넘버가 존재한다.

```swift
let tupleValue:(String, Character, Int, Float, Bool) = ("a", "b", 1, 2.5, true)
let (a, b, c, d, e) = tupleValue
```

> 결과값으로 튜플을 반환하는 함수

```swift
func getTupleValue() -> (String, String, Int) {
	return ("t", "v", 100)
}

// 함수가 반환하는 튜플을 튜플 상수로 바인딩
let (a, b, c) = getTupleValue()
```

## 딕셔너리
```swift
[ 키 : 데이터, 키 : 데이터, ... ]
```

* 하나의 키는 하나의 데이터에만 연결되어야 한다.
* 하나의 딕셔너리에서 키는 중복될 수 없다. 중복 선언 시, 아이템 추가가 아닌 수정이 이루어져 기존 키에 연결된 데이터가 삭제된다.
* 저장할 수 있는 데이터 타입에는 제한이 없다. 하나의 딕셔너리에 저장하는 데이터 타입은 모두 일치해야 한다.
* 딕셔너리의 아이템에는 순서가 없지만 키에는 내부적으로 순서가 있어서 for 구문을 이용한 탐색이 가능하다.
* 키의 타입은 대부분 가능하지만, 해시 연산이 가능해야 한다.

```swift
var capital = ["KR":"Seoul", "EN":"London", "FR":"Paris"]

capital["KR"] // "Seoul"
capital["EN"] // "London"
capital["FR"] // "Pairs"

Dictionary <키의 타입, 값의 타입> ()
```

### 딕셔너리 동적으로 제어하기
```swift
<딕셔너리 객체>.updateValue(<저장할 데이터>, forKey:<데이터 참조 및 저장하는 데 사용할 키>)

newCapital.updateValue("Seoul", forKey: "KR")

newCapital.updateValue("London", forKey: "EN")

newCapital.updateValue("Sapporo", forKey: "JP")


// 삭제
// removeValue(forKey:)
newCapital.removeValue(forKey: "CA")
```