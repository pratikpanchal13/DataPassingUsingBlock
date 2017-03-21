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
        let SecondVC = storyboard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        
        if let returnValue = UserDefaults.standard.object(forKey: "indexPath") as? Int {
         
            SecondVC.objFirstVC = returnValue
        }
        
        SecondVC.invitedUsers = { selectedUsers, index in
            print("data is \(selectedUsers)",index)
            SecondVC.objFirstVC = index
            
        }
        
        self.present(SecondVC, animated: true, completion: nil)
        
        
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
