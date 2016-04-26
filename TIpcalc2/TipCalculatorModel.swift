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
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        
        var retval = [Int: Double]()
        
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip * 100)
            
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
    }
    
}


