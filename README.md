# TIL
Today I learned...  
2021.08.04  
-Swipe Action  
-Reordering Cells  
-Prefetching API  
-Table View Controller & Static Cells  
-Table View 강의 빠르게 돌려보기  
2021.08.03  
-Managing Selection #1 ~ #2  
-Edit Mode #1 ~ #2  
-Row Action  
2021.08.02  
-Customizing Section #1 ~#2  
-Section Index Title  
-Table Header Veiw & Footer View  
--------
-2021.08.01  
-Standard Accessory View  
-Custom Accessory View  
-Self Sizing  
-Custom Cell #1  
-Custom Cell #2  
2021.07.31  
-Multi Section #1  
-Multi Section #2  
-Separator  
-Table View Cell  
--------------
2021.07.30  
-Table View Overview  
-Table View Basics  
--------
2021.07.29  
-DateFormatter  
-ISO8601DateFormatter  
-----------
2021.07.28  
-Library 관리자 : 스냅킷(오토레이아웃 통달한 후, 배우기!), 코코아팟, Apple Developer Package  
-객체지향 프로그래밍 요소 : 캡슐화, 상속성, 다형성, 추상화, 은닉화  
-App의 Life Cycle : Not running->forground(active->inactive)->background->suspended->Not running  
-ViewCotroller Life cycle  
  viewdidload : 뷰가 메모리에 올라갔을 때  
  viewwillappear  
  viewdidappear : appearing→appeared  
  viewwillidisappear  
  viewdiddisappear  
------------------
2021.07.27  
-Canlendar and Date Components  
-Date Picker  
-Countdown Timer  
2021.07.26  
-Input View & Input Accessory View  
-Password AutoFill #1 ~ #2 (유료계정 필요)  
-Date
2021.07.25  
-SoftWare Keyboard #1 ~ #2  
-Text Delegate #1 ~ #3  
2021.07.24  
-Text View #1 ~ #3  
-Text Input #1 ~ #2  
---------
2021.07.22  
-Color #1, Color #2  
-Label #1 ~ #2  
-Text Field #1 ~ #3  
[단축키]  
-Shift command L : Library 단축키  
-command B : Build  
-command R : Run  
-control I : 줄 맞춤?  
-command 0 : 네비게이터 열기  
-control + command 함수클릭 : 함수 정의(?) 보기  
-xcode의 자동 완성 기능 : option + esc  
-command Delete :  문장 지우기  
-control Delete : 끊어서 지우기(대소문자 구별)   
-option Delete : 단어 지우기  
-command L 숫자 : line number 검색  
-command shift O : Open Quickly  
-command option [ : 위로 올라가기  
-command option ] : 아래로 내려가기  
-command 0 : 네비게이터 열고 닫기  
-command option 0 : indicator 닫기  
-command option W : 해당 탭 빼고 다 닫기  
-자동정렬 : control I  
-command , : 설정 단축키 (딜리트 라인 설정)  
-이름 다 바꾸기 : command 클릭 rename  
-control shift 화살표 (커서 늘리기) : 똑같은 거 추가하기  
-command L : 주소창  
-----------------
2021.07.21  
-Delegate & DataSource  
-----------------
2021.07.20  
-Image View  
-Image View #Image Basics  
-Image View #Resizable Images & vector Images  
-Image View #Template Images  
-Image View #Custom Drawing and Resizing  
-------------
2021.07.19  
-Switch  
-Stepper  
-Activity Indicator View  
-Progress View  
-Alert Controller #1~#3  
--------------
2021.07.18  
-Slider #1  
-Slider #2  
-------------
2021.07.17  
Slider  
-----------
2021.07.16  
Delegate Pattern #2
-------------
2021.07.15  
-Button#2  
-Picker View #1, Picker View #2  
-Page Control  
-Delegate pattern #1 복습  
------------------
2021.07.14  
-Overview  
-View & Windows : UIView #1 ~ #4  
-System View & Control : UIControl, Target Action, Button#1  
---------------
2021.07.13  
-Hello, iOS project  
-Hello, Xcode12  
-Hello, interface Builder  
-Outlet and Action  
-Delegate Pattern #1  
----------
2021.07.12  
-property(Stored property, Computed property, Type property, property Observer)  
-foreach, map 고차함수  
----------

