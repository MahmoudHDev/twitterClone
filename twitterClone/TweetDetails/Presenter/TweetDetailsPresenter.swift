//
//  TweetDetailsPresenter.swift
//  twitterClone
//
//  Created by Mahmoud on 5/14/22.
//

import Foundation
//MARK:- The Presenter Protocol

protocol TweetDetailsView {
    func viewTweet()
}
//MARK:- The Presenter

class TweetDetailsPresenter {
    
    //MARK:- Properties
    var view: TweetDetailsView?
    
    //MARK:- Init
    init(view: TweetDetailsView) {
        self.view = view
    }
    
    //MARK:- Methods
    // show the details
    // add comments

    
}
