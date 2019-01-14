//
//  ViewController.swift
//  Spectrum
//
//  Created by Harish on 14/12/18.
//  Copyright © 2018 Harish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let cellID = "UserCellId"
    @IBOutlet weak var userList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userList.reloadData()
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.manager.userCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = DataManager.manager.getUserName(at: indexPath.row)
        return cell
    }
}
