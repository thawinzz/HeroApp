//
//  SignUpViewController.swift
//  HeroApp
//
//  Created by ศุภกานต์ on 13/10/2562 BE.
//  Copyright © 2562 EAMSC. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class SignUpViewController: UIViewController {

    @IBOutlet weak var FirstNameTextField: UITextField!
    
    @IBOutlet weak var LastNameTextField: UITextField!
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBOutlet weak var SignUpButton: UIButton!
    
    @IBOutlet weak var ErrorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    
    func setUpElements() {
        
        ErrorLabel.alpha = 0
        
        Utilities.styleTextField(FirstNameTextField)
        
        Utilities.styleTextField(LastNameTextField)
        
        Utilities.styleTextField(EmailTextField)
        
        Utilities.styleTextField(PasswordTextField)
        
        Utilities.styleFilledButton(SignUpButton)
        
    }
    
    
    func validateFields() -> String? {
        
        if FirstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            LastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            PasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
        
            return "Please fill in all the required fields."
        }
        
        let cleanedPassword = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            
            return "Please make sure your password contains at least 8 characters, a number, and a special character."
        }
        
        return nil
    }
    

    @IBAction func SignUpTapped(_ sender: Any) {
        

        //Validate each textfields
        let error = validateFields()
        
        if error != nil {
            
            //displays error message
            showError(error!)

        }
        
        else {
            
            //user creation
            let firstname = FirstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastname = LastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //
            Auth.auth().createUser(withEmail: email, password: password) { (results, err) in
                
                //error detection
                if err != nil {
                    self.showError("There is an error creating user")
                }
                else {
                    
                    //success
                    let db = Firestore.firestore()
                
                    db.collection("users").addDocument(data: ["firstname":firstname, "lastname":lastname, "uid": results!.user.uid ]) { (error) in
                        
                        if error != nil {
                            
                            self.showError("User data couldn't be saved.")
                        }
                    }
                    
                    //to Home
                    self.trasitiontohomepage()
                }
            }
        }
    }
    
    func showError(_ message:String) {
        
        ErrorLabel.text = message
        ErrorLabel.alpha = 1
    }
    
    func trasitiontohomepage() {
        
        let homeViewController =
        storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    
    }
}
