//
//  ViewController.swift
//  multipleExchangeCalculator
//
//  Created by kpugame on 2016. 4. 17..
//  Copyright © 2016년 kpugame. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var totalTextField : UITextField!
    @IBOutlet var dollarPctLabel : UILabel!
    @IBOutlet var dollarPctSlider: UISlider!
    @IBOutlet var chinaPctLabel : UILabel!
    @IBOutlet var chinaPctSlider: UISlider!
    @IBOutlet var yenPctLabel : UILabel!
    @IBOutlet var yenPctSlider: UISlider!
    @IBOutlet var euroPctLabel : UILabel!
    @IBOutlet var euroPctSlider: UISlider!
    
    @IBOutlet weak var dollarTableView: UITableView!
    @IBOutlet weak var chinaTableView: UITableView!
    @IBOutlet weak var yenTableView: UITableView!
    @IBOutlet weak var euroTableView: UITableView!
    //var possibleTips = Dictionary<Int, (exchangePct : Int, exchangeRate: Double)>()
    var possibleTips = Dictionary<Int,  (type: String, valu: Double)>()
    var possibleChina = Dictionary<Int, (type: String, valu: Double)>()
    var possibleYen = Dictionary<Int, (type: String, valu: Double)>()
    var possibleEuro = Dictionary<Int,  (type: String, valu: Double)>()
    
    var Results = ""
    var sortedKeys:[Int] = []
     var sortedKeys2:[Int] = []
     var sortedKeys3:[Int] = []
     var sortedKeys4:[Int] = []
    
    @IBAction func calculateTapped(sender : AnyObject) {
        
        exchangeCalc.total = Double((totalTextField.text! as NSString).doubleValue)
        chinaCalc.total = Double((totalTextField.text! as NSString).doubleValue)
        yenCalc.total = Double((totalTextField.text! as NSString).doubleValue)
        euroCalc.total = Double((totalTextField.text! as NSString).doubleValue)
        
 
     //   possibleTips = exchangeCalc.returnPossibleTips()
         possibleTips = exchangeCalc.returnPossibleTips("US")
        possibleChina = chinaCalc.returnPossibleTips("CN")
        possibleYen = yenCalc.returnPossibleTips("JP")
        possibleEuro = euroCalc.returnPossibleTips("EU")
       // var results = ""
        //Results = ""
        sortedKeys = Array(possibleTips.keys).sort()
        sortedKeys2 = Array(possibleChina.keys).sort()
        sortedKeys3 = Array(possibleYen.keys).sort()
        sortedKeys4 = Array(possibleEuro.keys).sort()
        dollarTableView.reloadData()
        chinaTableView.reloadData()
        yenTableView.reloadData()
        euroTableView.reloadData()

    }
    @IBAction func taxPercentageChanged(sender : AnyObject) {
        exchangeCalc.exchangeRate = Double(dollarPctSlider.value)
        chinaCalc.exchangeRate = Double(chinaPctSlider.value)
        yenCalc.exchangeRate = Double(yenPctSlider.value)
        euroCalc.exchangeRate = Double(euroPctSlider.value)

        refreshUI()
    }
    @IBAction func viewTapped(sender : AnyObject) {
    }
    
    
    let exchangeCalc = ExchangeCalculatorModel(exchangeRate: 1200.0, exchangeFee: 0.0, total: 1000, type:"US")
    let chinaCalc = ExchangeCalculatorModel(exchangeRate: 1200.0, exchangeFee: 0.0, total: 1000, type:"CN")
    let yenCalc = ExchangeCalculatorModel(exchangeRate: 1200.0, exchangeFee: 0.0, total: 1000, type:"JP")
    let euroCalc = ExchangeCalculatorModel(exchangeRate: 1200.0, exchangeFee: 0.0, total: 1000, type:"EU")
    
    func refreshUI() {
        totalTextField.text = String(format: "%0.2f", exchangeCalc.total)
        dollarPctSlider.value = Float(exchangeCalc.exchangeRate)
        dollarPctLabel.text = "환율 1달러 \(Int(dollarPctSlider.value))원"
        
        chinaPctSlider.value = Float(chinaCalc.exchangeRate)
        chinaPctLabel.text = "환율 1위안 \(Int(chinaPctSlider.value))원"
        
        yenPctSlider.value = Float(yenCalc.exchangeRate)
        yenPctLabel.text = "환율 100엔 \(Int(yenPctSlider.value))원"
        
        euroPctSlider.value = Float(euroCalc.exchangeRate)
        euroPctLabel.text = "환율 1유로 \(Int(euroPctSlider.value))원"
   //     resultsTextView.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      //  dollarTableView.dataSource = self
      //  dollarTableView.delegate = self
        dollarTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "UScell")
        
     //   chinaTableView.dataSource = self
     //   chinaTableView.delegate = self
        chinaTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "CNcell")
        
      //  yenTableView.dataSource = self
     //   yenTableView.delegate = self
        yenTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "JPcell")
     //
     //   euroTableView.dataSource = self
     //   euroTableView.delegate = self
        euroTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "EUcell")
        
        refreshUI()
   
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count:Int?
        if tableView == self.dollarTableView
        {
          count = sortedKeys.count
        }
        if tableView == self.chinaTableView
        {
             count =  sortedKeys2.count
        }
        if tableView == self.yenTableView
        {
             count =  sortedKeys3.count
        }
        if tableView == self.euroTableView
        {
             count =  sortedKeys4.count
        }

        
        return count!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        
        if tableView == self.dollarTableView
        {
            cell = tableView.dequeueReusableCellWithIdentifier("UScell", forIndexPath: indexPath)
             let tipPct = sortedKeys[indexPath.row]
            let exchangeVal = possibleTips[tipPct]!.valu
          //  let exchangeType = possibleTips[tipPct]!.type
            cell!.textLabel?.text = "     \(tipPct)%"+String(format:"우대 쿠폰 사용시: %0.0f달러 환전 가능",exchangeVal)
            cell!.detailTextLabel?.text = String(format:"우대 쿠폰 사용시: %0.1f달러 환전 가능",exchangeVal)
            
        }
        if tableView == self.chinaTableView
        {
            cell = tableView.dequeueReusableCellWithIdentifier("CNcell", forIndexPath: indexPath)
            let tipPct = sortedKeys[indexPath.row]
            let exchangeVal = possibleChina[tipPct]!.valu
            //  let exchangeType = possibleTips[tipPct]!.type
            cell!.textLabel?.text = "     \(tipPct)%"+String(format:"우대 쿠폰 사용시: %0.0f위안 환전 가능",exchangeVal)
            cell!.detailTextLabel?.text = String(format:"우대 쿠폰 사용시: %0.1f위안 환전 가능",exchangeVal)
            
        }
        if tableView == self.yenTableView
        {
            cell = tableView.dequeueReusableCellWithIdentifier("JPcell", forIndexPath: indexPath)
            let tipPct = sortedKeys[indexPath.row]
            let exchangeVal = possibleYen[tipPct]!.valu
            //  let exchangeType = possibleTips[tipPct]!.type
            cell!.textLabel?.text = "     \(tipPct)%"+String(format:"우대 쿠폰 사용시: %0.0f엔 환전 가능",exchangeVal)
            cell!.detailTextLabel?.text = String(format:"우대 쿠폰 사용시: %0.0f엔 환전 가능",exchangeVal)
            
        }
        if tableView == self.euroTableView
        {
            cell = tableView.dequeueReusableCellWithIdentifier("EUcell", forIndexPath: indexPath)
            let tipPct = sortedKeys[indexPath.row]
            let exchangeVal = possibleEuro[tipPct]!.valu
            //  let exchangeType = possibleTips[tipPct]!.type
            cell!.textLabel?.text = "     \(tipPct)%"+String(format:"우대 쿠폰 사용시: %0.0f유로 환전 가능",exchangeVal)
            cell!.detailTextLabel?.text = String(format:"우대 쿠폰 사용시: %0.0f유로 환전 가능",exchangeVal)
            
        }
//
        //let cell = UITableViewCell(style: UITableViewCellStyle.Value2, reuseIdentifier: nil)
        
   //     let tipPct = sortedKeys[indexPath.row]
       // let tipAmt = possibleTips[tipPct]!.tipAmt
        //let total = possibleTips[tipPct]!.total
        
     //   let exchangeVal = possibleTips[tipPct]!.valu
    //    let exchangeType = possibleTips[tipPct]!.type
       // let te =  possibleChina[tipPct]!.valu
        //let exchangeType2 = possibleChina[tipPct]!.type
       // possibleYen
       // possibleEuro

             return cell!
    }
    
}


