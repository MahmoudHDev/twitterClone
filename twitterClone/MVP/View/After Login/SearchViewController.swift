//
//  SearchViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 4/23/22.
//

import UIKit
import SideMenu
class SearchViewController: UIViewController {

    var menu: SideMenuNavigationController?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none

        menu = SideMenuNavigationController(rootViewController: RootSideMenuTVC())
        updateSideMenu()
    }
        
    @IBAction func sideMenuBtn(_ sender: UIBarButtonItem) {
        present(menu!, animated: true)

    }
    
    @IBAction func settingsBtn(_ sender: UIBarButtonItem) {
        print("Settings")
    }
    
    func updateSideMenu(){
        menu?.leftSide = true
        // CHANGE THIS
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
}
extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    
}
