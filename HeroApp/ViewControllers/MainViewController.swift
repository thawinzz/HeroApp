//
//  MainViewController.swift
//  HeroApp
//
//  Created by ศุภกานต์ on 13/10/2562 BE.
//  Copyright © 2562 EAMSC. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var CallButton: UIButton!
    
    @IBOutlet weak var NotifButton: UIButton!
    
    @IBOutlet weak var HospitalButton: UIButton!
    
    @IBOutlet weak var ProfileButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func CallTapped(_ sender: Any) {
        
        transitionTocall()
    }
    
    @IBAction func NotifTapped(_ sender: Any) {
        
        transitionTonotif()
    }
    
    @IBAction func HospitalTapped(_ sender: Any) {
        
        transitionTohospital()
    }
    
    @IBAction func ProfileTapped(_ sender: Any) {
        
        transitionToprofile()
    }
    
   
    
    func transitionTocall() {
    
        let callViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.callViewController) as?
        CallViewController
    
        view.window?.rootViewController = callViewController
        view.window?.makeKeyAndVisible()
        
    }
    
    func transitionTonotif() {
    
        let notifViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.notifViewController) as?
        NotificationViewController
    
        view.window?.rootViewController = notifViewController
        view.window?.makeKeyAndVisible()
        
    }
    
    func transitionTohospital() {
    
        let hospitalViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.hospitalViewController) as?
        HospitalViewController
    
        view.window?.rootViewController = hospitalViewController
        view.window?.makeKeyAndVisible()
        
    }
    
    func transitionToprofile() {
    
        let profileViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.profileViewController) as?
        ProfileViewController
    
        view.window?.rootViewController = profileViewController
        view.window?.makeKeyAndVisible()
        
    }
    
}