2021.07.11  
-subscript requirements(재복습 필요)  
-Memory Basics  
-Value Type vs Reference Type  
-ARC(Automatic Reference Counting)  
-Strong Reference Cycle  
----------
2021.07.10  
-복습  
1)구조체, 클래스  
2)property, method, intitializer  
3)inheritance  
4)extension(재복습 필요)  
-method requirements(재복습 필요)  
-initializer requirements(재복습 필요)  
----------
2021.07.09  
-Adding Initializer  
-Adding Subscripts  
-Protocol : 형식에서 제공하는 멤버 목록. 멤버를 선언해야 함. 실제의 멤버 구현은 구조체, 클래스에서 하게 됨  
-Property Requirements  
    protocol ProtocolName {  
        var name: Tyep { get set }  
        static var name: Type { get set }  
}  
----------

2021.07.08  
-Initializer delegation : initializer위임을 통해 에러를 줄이고, 디버깅을 편리하게  
-Failable initializer : initializer의 옵셔널 버전. 초기화에 실패해도 nil값이 리턴될 수 있도록  
-Deinitializer : initializer 정리작업. 자동으로 제거가 되나, 부가적인 정리작업을 위해 사용  
-Extension : 형식 확장  
    computedProperty  
    computedTypeProperty  
    instanceMethod  
    typeMethod  
    initializer  
    subscript  
    NestedType  
    위에서 확장 가능  
-Adding properties  
-Adding Methods  
----------
2021.07.07  
-Initializer : 모든 속성은 기본값을 가지고 있어야 한다.  
    init(parameters) {  
    initialization  
    }  
-memberwise Initializer : 구조체가 자동으로 제공하는 initializer  
-Class Initializer : Designated Initializer vs convenience Initializer  
    Designated Initializer : 클래스가 가진 모든 속성 초기화  
    convenience Initializer : 필요한 것만 초기화  
-Requaired Initializer : subclass에서 SuperClass에서 initializer를 직접 구현하도록 강제하는 것  
----------
2021.07.06  
-Inheritance  
    class className: SuperClassName {  
    }  
