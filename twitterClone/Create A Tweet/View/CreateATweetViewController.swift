//
//  CreateATweetViewController.swift
//  twitterClone
//
//  Created by Mahmoud on 4/26/22.
//

import UIKit
import Firebase
class CreateATweetViewController: UIViewController {
    
    //MARK:- Properties
    @IBOutlet weak var profilePhoto : UIImageView!
    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var remainingLbl : UILabel!
    
    lazy var presenter = NewTweetPresenter(view: self)
    var maxCount = 280
    
    //MARK:- View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        profilePhoto.layer.cornerRadius = 15
        updateTextView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.backgroundColor = .none
    }
    //MARK:- Methods
    
    
    //MARK:- Actions
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func tweetBtn(_ sender: Any) {
        // Firebase             // add the presenter
        presenter.sendTweet(tweetContent: tweetTextView.text)
        print("tweetBtn Tapped")
    }
    
}
//MARK:- Presenter Protocol
extension CreateATweetViewController: NewTweetPresenterView {
    
    func tweetSuccess(Tweet: String) {
        self.dismiss(animated: true, completion: nil)
        print("Tweet Has Been Sent")
    }
    
    
    func tweetError(error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dissmiss", style: .cancel, handler: nil))
        print(error)
    }
}

