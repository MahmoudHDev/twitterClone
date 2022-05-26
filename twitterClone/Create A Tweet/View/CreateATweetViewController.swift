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
    lazy var presenter = NewTweetPresenter(view: self)
    @IBOutlet weak var tweetBttn    : UIBarButtonItem!
    @IBOutlet weak var profilePhoto : UIImageView!
    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var remainingLbl : UILabel!
    let pickerController = UIImagePickerController()
    let barButtonApperance = UIBarButtonItemAppearance()
    var maxCount = 280
    
    //MARK:- View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerController.delegate = self
        pickerController.mediaTypes = ["public.image","public.movie"]
        tweetTextView.becomeFirstResponder()
        let tapGesture = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        profilePhoto.layer.cornerRadius = 15
        updateTextView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.backgroundColor = .none
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("View Disappeared")
    }
    
    //MARK:- Actions
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func tweetBtn(_ sender: Any) {
        tweetBttn.isEnabled = false
        presenter.sendTweet(tweetContent: tweetTextView.text!)
        print("tweetBtn Tapped")
    }
    
    @IBAction func insertImg(_ sender: UIButton) {
        // UIImage picker by Library
        pickerController.allowsEditing = true
        pickerController.sourceType = .photoLibrary
        pickerController.sourceType = .savedPhotosAlbum
        self.present(pickerController, animated: true)
    }
    
    @IBAction func cameraImage(_ sender: UIButton) {
        // UIImage Picker by camera
        pickerController.sourceType = .camera
        pickerController.allowsEditing = true
        present(pickerController, animated: true)
    }
}

//MARK:- Presenter Protocol
extension CreateATweetViewController: NewTweetPresenterView {
    
    func tweetSuccess(Tweet: String) {
        self.dismiss(animated: true, completion: nil)
        NotificationCenter.default.post(name: NSNotification.Name("newDataNotif"), object: nil)
        print("Tweet Has Been Sent")
    }
    
    func tweetError(error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dissmiss", style: .cancel, handler: nil))
        print(error)
    }
    
}