-Overriding : SuperClass의 멤버가 적합하지 않다면 직접 재정의하여 구현  
-Upcasting : subclass instance를 superclass 형식으로 저장하는 것  
-Downcasting : Upcasting된 형식으로 원래 형식으로 되돌리는 것  
-Any & AnyObject : 범용자료형. 모든 형식으로 저장을 가능하게 해주는 마법 단어  
-Type Casting Pattern  
-Overloading : 하나의 형식에서 동일한 이름을 가진 다수의 멤버를 선언할 때. 파라미터 수/파라미터 자료형/Argument Label/return 형으로 식별  
----------
2021.07.05  
-Instance Method : 클래스, 구조체, 열거형에서 사용  
func name(parameters) -> ReturnType {  
    Code  
}  
instance.method(parameters)  
-Type Method : 클래스, 구조체, 열거형에서 사용  
static func name(parameters) -> ReturnType {  
    statements  
}  
Type.method(parameters)  
-Subscript  
subcript(parameters) -> ReturnType {  
    get {  
        return expression  
        }  
        set {  
        statements  
        }  
}  
----------
2021.07.04  
-property 복습  
----------
2021.07.03  
-Stored Property  
var name: Type = dafaultName  
let name: Type = defaultName  
lazy var name: Type = DefaultValue  
-Computed Property  
var name: Type {  
    get {  
        statements  
        return expr  
    }  
    set(name) {  
        statements  
    }  
}  
-Property Observer  
var name: Type {  
    willSet(name) {  
        statements  
    }  
    didSet(name) {  
        statements  
    }  
}  
-Type Property  
static var name: Type = DefaultValue  
static let name: Type = DefaultValue  
-self & super  
self  
self.propery  
self.method()  
self[index]  
self.init(parameters)  
----------
2021.07.02  
-Structures and Classes : syntax  
struct/class Name {  
property  
method  
initializer  
subscript  
}  
-Initializer : syntax  
init (parameters) {  
statements  
}  
-Nested Types : syntax(String.CompareOptions)  
----------
2021.07.01  
Dictionary : Comparing , Finding  
Set : Inspecting, Testing, Adding, Removing, Comparing, Combining
Iterating Collections : foreach  
Enumeration : syntax, Raw Values  
----------
2021.06.30  
Array : Creating Array, Adding Array, removing Array   
Dictionary : Creating Keys and Values, Inspecting Keys and Values, Accessing Keys and Values, Adding Keys and Values, removing Keys and Values  
----------
2021.06.29  
String searching : range(of:), common  
String Comparison : compare, prefix, suffix, hasPrefix, hasSuffix  
String Options : Case Insensitive Option, Literal, Backward  
----------
2021.06.28  
String basic  
Appending Strings and Characters : ed/ing 값은 원본을 바꾸지 않음.  
Inserting Characters : contentsof  
Replacing Substrings : replaceSubrange, replacingCharacters, replacingOccurences  
Removing Substrings : remove, removeFirst, removeLast, removeSubrange, removeALL, drop  
----------
2021.06.27  
String Index  
Stiring basics  
----------
2021.06.26  
String and Character  
Multiline String Literals : """사용하여  여러 줄 문자열 사용"""  
String Interpolation : 문자열의 포맷을 지정하는 것. %을 통해 포맷 지정  
String indices : 특정 문자의 인덱스만 불러들임.  
----------
2021.06.25  
Tuple  
: 이름없는 튜플. (expr1, expr2, ...)  
Named Tuple  
: 이름을 가진 튜플. 가독성이 높아짐.  
----------
2021.06.24  
Autoclosure  
Tuples  
Named Tuples  
----------
2021.06.23  
----------
2021.06.21  
#Optionals, Function  
#IUO, Nil-Coalescing Operator  
----------
2021.06.17  
#Optionals, Functions  
#Optionals : 값을 가지지 않아도 되는 형식  
Optional Binding : Optionals를 강제 언래핑하는 것  
Return Functions  
func name(parameters) -> returnType {
statements  
}  
----------
2021.06.16  
Control Transfer Statements, Labeled Statements  
Control Transfer Statements : 제어전달문. 흐름제어구문.   조건문과 반복문에서 일반적인 코드의 흐름을 바꾸기 위해 사용  
break Statement : 현재 실행 중인 문장을 중지하고 다음 문장을 실행  
Continue Statement : continue는 현재 실행중인 반복을 중지하고 다음 반복을 실행한다.   
Labeled Statemetn  
Label: statement  
break Label  
continue Label  
----------
2021.06.14  
1. Token  
-가장 작은 요소  
-공백이나 구둣점으로 나눌 수 없는 요소 . 예) if  
2.Expression  
-값, 연산자, 함수 등이 하나 이상 모여 하나의 값으로 표현된 것. 토큰이 하나 이상 모인 것 
-표현식을 평가한다(evaluate)=코드를 실행하여 값을 얻는다  
3. Statement  
-하나 이상의 표현들이 모여서 특정 코드를 작성. 표현식이 하나 이상 모인 것  
-예) if, switch, guard, for-in, while  
4. Compile  
-X-code에서 작업한 텍스트를 컴퓨터가 이해할 수 있도록 바꾸는 것  
-변환에 필요한 것들은 x-code에 내장되어 있음(Compiler)  
5. Link  
-컴파일한 파일을 라이브러리, 프레임워크와 연결시키는 것  
-연결시키는 것들 또한 x-code에 내장되어 있음(Linker)  
6. Run  
-실행해보는 것  
-디버그 모드 : 파일은 커지지만, 오류를 쉽게 찾을 수 있음  
-릴리즈 모드 : 파일 작업, 앱스토어 앱 올릴 때 사용  
-Runtime : 컴파일된 코드를 실행해보는 것  
7. Characters  
! : Exclamation Mark  
~ : Tilde  
[ ] : Square Bracket  
{ } : Curly Bracket / Brace  
< > : Angle Bracket  
8. First Class Citizen  
상수와 변수로 저장할 수 있다.  
parameter로 전달할 수 있다.  
함수에서 리턴할 수 있다.  

2.Working with Variables
[var]
var variableName = initialValue
variableName = initialValue

var name = "Swift"
var year = 2018
var valid = true


var x = 0.0, y = 0.0, z = 0.0

name
print(name)

year
print(year)

x
print(x)v

name = "Steve" //이미 선언한 변수는 바꿀 수 있다. 그러나 var name으로 재선언할 수는 없다.
name = "Yoona"
print(name) //변수에는 값이 누적되지 않고, 가장 최근의 값이 나옴

var anotherName = name //이 시점에서는 name과 anotherName이 값이 같아짐

anotherName = "Tim" //anotherName에 다른 값을 넣으면?
print(name, anotherName) //원래의 변수의 값을 변경시키지는 않고, 자기것만 변경시킴

