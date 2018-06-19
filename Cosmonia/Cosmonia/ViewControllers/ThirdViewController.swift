//
//  ThirdViewController.swift
//  Cosmonia
//
//  Created by Mac on 12.06.18.
//  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class ThirdViewController: UITableViewController {

    var checkmarks = [Int : Bool]()
    var dataArray: [String] = []
    var selectedIndexPath: IndexPath? = IndexPath(row: 0, section: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let checks = UserDefaults.standard.value(forKey: "checkmarks") as? NSData {
            checkmarks = NSKeyedUnarchiver.unarchiveObject(with: checks as Data) as! [Int : Bool]
        }
       
        
        for family in UIFont.familyNames {
            
            let sName: String = family as String
            // print("family: \(sName)")
            
            for name in UIFont.fontNames(forFamilyName: sName) {
                // print("name: \(name as String)")
                dataArray.append(name)
            }
        }
    }

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let textInCell = dataArray[indexPath.row]
        cell.textLabel?.text = textInCell
        
            if checkmarks[indexPath.row] != nil {
                cell.accessoryType = checkmarks[indexPath.row]! ? .checkmark : .none
            } else {
                checkmarks[indexPath.row] = false
                cell.accessoryType = .none
            }
        
      
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        
        if indexPath == selectedIndexPath {
            

        }
        let newCell = tableView.cellForRow(at: indexPath)
        if newCell?.accessoryType == UITableViewCellAccessoryType.none {
            newCell?.accessoryType = UITableViewCellAccessoryType.checkmark
            checkmarks[indexPath.row] = true
            
        }
        let oldCell = tableView.cellForRow(at: selectedIndexPath!)
        if oldCell?.accessoryType == UITableViewCellAccessoryType.checkmark {
            oldCell?.accessoryType = UITableViewCellAccessoryType.none
            checkmarks[indexPath.row] = false
        }
        
        selectedIndexPath = indexPath
        

        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: checkmarks), forKey: "checkmarks")
        UserDefaults.standard.synchronize()
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
 

}













