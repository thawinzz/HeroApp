//
//  CViewController.swift
//  HeroApp
//
//  Created by ศุภกานต์ on 14/10/2562 BE.
//  Copyright © 2562 EAMSC. All rights reserved.
//

import UIKit

class CViewController: UIViewController {

    @IBOutlet weak var NextButton: UIButton!
    
    @IBOutlet weak var BackButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
    }
    
    func setUpElements() {
           
           Utilities.styleHollowButton(BackButton)
           Utilities.styleHollowButton(NextButton)

       }
    
    @IBAction func NextTapped(_ sender: Any) {
        
        transitionTodvc()
    }
    
    @IBAction func BackTapped(_ sender: Any) {
        
        transitionTobvc()
    }
    
    func transitionTobvc() {
        
        let bViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.bViewController) as?
        BViewController
        
        view.window?.rootViewController = bViewController
        view.window?.makeKeyAndVisible()
    }
    
    func transitionTodvc() {
        
        let dViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.dViewController) as?
        DViewController
        
        view.window?.rootViewController = dViewController
        view.window?.makeKeyAndVisible()
    }
    
}
