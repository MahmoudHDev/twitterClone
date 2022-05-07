//
//  ViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 4/22/22.
//

import UIKit

class ViewController: UIViewController {
    // this viewController responsible for the fade and animation of the launch screen but still need some functions
    //MARK:- Properties
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    let imageView: UIImageView = {
       let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageView.image = UIImage(named: "twitter-WhiteIcon")
        return imageView
    }()     // parenthess a structure
    
    //MARK:- LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        loginBtn.layer.cornerRadius = 5
        signUpBtn.layer.cornerRadius = 5
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            self.animate()
        }
    }
    //MARK:- Methods

    private func animate() {
        UIView.animate(withDuration: 0.5) {
            let size = self.view.frame.size.width * 3
            let diffX = size - self.view.frame.size.width
            let diffY = size - self.view.frame.size.height - size
            
            self.imageView.frame = CGRect(
                x: -(diffX/2),
                y: diffY/2,
                width: size,
                height: size
            )
        }
        UIView.animate(withDuration: 1) {
            self.imageView.alpha = 0
        }
    }

}

