//2021.06.23
//closure
//{ (parameters) -> ReturnType in
//statement
//} -> 생략 -> { statement }

//syntax Optimization
//var proModels = products.filter({ (name: String) -> Bool in
//return name.contains("Pro")
//})
var proModels = products.filter({
    $0.contains("Pro")
})

var num = 0
let c = {
    num += 1
    print("check point #1: \(num)")
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
let str: String? = nil

var num: Int? = nil
print(num)

num = 123
print(num)

var stri: String? = "str"
guard let stri = stri else {
    fatalError()
}
stri

number = 123
if var number = number {
    number = 456
    print(number)
}

var msg = ""
var input: String = "Swift"

if let inputName = input {
    msg = "Hello, " + inputName
} else {
    msg = "Hello, Stranger"
}
print(msg)

var str = "Hello, " + (input != nil ?  input! : "Strager")
print(str)

//2021.06.17
let nnum: Int? = nil
nnum = 2

print(nnum)

print(nnum!)


//2021.06.16
//break Statement
let num = 1
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

