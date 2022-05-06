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
    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var remainingLbl: UILabel!
    var maxCount = 280
    //MARK:- View LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        profilePhoto.layer.cornerRadius = 15
        tweetTextView.delegate = self
        tweetTextView.layer.cornerRadius = 5
        tweetTextView.layer.borderWidth = 0.3
        
//        tweetTextView.addShadow(color: .systemBlue, offset: CGSize(width: 1, height: 1))
        
        tweetTextView.text = "What's happening?"
        tweetTextView.textColor = UIColor.lightGray
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
        // Firebase
        let tweetsDB  = Database.database().reference().child("Tweets")
        var currentUser = Auth.auth().currentUser?.email
        // add the textField
        let tweetDict = ["username":currentUser, "tweet": tweetTextView.text!]
        tweetsDB.childByAutoId().setValue(tweetDict){ (error , refrence) in
            if error != nil {
                print("Error has been occured while sending the tweet")
                print("Error \(error?.localizedDescription)")
            }else {
                self.dismiss(animated: true, completion: nil)
                self.tweetTextView.text = ""
                print("TWeet Has been sent check the DB ")
            }
        }
        
    }
}
//MARK:- TextView Delegate

extension CreateATweetViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        let r = tweetTextView.text.precomposedStringWithCanonicalMapping.unicodeScalars.count
        if r < maxCount {
            maxCount -= 1
            remainingLbl.text = "\(maxCount) Charachters Remainig"
        }else{
            
            maxCount += 1
            remainingLbl.text = "\(maxCount) Max Charachters"
            remainingLbl.textColor = UIColor.red
        }
        
        print(textView.text)
        print("DidChange")
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if range.length + range.location > (tweetTextView.text).count {
            
            return false
        }
        let newLength = (tweetTextView.text).count + (text).count - range.length
        
        return newLength <= 280
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
        
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "What's happening?"
            textView.textColor = UIColor.lightGray
        }
        print("DidEndEditing")
        print(textView.text)
        
    }
    
}
//MARK:- an extension to make a shadow for the textField or TextView

extension UIView {
    func addShadow(color: UIColor, radius: CGFloat = 1, offset: CGSize ) {
        self.layoutIfNeeded()
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
}