//문자열 타입을 정수열 타입에 저장할 수 없음. year = "2018"은 불가능. 정수만 저장할 수 있음


[let]
let constantName = initialValue

//상수. 변수와 문법적으로 유사하지만 값을 저장한 후에는 변경할 수 없음

let name = "Yoona"

name
//let은 한 번 저장후에 변경이 불가능이 하기 때문에 let = "Steve" 안됨.
//특징을 변경할 수 없음. 변수를 정수로 선언해놓고, 문자열을 저장할 수 없음.

//변수보다는 상수를 선호함. 1)실수 발생확률이 적기 때문에 2)상수의 컴파일이 더 빨리 됨.

[Naming Convention]
Camel Case
1)UpperCamelCase : 시작 문자를 모두 대문자
-Class
-Structure
-Enumeration
-protocol

2)lowerCamelCase : 시작 문자는 소문자
-Variable
-Constant
-Function
-Property
-Method
-Parameter

[Scope : {}로 구분함]
-Global Scope : 전역범위. 어떤 {}에도 속하지 않음.  단 하나만 존재
-Local Scope : 지역범위. {} 내에 속함. 여러개 존재할 수 있고 중첩도 가능(네스티드 스코프로 부르기도 함)


3.Data Types with Memory
자료의 유형
-Integer Types : 정수 
-Floating-Types
-Boolean Types
-Character Types : 하나의 문자
-String Types : 하나 이상의 문자 

[Memory]
실수를 저장할 때는 지수와 가수를 나눠서 저장한다.
동일한 메모리 범위에서 정수보다 더 넓은 범위를 표현할 수 있다.
부동소수점 오차로 인해서 100% 정확한 소수를 저장할 수 없다.
메모리 저장 가능한 값보다 큰 값을 저장하면 overflow가 발생한다. (swift만)


4.Literals, Data Types
[Integer]
//정수 자료형
//Int8 = 1byte 저장가능
//Int16 = 2byte 저장가능
//Int32 = 4byte 저장가능
//Int64 = 8byte 저장가능

Int8.min
Int8.max
Int16.min
Int16.max
Int32.min
Int32.max
Int64.min
Int64.max

MemoryLayout<Int8>.size

<Signed vs Unsigned>
//Unsigned는 부호가 없는 것
Int8.min >> -128
Int8.max >> 127
UInt8.min >> 0
UInt8.max >>256 //unsigned에서는 양수 부분만 사용

MemoryLayout<Int>.size >>8
Int.min
Int.max

let num = 123 //자동으로 상수로 인식
type(of: num) //상수로 인식된 것을 알 수 있음.

[number]
1,000 -> 1_000로 써야함

[Floating]
실수자료형
Floating자료형은 6자리까지 정확하게 처리
Double자료형은 16자리까지 정확하게 처리
기본적으로 타입을 규정하지 않으면 Double로 인식
Int보다 더 많은 수를 저장할 수 있기 때문에 오류가 적다.


[Boolean]

let isVaild: Bool = true //대소문자 구별하기 때문에 True는 오류가 남. true와 false만 사용가능

let str = ""
str.isEmpty >>true


[Strings and Characters]
//문자열은 큰 따옴표 안에 있어야 함
"Have a nice day"
"123" //숫자로 표현되어 있지만 문자열

let str = "1"
type(of: str) >>String
———
let ch: Character = "1"
type(of: ch) >> Character

//let doubleCh: Character = "AA" 문자가 2개 이상일 때는 무조건 String. Character될 수 없음

let emptyCh: Character = " " //공백을 넣고 싶을 때는 ""가 아니라 " "로 해야한다.


[Type inference]
let num = 123
type(of: num)
//형식추론. 따로 형식을 정하지 않아도 추론하여 형식 부여. 가장 오류가 없는 형식으로 추론됨.

let temp = 11.2
type(of: temp)

let str = "Swift"
type(of: str)

let a = true
let b = false
type(of: a)
type(of: b)

//let value
//type(of: value) 오류 발생. 추론을 해야하는데 초기값이 없기 때문에 추론을 할 수가 없음. 직접 자료형을 지정해야 함



[Type Annotation]
//자료형을 직접 지정하는 것
let num: Int = 123 //123이 초기값임

let value: Double
value = 12.3 //위에서는 상수 선언만 하고 다음에 초기화해도 됨.

