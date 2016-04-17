//
//  ChooseViewController.swift
//  PAP
//
//  Created by Jakub Ďurech on 12.4.2016.
//  Copyright © 2016 Durech & Bronis. All rights reserved.
//

import UIKit

class ChooseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - TableView Delegate
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("chooseCell", forIndexPath: indexPath) as! ChooseTableViewCell
        
        //cell.nameLabel.text = pubs[indexPath.row]._name
        
        switch indexPath.row {
            
            case 0 : cell.nameLabel.text = "All"
                    cell.drinkImageView.image = UIImage(named: "all")
            case 1 : cell.nameLabel.text = "Beer"
                cell.drinkImageView.image = UIImage(named: "beer")
            case 2 : cell.nameLabel.text = "Wine"
                cell.drinkImageView.image = UIImage(named: "wine")
            case 3 : cell.nameLabel.text = "Shots"
                cell.drinkImageView.image = UIImage(named: "shots")
            case 4 : cell.nameLabel.text = "Coctails"
                cell.drinkImageView.image = UIImage(named: "coctails")
            case 5 : cell.nameLabel.text = ""
                cell.drinkImageView.image = UIImage(named: "")
            case 6 : cell.nameLabel.text = "Log out"
                cell.drinkImageView.image = UIImage(named: "logout")
        
            default : break
            
        }
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 7
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        pubs.removeAll()
        print(indexPath.row)
        if indexPath.row == 6{
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("LogIn")
            self.presentViewController(nextViewController, animated:true, completion:nil)
        }
        let myCategory: Int! = indexPath.row
        
        getData(myCategory) { data in
            
            self.performSegueWithIdentifier("showBrowse", sender: self)

        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }

}
