//
//  ViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 4/22/22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- Properties
    @IBOutlet weak var loginBtn     : UIButton!
    @IBOutlet weak var signUpBtn    : UIButton!
    @IBOutlet weak var welcLbl      : UILabel!
    @IBOutlet weak var descLbl      : UILabel!
    @IBOutlet weak var changeLang   : UIButton!
    
    let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageView.image = UIImage(named: "twitter-WhiteIcon")
        return imageView
    }()
    
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        updateUI()
        localizedLang()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            self.animate()
        }
    }
    
    //MARK:- Actions

    @IBAction func changeLangBtn(_ sender: UIButton) {
        let alert = UIAlertController(title: "Changing language", message: "To change the language you need to restart the application", preferredStyle: .alert)
        let action = UIAlertAction(title: "Restart", style: .default) { (_) in
            let currentLang = Locale.current.languageCode
            let newLang = currentLang == "en" ? "ar" : "en"
            UserDefaults.standard.setValue([newLang], forKey: "AppleLanguages")
            exit(0)
        }
        
        alert.addAction(action)
        present(alert, animated: true)


        
    }
    
    //MARK:- Functions
    
    func updateUI() {
        loginBtn.layer.cornerRadius = 5
        signUpBtn.layer.cornerRadius = 5
    }
    
    func localizedLang() {
        welcLbl.text = NSLocalizedString("hello", comment: "Welcome Message")
        
        descLbl.text = NSLocalizedString("desc", comment: "Describiton")
        
        loginBtn.setTitle(NSLocalizedString("signIn", comment: "Sign In"), for: .normal)
        
        signUpBtn.setTitle(NSLocalizedString("signUp", comment: "Sign Up"), for: .normal)
        
        changeLang.setTitle(NSLocalizedString("changeLang", comment: "Change the language"), for: .normal)
        
    }
    
    
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


/*
 how to change the langauge from the button
 
 
 let currentLang = Locale.current.languageCode
 let newLang = currentLang == "en" ? "ar" : "en"
 UserDefaults.standard.setValue([newLang], forKey: "AppleLanguages")
 exit(0)
 */
