//
//  ViewController.swift
//  HeroApp
//
//  Created by ศุภกานต์ on 13/10/2562 BE.
//  Copyright © 2562 EAMSC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var SignUpButton: UIButton!
    
    @IBOutlet weak var LogInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        
        Utilities.styleFilledButton(SignUpButton)
        Utilities.styleHollowButton(LogInButton)
        
    }


}

