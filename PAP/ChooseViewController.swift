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
            
            case 0 : cell.nameLabel.text = "Beer"
                    cell.drinkImageView.image = UIImage(named: "homer_intro")
            case 1 : cell.nameLabel.text = "Drink"
                cell.drinkImageView.image = UIImage(named: "homer_intro")
        
            default : break
            
        }
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.row == 1 {
            
            
            self.performSegueWithIdentifier("showBrowse", sender: self)
            
        }
        
    }

}
