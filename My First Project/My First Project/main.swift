//
//  main.swift
//  My First Project
//
//  Created by kpugame on 2016. 4. 7..
//  Copyright © 2016년 kpugame. All rights reserved.
//

import Foundation


let answer = randomIntBetween(1, high: 100)


//var guess = 7
var turn = 1

while(true)
{
    print("Guess #\(turn): Enter a name between 1 and 100.")
    let userInput = input()
    let inputAsInt = Int(userInput)
    
    if let guess = inputAsInt {
        if(guess > answer)
        {
            print("Lower!")
        }else if (guess < answer){
            print("Higher!")
        } else{
            print("Correct! The answer was \(answer).")
            break
        }
    } else{
        print("Invalid input! Please enter a number")
        continue
    }
    turn+=1
}

