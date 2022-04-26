//
//  ViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 4/22/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var signUpBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.layer.cornerRadius = 5
        signUpBtn.layer.cornerRadius = 5
    }


}

