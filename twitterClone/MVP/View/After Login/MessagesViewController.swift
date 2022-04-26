//
//  MessagesViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 4/23/22.
//

import UIKit
import SideMenu
class MessagesViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var menu: SideMenuNavigationController?
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
        // Present the settings
//        present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
    }
    
    func updateSideMenu(){
        menu?.leftSide = true
        // CHANGE THIS
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
    
}
extension MessagesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    
    
}
