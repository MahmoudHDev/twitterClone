//
//  ProfileBySearchPresenter.swift
//  twitterClone
//
//  Created by Mahmoud on 6/8/22.
//

import Foundation
import Firebase
//MARK:- view
protocol ProfileFromSearchView {
    func loadInfo(img: UIImage)
}

//MARK:- Presenter

class ProfileBySearchPresenter {
    //MARK:- Properties

    var view: ProfileFromSearchView?
    var storage = Storage.storage()
    
    //MARK:- Init
    init(view: ProfileFromSearchView) {
        self.view = view
    }
    
    //MARK:- Methods
    func loadImgs (url: String) {
        storage.reference(forURL: url).getData(maxSize: 1 * 1024 * 1024) { (data, err) in
            if let error = err {
                print(error.localizedDescription)
            }else {
                guard let safeData = UIImage(data: data ?? Data()) else {return}
                self.view?.loadInfo(img: safeData)
            }
            
        }
    }
    
    
}
