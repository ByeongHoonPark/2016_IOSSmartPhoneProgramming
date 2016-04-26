//
//  TipCalculatorModel.swift
//  TIpcalc2
//
//  Created by kpugame on 2016. 4. 5..
//  Copyright © 2016년 kpugame. All rights reserved.
//

import Foundation
class TipCalculatorModel {
    var total : Double
    var taxPct : Double
    var subtotal : Double{
        get{
            return total / (taxPct+1)
        }
    }
    
    init(total: Double, taxPct: Double){
        self.total = total
        self.taxPct = taxPct
      
    }
    func calcTipWithTipPct(tipPct: Double) -> Double{ // 리턴타입은 맨 마지막에 -> 타입으로 적음
        return subtotal * tipPct
    }
    func returnPossibleTips()->[Int: Double]{
        let possibleTipsInferred = [0.3, 0.50, 0.70]
        
        var retval = [Int: Double]()
        
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip * 100)
            
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
    }
    
}


class ExchangeCalculatorModel {
    var exchangeFee : Double
    var exchangeRate : Double
    var total : Double
    
    init(exchangeRate: Double, exchangeFee: Double, total: Double){
        self.exchangeFee = exchangeFee
        self.exchangeRate = exchangeRate
        self.total = total
    }
    func calcExchageFee(tipPct: Double) -> Double{ // 리턴타입은 맨 마지막에 -> 타입으로 적음
        return total/(exchangeRate + exchangeRate * 0.02 * (1.0 - tipPct))
    }
    func returnPossibleTips()->[Int: Double]{
        let exchangeRateFee = [0.3, 0.5, 0.7]
        
        var retval = [Int: Double]()
        
        for resultFee in exchangeRateFee {
            let intPct = Int(resultFee * 100)
           // let intPct = Int(exchangeRate * resultFee * 0.02)
            
            retval[intPct] = calcExchageFee(resultFee)
        }
        return retval
    }
    
}


