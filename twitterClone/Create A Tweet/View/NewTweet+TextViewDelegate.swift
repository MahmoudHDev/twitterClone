//
//  NewTweet+TextViewDelegate.swift
//  twitterClone
//
//  Created by Mahmoud on 5/7/22.
//

import UIKit
//MARK:- TextView Delegate

extension CreateATweetViewController: UITextViewDelegate {
    
    func updateTextView(){
        tweetTextView.delegate = self
        tweetTextView.layer.cornerRadius = 5
        tweetTextView.layer.borderWidth = 0.3
//        tweetTextView.addShadow(color: .systemBlue, offset: CGSize(width: 1, height: 1))
        tweetTextView.text = "What's happening?"
        tweetTextView.textColor = UIColor.lightGray
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty {
            tweetBttn.isEnabled = false
        }else{
            tweetBttn.isEnabled = true
        }
        let r = tweetTextView.text.precomposedStringWithCanonicalMapping.unicodeScalars.count
        if r < maxCount {
            maxCount -= 1
            remainingLbl.text = "\(maxCount) Charachters Remainig"
        }else{
            
            maxCount += 1
            remainingLbl.text = "\(maxCount) Max Charachters"
            remainingLbl.textColor = UIColor.red
        }
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
            tweetBttn.isEnabled = false
            textView.text = "What's happening?"
            textView.textColor = UIColor.lightGray
        }else{
            tweetBttn.isEnabled = true
        }
        print("DidEndEditing")
    }

    
}
