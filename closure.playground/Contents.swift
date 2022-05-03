import UIKit

var greeting = "Hello, playground"
var findMaxFromArray: (([Int])-> Void)?

func findMaxNumber(array:[Int], handler: @escaping ([Int])->Void) {
   //step 2
     handler(array)
   //setp 3
    findMaxFromArray = handler
}


func doSomething() {
   //setp 1
    findMaxNumber(array: [11,52,33,34,5,65,7,8,29,10]) {(result) in
      let maxNumber = result.max()!
      //step 4
        print("Max number from Array: \(maxNumber)")
    }
}
doSomething()
//setp 5
findMaxFromArray!([100,300,754,222,44,432,535])
//Output: Max number from Array: 65
  //      Max number from Array: 754



var completionHandlers: [() -> Void] = []

func withEscaping(completion: @escaping () -> Void) {
    // 함수 밖에 있는 completionHandlers 배열에 해당 클로저를 저장
    completionHandlers.append(completion)
}

func withoutEscaping(completion: () -> Void) {
    completion()
}

class MyClass {
    var x = 10
    func callFunc() {
        withEscaping { self.x = 100 }
        withoutEscaping { x = 200 }
    }
}
let mc = MyClass()
mc.callFunc()
print(mc.x)
completionHandlers.first?()
print(mc.x)

// 결과
// 200
// 100


func closureCaseFunction(a: Int, b: Int, closure: @escaping (Bool) -> ()) {
    let c = a + b
    closure(false)
}

closureCaseFunction(a: 3, b: 3) { test in
    print(test)
}
