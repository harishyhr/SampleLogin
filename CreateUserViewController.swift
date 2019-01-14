//
//  CreateUserViewController.swift
//  Spectrum
//
//  Created by Harish on 14/12/18.
//  Copyright © 2018 Harish. All rights reserved.
//

import UIKit

class CreateUserViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Create New User"
    }
    
    @IBAction func createUser(_ sender: Any) {
        guard let uname = userName.text, uname.count > 0 else {
            let alert = Utility.createAlert(title: "Warning", message: "Please enter valid Username")
            present(alert, animated: true, completion: nil)
            return
        }
        
        guard let pwd = passWord.text, Utility.isValidPassword(pwd) else {
            let msg = """
                - Password must consist of a mixture of letters and numerical digits only, with at least one of each.
                - Password must be between 5 and 12 characters in length.
                - Password must not contain any sequence of characters immediately followed by the same sequence.
            """
            let alert = Utility.createAlert(title: "Warning", message: msg)
            present(alert, animated: true, completion: nil)
            return
        }
        
        DataManager.manager.insertUser(user: User(username: uname, password: pwd))
        if let navController = navigationController {
            navController.popViewController(animated: true)
        }
    }
}
