//
//  PlayerDetailsViewController.swift
//  Rating
//
//  Created by kpugame on 2016. 4. 14..
//  Copyright © 2016년 kpugame. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UITableViewController {
    var player:Player?
    
    
    var game:String = "Chess" {
        didSet {
            detailLabel.text? = game
        }
    }
    
    var rating:Int = 1{
        didSet{
            ratingImageView.image? = imageForRating(rating)!
        }
    }
 //   var selectedStars:Int = 1
 //   @IBOutlet weak var ratingImageView: UIImageView!
    
    @IBOutlet weak var ratingImageView: UIImageView!
    ///////// Lab 5
    func imageForRating(rating:Int) -> UIImage?{
        let imageName = "\(rating)Stars"
        return UIImage(named: imageName)
    }
    @IBAction func unwindWithSelectedStar(segue: UIStoryboardSegue) {
        if let starPickerViewController = segue.sourceViewController as? StarPickerTableViewController{
            rating = starPickerViewController.rating
        }
    }
    //////////////////////
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    
    
    @IBAction func unwindWithSelectedGame(segue: UIStoryboardSegue) {
        if let GamePickerViewController = segue.sourceViewController as? GamePickerViewController,
            selectedGame = GamePickerViewController.selectedGame{
            game = selectedGame
        }
    }
    
    required init?(coder aDecoder: NSCoder){
        print("Init PlayerDetailsViewController")
        super.init(coder: aDecoder)
    }
    
    deinit{
        print("deinit PlayerDetailsViewController")
    }
    
    @IBAction func savePlayerDetail(segue: UIStoryboardSegue){
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SavePlayerDetail" {
            player = Player(name: nameTextField.text!, game: game, rating: rating)
        }
     //   if segue.identifier == "SaveSelectedStar"{
       //   player = Player(name: nameTextField.text!, game: game, rating: rating)
        //}

        
        if segue.identifier == "PickGame"{
            if let GamePickerViewController = segue.destinationViewController as? GamePickerViewController{
                GamePickerViewController.selectedGame = game
            }
        }
        
        if segue.identifier == "PickStar"{
            if let StarPickerTableViewController = segue.destinationViewController as? StarPickerTableViewController{
                StarPickerTableViewController.rating = rating
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Lab5
        ratingImageView.image = imageForRating(rating)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }

  
}
