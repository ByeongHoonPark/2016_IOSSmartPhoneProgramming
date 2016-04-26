//
//  ViewController.swift
//  TIpcalc2
//
//  Created by kpugame on 2016. 4. 5..
//  Copyright © 2016년 kpugame. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    
    @IBOutlet var totalTextField : UITextField!
    @IBOutlet var taxPctLabel : UILabel!
    @IBOutlet var taxPctSlider: UISlider!
    @IBOutlet var resultsTextView: UITextView!
    
    @IBAction func calculateTapped(sender : AnyObject) {

        exchangeCalc.total = Double((totalTextField.text! as NSString).doubleValue)

        let possibleTips = exchangeCalc.returnPossibleTips()
        var results = ""
        possibleTips[30];
        for(tipPct, tipValue) in possibleTips{
            
            results += "\(tipPct)% 우대 쿠폰 사용시: "+String(format: "%0.0f",tipValue)+"달러 환전 가능\n"
        }
        resultsTextView.text = results
    }
    @IBAction func taxPercentageChanged(sender : AnyObject) {
        exchangeCalc.exchangeRate = Double(taxPctSlider.value)
        refreshUI()
    }
    @IBAction func viewTapped(sender : AnyObject) {
    }
    

    let exchangeCalc = ExchangeCalculatorModel(exchangeRate: 1200.0, exchangeFee: 0.0, total: 1000)
    func refreshUI() {
        totalTextField.text = String(format: "%0.2f", exchangeCalc.total)
        taxPctSlider.value = Float(exchangeCalc.exchangeRate)
        taxPctLabel.text = "환율 1달러 \(Int(taxPctSlider.value))원"
        resultsTextView.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


