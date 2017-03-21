//
//  SecondVC.swift
//  DataPassingUsingBlock
//
//  Created by pratik on 21/03/17.
//  Copyright © 2017 pratik. All rights reserved.
//

import UIKit

class SecondVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    public var invitedUsers:([String], _ index:Int)->() = {_ in}
    @IBOutlet weak var tblView: UITableView!
    
    
    var objFirstVC : Int = 0
    
    var arrContent : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        arrContent = ["Mac","Iphone","IWatch","IPad","IPod","IMac"]
     
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        print("objFirstVC \(objFirstVC)")
        
        
        
        let indexPath = IndexPath(row: objFirstVC, section: 0)
        tblView.selectRow(at: indexPath, animated: true, scrollPosition: .bottom)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    @IBAction func btnBackClicked(_ sender: Any) {
        
//        self.invitedUsers(["1"], index")
        self.dismiss(animated: true, completion: nil)

    }

 

}

class Cell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    
}


extension SecondVC{
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? Cell
        cell?.lblName.text = arrContent[indexPath.row]
        return cell!
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return arrContent.count
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let selectedCell:Cell = tableView.cellForRow(at: indexPath)! as! Cell
        selectedCell.contentView.backgroundColor = UIColor.lightGray
        
        
        self.invitedUsers([arrContent[indexPath.row]], indexPath.row)
        
        UserDefaults.standard.set(indexPath.row, forKey: "indexPath")
        UserDefaults.standard.synchronize()
        
        self.dismiss(animated: true, completion: nil)
        
    }

}
