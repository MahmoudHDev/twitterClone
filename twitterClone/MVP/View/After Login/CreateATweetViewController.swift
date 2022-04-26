//
//  CreateATweetViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 4/26/22.
//

import UIKit

class CreateATweetViewController: UIViewController {

    @IBOutlet weak var tweetButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mainCustomBtntweetBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        mainCustomBtntweetBtn.layer.cornerRadius = 15
        mainCustomBtntweetBtn.backgroundColor = .systemBlue
        mainCustomBtntweetBtn.setTitleColor(.white, for: .normal)
        mainCustomBtntweetBtn.setTitle("  Tweet  ", for: .normal)
        let tweetBtn = UIBarButtonItem(customView: mainCustomBtntweetBtn)
        navigationItem.rightBarButtonItem = tweetBtn
        navigationController?.navigationBar.backgroundColor = .none
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
