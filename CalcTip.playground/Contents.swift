//: Playground - noun: a place where people can play

import UIKit
class TipCalculator {
    let total : Double
    let taxPct : Double
    let subtotal : Double
    
    init(total: Double, taxPct: Double){
        self.total = total
        self.taxPct = taxPct
        subtotal = total / (taxPct + 1)
    }
        func calcTipWithTipPct(tipPct: Double) -> Double{ // 리턴타입은 맨 마지막에 -> 타입으로 적음
            return subtotal * tipPct
        }
        /*
        func printPossibleTips(){
            //print("15%: \(calcTipWithTipPct(0.15))")
            //print("18%: \(calcTipWithTipPct(0.18))")
            //print("20%: \(calcTipWithTipPct(0.20))")
            let possibleTipsInferred = [0.15, 0.18, 0.20]
            let possibeTipsExplicit: [Double] = [0.15, 0.18, 0.20]
            
            for possibleTip in possibleTipsInferred {
                print("\(possibleTip*100)%: \(calcTipWithTipPct(possibleTip))")
            }
            
            for i in 0..<possibleTipsInferred.count {
                let possibleTip = possibleTipsInferred[i]
                print("\(possibleTip*100)%: \(calcTipWithTipPct(possibleTip))")
            }
            
        }
*/
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

let tipCalc = TipCalculator(total: 33.25, taxPct: 0.06)
//tipCalc.printPossibleTips()
tipCalc.returnPossibleTips()