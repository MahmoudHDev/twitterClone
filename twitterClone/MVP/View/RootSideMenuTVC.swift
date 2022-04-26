//
//  RootSideMenuTVC.swift
//  twitterClone
//
//  Created by Mahmoud on 4/23/22.
//

import UIKit

class RootSideMenuTVC: UITableViewController {

    //Properties
    var arrTitles = ["Profile", "Lists", "Bookmarks", "Moments"]
    var arrImgs   : [UIImage] = []
    
    // Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(profilePhotoTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(optionTapped))
        
        appendImages()
        
    }
    
    func appendImages() {
        arrImgs.append(SFSymbols.home!)
        arrImgs.append(SFSymbols.lists!)
        arrImgs.append(SFSymbols.bookmarks!)
        arrImgs.append(SFSymbols.moments!)
    }
    
    @objc func profilePhotoTapped() {
        // Profile Photo Configurations
        print("profile Photo must be here")
    }

    
    @objc func optionTapped(){
        print("accountsIcon")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return arrTitles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrTitles[indexPath.row]
        cell.imageView?.image = arrImgs[indexPath.row]
        
        return cell
    }
    
    
    enum SFSymbols: CaseIterable {
        static let home = UIImage(systemName: "person")
        static let lists = UIImage(systemName: "note.text")
        static let bookmarks = UIImage(systemName: "bookmark")
        static let moments = UIImage(systemName: "bolt")
    }
    
    //MARK:- TableView Delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
