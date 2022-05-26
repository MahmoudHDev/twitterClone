//
//  newTweet+PickerController.swift
//  twitterClone
//
//  Created by Mahmoud on 5/23/22.
//

import UIKit

extension CreateATweetViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            pickerController.dismiss(animated: true, completion: nil)
            print(image)
        }else {
            print("error")
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("User Did Cancel")
    }
}