//왜? 자동으로 되는데, 굳이 type annotation해야하는 가?
//1) 다른 타입형으로 저장하고 싶을 때
//2) 엄청 큰 프로젝트일 때는 지정하지 않으면 컴파일에 큰 시간 소요가 큼

let ch: Character = "c"


[Type Conversion]
//Type Conversion : 메모리에 저장된 값을 다른 형식으로 바꿔 새로운 값을 형성
//Type Casting : 메모리에 저장된 값을 그대로 두고 컴파일러가 다른 형식으로 처리하도록 지시

let a = 123
let b = 4.56
//a + b 오류. 서로 다른 형식이기 때문에 안됨.

Double(a) + b // 123.0 + 4.56
a + Int(b) // 123 + 4

let c = Int8(a)

let d = Int.max
//let e = int8(d)


//let str = "123"
//let num = Int(str)

let str = "number"
let numb = Int(str)

[Type Safety]
//let str: String = 123 문자열에 정수 저장 불가능. 반대도 마찬가지로 불가능. 오류 발생
//let num: Int = 12.34 오류 발생. 정수와 실수도 엄격히 구분함

//let a = 7
//let b: Int8 = a 오류발생. 하나(Int)는 1바이트, 하나는 8바이트(Int8)로 값의 유실 문제로 호환되지 않음

//자료형의 이름이 다르다면 호환되지 않음. 서로 다른 자료형의 값을 저장하려면? type conversion 문법 사용하면 됨

//계산식에도 동일하게 적용됨
let a = 123
let b = 34.56
//let result = a + b 오류발생. 서로 다른 타입의 유형의 값을 저장할 수 없음.

//연산에서도 마찬가지. 서로 같은 유형일 때만 연산이 가능
//let rate = 1.94
//let amt = 10_000_000
//let result = rate * amt 오류 발생. rate실수고 amt는 정수이므로.

let rate = 1.94
let amt = 10_000_000
let result = rate * Double(amt)
type(of: result)

//위 코드를 다시 정수로 계산하는 방법은? 1)Int로 바꿔서 계산 2)나온 Double값을 Int로 변환

Int(rate * Double(amt)) //2)나온 Double값을 Int로 변환
Int(rate) * amt //1)Int로 바꿔서 계산

[Typealias]
typealias Coordinate = Double

let lat: Coordinate = 12.34
let Ion: Coordinate = 56.78

//Double이라는 형식을 새로운 이름(여기서는 Coordinator)로 정의하여 그것을 Double 대신 사용.

5.Operator
[연산자]
단항 연산자 : +a
이항 연산자 : a✅+✅b
삼항 연산자 : a✅?✅b✅:✅c

전치 연산자(prefix operator) : 피연산자 뒤에
후치 연산자(postfix operator) : 피연산자 앞에
(infix operator) : 피연산자 중간에 a+b

[단항 연산자]
let a = 12
let b = 34

+a
+b

//효용성이 전혀 없기 때문에 현실적으로 사용할 일은 적다.

[Additional Operator]
더하기 연산자

[Unary minus Operator]
-a //단항 연산자로 사용할 때는 부호만 -로 바꿔줌

[Subtraction Operator]
a - b

[Multiplication Operator]
a * b

[Division Operator]
a / b >> o
b / a >> 2

let c = Double(a) 
let d = Double(b) 

c / d >> 0.3524~~
d / c >> 0.2888888888835~~

//나누기 연산자는 몫을 나타내고, 정수 연산자와 실수 연산자를 모두 지원한다.

[Remainder Operator]
//나머지 연산자. 정수만 지원. 실수를 나누고 싶을 때는 truncatingRemainder method를 사용해야 함

a % b
//c % d

c.truncatingRemainder(dividingBy: d) //실수의 나머지 연산자를 사용할 때는 반드시 이렇게.

[Overflow]
let num: Int8 = 9 * 9
//let num: Int8 = 9 * 9 * 9 오류. 이처럼 자료형의 저장할 수 있는 값의 범위를 벗어난 것을 Overflow라고 함

let num2: Int = 9 * 9 * 9
//Overflow문제를 막기 위해 가능한 한 크게 타입을 정하거나, 미리 값을 예측해 타입을 부여하는 게 좋음.

[Overflow Operator]
Int8.min >>-127
Int8.max >>128

let num:Int8 = Int8.max >>128
//let num:Int8 = Int8.max + 1 오류. Int8에 들어가는 값(127)보다 커서 Overflow 문제 발생


