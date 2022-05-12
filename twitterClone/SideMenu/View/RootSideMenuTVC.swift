//
//  RootSideMenuTVC.swift
//  twitterClone
//
//  Created by Mahmoud on 4/23/22.
//

import UIKit

class RootSideMenuTVC: UITableViewController {

    //MARK:- Properties
    var arrTitles = ["Profile", "Lists", "Bookmarks", "Moments"]
    var arrImgs   : [UIImage] = []
    
    //MARK:- View LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(profilePhotoTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(optionTapped))
        appendImages()
        
    }
    
    //MARK:- Methods
    @objc func profilePhotoTapped() {
        // Profile Photo Configurations
        print("profile Photo must be here")
    }

    @objc func optionTapped(){
        print("accountsIcon")
    }

    func appendImages() {
        arrImgs.append(SFSymbols.home!)
        arrImgs.append(SFSymbols.lists!)
        arrImgs.append(SFSymbols.bookmarks!)
        arrImgs.append(SFSymbols.moments!)
    }
    enum SFSymbols: CaseIterable {
        static let home = UIImage(systemName: "person")
        static let lists = UIImage(systemName: "note.text")
        static let bookmarks = UIImage(systemName: "bookmark")
        static let moments = UIImage(systemName: "bolt")
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTitles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrTitles[indexPath.row]
        cell.imageView?.image = arrImgs[indexPath.row]
        return cell
    }
    
    //MARK:- TableView Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            print("Show Profile")
            let storyBoard = UIStoryboard(name: "Profile", bundle: nil)
            let vc = storyBoard.instantiateViewController(identifier: "showProfile")
            present(vc, animated: true, completion: nil)
            
        case 1:
            print("Show Lists")
        case 2:
            print("Show Bookmarks")
        default:
            print("Show Moments")
        }
        
    }
}
