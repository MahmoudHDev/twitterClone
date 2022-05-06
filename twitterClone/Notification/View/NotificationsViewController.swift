//
//  NotificationsViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 4/23/22.
//

import UIKit
import SideMenu

class NotificationsViewController: UIViewController {
    
    //MARK:- Properties
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentBar: UISegmentedControl!
    var menu: SideMenuNavigationController?

    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        menu = SideMenuNavigationController(rootViewController: RootSideMenuTVC())
        updateSideMenu()
    }
    //MARK:- Methods
    func updateSideMenu(){
        menu?.leftSide = true
        // CHANGE THIS
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
    //MARK:- Actions
    @IBAction func sideMenuBtn(_ sender: UIBarButtonItem) {
        
        present(menu!, animated: true)
    }
    @IBAction func segmentedButtons(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 1 {
            tableView.backgroundColor = .systemBlue
        }else{
            tableView.backgroundColor = .black
        }
    }

}
//MARK:- UITableView DataSource
extension NotificationsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    }
