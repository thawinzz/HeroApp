//
//  AViewController.swift
//  HeroApp
//
//  Created by ศุภกานต์ on 14/10/2562 BE.
//  Copyright © 2562 EAMSC. All rights reserved.
//

import UIKit

class AViewController: UIViewController {

    @IBOutlet weak var BackButton: UIButton!
    
    @IBOutlet weak var NextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
    }
    
    func setUpElements() {
        
        Utilities.styleHollowButton(BackButton)
        Utilities.styleHollowButton(NextButton)

    }

    
    @IBAction func BackTapped(_ sender: Any) {
        
        transitionTotutor()
    }
    
    @IBAction func NextTapped(_ sender: Any) {
        
        transitionTobvc()
    }
    
    func transitionTotutor() {
        
        let tutorViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.tutorViewController) as?
        TutorialViewController
        
        view.window?.rootViewController = tutorViewController
        view.window?.makeKeyAndVisible()
    }
    
    func transitionTobvc() {
        
        let bViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.bViewController) as?
        BViewController
        
        view.window?.rootViewController = bViewController
        view.window?.makeKeyAndVisible()
    }
    
}
