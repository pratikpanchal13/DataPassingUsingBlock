//
//  FirstVC.swift
//  DataPassingUsingBlock
//
//  Created by Pratik on 21/03/17.
//  Copyright © 2017 pratik. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnClickMeOpen(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        self.present(secondViewController, animated: true, completion: nil)
        
        secondViewController.invitedUsers = { selectedUsers, strStatus in
            
            print("data is \(selectedUsers) index is \(strStatus) ")
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
