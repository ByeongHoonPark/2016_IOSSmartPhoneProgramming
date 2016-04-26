//: Playground - noun: a place where people can play

import UIKit



var str: String = "Korea Polytechnic University"
var age: Int = 20

var luckeyNumber: Int = 7
var costOfCandy: Double = 1.25
var hungry: Bool = true
var name: String = "박병훈"

let life: Int = 42
let pi: Double = 3.14
let canTouchThis: Bool = false
var captain: String = "김영식"

captain = "이대현"

var apples = 5

print("Sally has \(apples) apples") // 프린트 함수에 변수 값을 출력하는 방법 변수에 연산시켜서도 가능


var secondsLeft = 3
while (secondsLeft > 0) {
    print(secondsLeft)
    secondsLeft = secondsLeft - 1
}
print("Blast off!")

var languageLearned: String = "3"
var languageLearnedNum: Int? = Int(languageLearned)

if let num = languageLearnedNum{
    print("숫자")
}
else {
    print("숫자아님")
}
