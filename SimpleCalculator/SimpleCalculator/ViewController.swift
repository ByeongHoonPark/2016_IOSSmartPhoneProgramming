//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by kpugame on 2016. 3. 27..
//  Copyright © 2016년 kpugame. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var isTyped: Bool = false
    @IBOutlet var calResultLabel: UILabel!
    
    var result = Float()
    var currentNumber = Float()
    var firstNumber = Int()
    var secondNumber = Int()
    var isPushOperand = false
    var isFinished = false
    var currentOperand = String()
    
    @IBOutlet var realResultLabel: UILabel!
    
    @IBAction func pressButton(sender: UIButton) {
        if(isPushOperand == false)
        {
            firstNumber = firstNumber * 10 + Int(sender.titleLabel!.text!)!
            calResultLabel.text = ("\(firstNumber)")
           // isFirst = false
        }
        else if(isPushOperand == true)
        {
            secondNumber = secondNumber * 10 + Int(sender.titleLabel!.text!)!
            calResultLabel.text = ("\(firstNumber) \(currentOperand) \(secondNumber)")
        }
        //else
        //{
         //   secondNumber = secondNumber * 10 + Int(sender.titleLabel!.text!)!
         //   if(isFinished == false)
         //   {
         //        calResultLabel.text = ("\(firstNumber) \(currentOperand) \(secondNumber)")
         //   }
           
        //}
        
        //currentNumber = currentNumber * 10 + Float(sender.titleLabel!.text!)!
       //calResultLabel.text = ("\(currentNumber)")
        //calResultLabel.text?.append(c: Character)
    }

    @IBAction func pressOperand(sender: UIButton)
    {
        if(sender.titleLabel!.text != "=")
        {
            isPushOperand = true
             currentOperand = sender.titleLabel!.text! as String!
            // result = 0
        }
        
       
        switch currentOperand {
                    //result = currentNumber
        case "-":
            currentOperand = "-"
            calResultLabel.text = ("\(firstNumber) -")
        case "+":
            currentOperand = "+"
            calResultLabel.text = ("\(firstNumber) +")
        case "X":
            currentOperand = "X"
            calResultLabel.text = ("\(firstNumber) X")
        case "/":
            currentOperand = "/"
            calResultLabel.text = ("\(firstNumber) /")
        case "^":
            currentOperand = "^"
        default:
            print("error")
        }
        
       // currentNumber = 0
        //calResultLabel.text = ("\(firstNumber) \(currentOperand) \(secondNumber) = \(result)")
        
        if(sender.titleLabel!.text == "=")
        {
            
            switch currentOperand {
            case "-":
                result = Float(firstNumber - secondNumber)
            case "+":
                result = Float(firstNumber + secondNumber)
            case "X":
                result = Float(firstNumber * secondNumber)
            case "/":
                result = Float(firstNumber / secondNumber)
            default:
                print("error")
            }
            isFinished = true
            calResultLabel.text = ("\(firstNumber) \(currentOperand) \(secondNumber)")
            realResultLabel.text = ("\(result)")
           // realResultLabel.text = ("\(firstNumber) \(currentOperand) \(secondNumber) = \(result)")
           // result = 0
        }
        
       // currentOperand = sender.titleLabel!.text! as String!
    }
    
    @IBAction func pressClear(sender: UIButton) {
        result = 0
        currentNumber = 0
        currentOperand = "^"
        firstNumber = 0
        secondNumber = 0
        calResultLabel.text = ("\(result)")
        realResultLabel.text = ("0")
        isPushOperand = false
        isFinished = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentOperand = "^"
        calResultLabel.text = ("\(result)")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

