//
//  HomeViewController.swift
//  HeroApp
//
//  Created by ศุภกานต์ on 13/10/2562 BE.
//  Copyright © 2562 EAMSC. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var TutorialButton: UIButton!
    
    @IBOutlet weak var SkipButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setUpElements()
    }
    
    func setUpElements() {
        
        Utilities.styleFilledButton(TutorialButton)
        
        Utilities.styleHollowButton(SkipButton)
    }
    
    @IBAction func TutorialTapped(_ sender: Any) {
        
        transitionTotutor()
    }
    
    @IBAction func SkipTapped(_ sender: Any) {
        
        transitionTomain()
    }
    
    func transitionTomain () {
        
        let mainViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.mainViewController) as?
        MainViewController
        
        view.window?.rootViewController = mainViewController
        view.window?.makeKeyAndVisible()
    }
    
    func transitionTotutor() {
        
        let tutorViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.tutorViewController) as?
        TutorialViewController
        
        view.window?.rootViewController = tutorViewController
        view.window?.makeKeyAndVisible()
    }
    
}
