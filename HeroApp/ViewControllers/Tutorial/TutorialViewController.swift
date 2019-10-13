//
//  TutorialViewController.swift
//  HeroApp
//
//  Created by ศุภกานต์ on 13/10/2562 BE.
//  Copyright © 2562 EAMSC. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {
    
    @IBOutlet weak var Logo: UIImageView!
    
    @IBOutlet weak var FirstLabel: UILabel!
    
    @IBOutlet weak var SecondLabel: UILabel!
    
    @IBOutlet weak var NextButton: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setUpElements()
    }
    
    func setUpElements() {
        
        Utilities.styleHollowButton(NextButton)
        
    }
    
    
    @IBAction func NextTapped(_ sender: Any) {
        transitionToavc()
    }
    
    func transitionToavc () {
           
           let aViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.aViewController) as?
           AViewController
           
           view.window?.rootViewController = aViewController
           view.window?.makeKeyAndVisible()
       }
    
}