[Overflow Addition Operator]
a &+ b
let a: Int8 = Int8.max
let b: Int8 = a &+ 1 // 가장 큰 값에 +1을 하면 가장 작은 값이 됨.


[Overflow Subtraction Operator]
a &- b
let c: Int8 = Int8.min
let d: Int8 = c &- 1 //Overflow가 허용된다고 해서 -129가 되지는 않음. 메모리 크기가 변경되는 게 아니라 비트가 바뀌는 것

[Overflow Multiplikation Operator]
a &* b
let e: Int8 = Int8.max &* 2 //지금은 이해할 필요 없음


[Comparison Operator]
//비교 연산자(비교이므로 이항 연산자임). 비교한 조건이 맞다면 true, 틀리면 false. 비교 연산자의 결과는 항상 Boolean.

let a = 12
let b = 34

[Equal to Operator]
a == b
//두 값이 같은지 비교. 값이 같다면 true가, 다르면 false가 return됨
a == b >>false

"Swift" == "Swift" >>true
"swift" == "Swift" //오류. Swift는 대소문자를 구별하기 때문에

//정수와 실수 비교
let c = 12.34
//a == c 오류. 산술 연산자와 마찬가지로 같은 자료형만 비교가 가능.

[Not equal to Operator]
a =! b
a != b >>true. 두 값이 다르기 때문에.

[Greater than Operator]
a > b 
a > b >> true
"swift" > "Swift" >>true. //비교 연산자로 문자를 비교할 때는 유니코드나 아스키코드의 값을 비교함. 아스키코드(?)상 대문자보다 소문자s가 더 큼

[Greater than or equal to Operator]
a >= b
a >= b >>false
7 > 7 >> false
7 >= 7 >>true

[Less than Operator]
a < b
a < b >>true

[Less than or equal to Operator]
a <= b
a <= b >>ture

[Ternary Conditional Operator]
condition ? expr1 : expr2

//condition(boolean이어야 함) 값이 true면 expr1값이, false면 expr2 값이 도출됨. expr1과 expr2의 자료형이 같아야 함.
let hour = 12

hour < 12 ? "오전" : "오후" >> 오후
//if문으로도 표현가능
if hour < 12 {
    "am"

} else {
    "pm"
}

[Assignment Operator]
a = b
//할당 연산자. 값을 저장하는 역할. 비교연산자와 헷갈리지 말것.
// lvalue
// rvalue
// lvalue는 할당 연산자 양 쪽에 둘 다 올 수 있지만, rvalue는 항상 오른쪽에 와야 함.


[Compaound Assignment Operator]
복합할당 연산자

1. Addition Assignment Operator
    a += b
    a = a + b 

    var a = 1
    var b = 2
    a = a + b >> 5

2. Subtraction Assignment Operator 
    a -= b
    a = a - b

    var c = 31
    var d = 15
    e -= f >>16
    print(e) >> 16

3. Multiplication Assignment Operator 
    a *= b
    a = a * b

    var e = 3
    var f = 5
    e *= f >> 15
    print(e) >>15

4. Modulo Assignment Operator 
    a %= b
    a = a % b


[Range Operator]
1. Closed Range Operator 
    a … b
    a… (피연산자 하나일 때는 떼지 않고 쓰기)
    …b
    
    var sum = 0
    for num in 1 ... 10 {
        num
        sum += num
    }
    sum >> 55. 10번 반복하여 1~10까지 더함


    let list = ["A", "B", "C", "D", "E"]
    list[2...] >> "C", "D", "E"
    list[...0] >> “A”
    목록이 정확하게 있는 것들은 이 연산자를 통해 정확하게 불러낼 수 있음.

2. Half-Open Range Operator 
    a ..< b
    ..<a

    sum = 0
    for num in 1 ..< 10 {
        sum += num
    }

    sum >> 45 // upperBound가 9이므로 9까지만 더함

    print(list) >> “A”, “B”, “C”, “D”, “E”
    list >> “A”, “B”, “C”, “D”, “E”
    list[..<2] >> “A”, “B” //list에서는 모든 값이 고정되어 있음.


    let range = 0 ... 5
    range.contains(7) >> false
    range.contains(1) >> true

    let ran = ...7
    ran.contains(9) >>false
    ran.contains(3) >>true
    ran.contains(-1) // 단항 연산자를 사용할 때는 loweBound가 자동 지정되지 않기 때문에,         lowerBound는 무한대가 됨.
    ran.contains(Int.min) >> true

