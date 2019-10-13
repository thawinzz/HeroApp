//
//  DViewController.swift
//  HeroApp
//
//  Created by ศุภกานต์ on 14/10/2562 BE.
//  Copyright © 2562 EAMSC. All rights reserved.
//

import UIKit

class DViewController: UIViewController {

    
    @IBOutlet weak var BackButton: UIButton!
    
    @IBOutlet weak var ContinueButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
    }
    
    func setUpElements() {
           
           Utilities.styleHollowButton(BackButton)
        Utilities.styleHollowButton(ContinueButton)
        
       }
    
    @IBAction func BackTapped(_ sender: Any) {
        
        transitionTocvc()
    }
    
    
    @IBAction func ContinueTapped(_ sender: Any) {
        
        transitionTomain()
    }
    
    func transitionTocvc () {
        
        let cViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.cViewController) as?
        CViewController
        
        view.window?.rootViewController = cViewController
        view.window?.makeKeyAndVisible()
    }
    
    func transitionTomain () {
        
        let mainViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.mainViewController) as?
        MainViewController
        
        view.window?.rootViewController = mainViewController
        view.window?.makeKeyAndVisible()
    }
    
}
