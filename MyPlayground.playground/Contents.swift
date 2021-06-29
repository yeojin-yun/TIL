//2021.06.29
let stri = "Hello Swift"
let l = stri.lowercased()

var one = stri.prefix(1)
var two = stri.prefix(2)
var three = stri.prefix(3)

one.insert("!", at: one.endIndex)
one.insert("2", at: one.startIndex)

let newStr = String(stri.prefix(1))
let s = stri[stri.startIndex ..< stri.index(stri.startIndex, offsetBy: 2)]


stri[stri.index(stri.startIndex, offsetBy: 2)...]



//2021.06.26
let firstName = "yun"
let lastName = "yeojin"

let korName = "내 이름은 %@ %@ 입니다."
let engName = "My name is %@ %@"

//Stirng indices
let str = "yeojin"

let firstCh = str[str.startIndex]
print(firstCh)


let secondCharIndex = str.index(after: str.startIndex)
let secondCh = str[secondCharIndex]
print(secondCh)

let thirdCharIndex = str.index(str.startIndex, offsetBy: 2)
let thirdCh = str[thirdCharIndex]
print(thirdCh)

let fifthCharIndex = str.index(str.endIndex, offsetBy: -3)
let fifthCh = str[fifthCharIndex]
print(fifthCh)

let sixthCharIndex = str.index(str.startIndex, offsetBy: 4)
let sixthCh = str[sixthCharIndex]
print(sixthCh)


let lastCharIndex = str.index(before: str.endIndex)
let lastCh = str[lastCharIndex]
print(lastCh)




//2021.06.23
//closure
//{ (parameters) -> ReturnType in
//statement
//} -> 생략 -> { statement }

//syntax Optimization
//var proModels = products.filter({ (name: String) -> Bool in
//return name.contains("Pro")
//})
//var proModels = products.filter({
////    $0.contains("Pro")
//})

var num = 0
let c = {
    num += 1
//    print("check point #1: \(num)")
}
c()




//2021.06.21
for i in 1 ... 3{
    print("OUTTER loop", i)
    for j in 1 ... 3 {
    print("inner loop", j)
        break
    }
}

outer:for i in 1 ... 3 {
    print("OUTTER loop", i)
    for j in 1 ... 3 {
    print("inner loop", j)
        break outer
    }
}

//let str: String = "Swift"
//let str: String? = nil

//var num: Int? = nil
//print(num)

num = 123
//print(num)

var stri: String? = "str"
guard let stri = stri else {
    fatalError()
}
stri

//number = 123
//if var number = number {
//    number = 456
//    print(number)
//}

var msg = ""
var input: String = "Swift"

//if let inputName = input {
    msg = "Hello, " + inputName
} else {
    msg = "Hello, Stranger"
}
print(msg)

//var str = "Hello, " + (input != nil ?  input! : "Strager")
print(str)

//2021.06.17
let nnum: Int? = nil
//nnum = 2

//print(nnum)

print(nnum!)


//2021.06.16
//break Statement
//let num = 1
switch num {
case 1 ... 10:
    print("Begin block")
    if num % 2 != 0 {
        break
    }
default:
    break
}
print("Done")

//continue statement
for index in 1 ... 10 {
    if index % 2 == 0 {
        continue
    }
    print(index)
}

