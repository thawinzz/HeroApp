//
//  BViewController.swift
//  HeroApp
//
//  Created by ศุภกานต์ on 14/10/2562 BE.
//  Copyright © 2562 EAMSC. All rights reserved.
//

import UIKit

class BViewController: UIViewController {

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
    
    @IBAction func NextTapped(_ sender: Any) {
        
        transitionTocvc()
    }
    
    @IBAction func BackTapped(_ sender: Any) {
        
        transitionToavc()
    }
    
    func transitionToavc () {
           
        let aViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.aViewController) as?
        AViewController
           
           view.window?.rootViewController = aViewController
           view.window?.makeKeyAndVisible()
       }
    
    func transitionTocvc () {
        
        let cViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.cViewController) as?
        CViewController
        
        view.window?.rootViewController = cViewController
        view.window?.makeKeyAndVisible()
    }
    
    
}
