//
//  SearchVC+TextField.swift
//  twitterClone
//
//  Created by Mahmoud on 6/5/22.
//

import UIKit

extension SearchViewController: UITextFieldDelegate{
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let textSearch = textField.text else {return}
        print(textSearch)
    }
}
