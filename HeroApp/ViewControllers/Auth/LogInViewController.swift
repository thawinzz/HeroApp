//
//  LogInViewController.swift
//  HeroApp
//
//  Created by ศุภกานต์ on 13/10/2562 BE.
//  Copyright © 2562 EAMSC. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LogInViewController: UIViewController {

    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var LogInButton: UIButton!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    
    func setUpElements() {
        
        ErrorLabel.alpha = 0
        
        Utilities.styleTextField(EmailTextField)
        Utilities.styleTextField(PasswordTextField)
        Utilities.styleFilledButton(LogInButton)
    }
    
    func validateFields() -> String? {
        
        if  EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            PasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
                {
            
            return "Please fill in all the required fields."
        }
        
        return nil
    }
    

    @IBAction func LogInTapped(_ sender: Any) {
        
        //Check the TextFields
        let error = validateFields()
        
        if error != nil {
            
            showError(error!)
            
        }
        
        else {
        
        //Cleaned TextFields
        let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //To Home
        Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in
        
            if error != nil {
                
                self.ErrorLabel.text = error!.localizedDescription
                self.ErrorLabel.alpha = 1
            }
            else {
                
                let homeViewController =
                    self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
                }
            }
        }
    }
    
    func showError(_ message:String) {
        
        ErrorLabel.text = message
        ErrorLabel.alpha = 1
    }
}
