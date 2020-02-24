//
//  SignInViewController.swift
//  MovieAssignmentApp
//
//  Created by Malith on 2/24/20.
//  Copyright © 2020 Malith. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //key board dismiss
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        //move viewup when editing
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
    // Move view 150 points upward
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -100
    }
    // Move view to original position
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0
    }

    
    //keyboard dismiss
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showAlert(){
        // create the alert
        let alert = UIAlertController(title: "Sign In", message: "Fill all fields!", preferredStyle: .alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    

    
    

    @IBAction func SignIn(_ sender: Any) {
        
        guard let userNameTxt = userName.text, !userNameTxt.isEmpty else {
            showAlert()
            print("username is empty")
            return
        }
        
        guard let passwordTxt = password.text, !passwordTxt.isEmpty else{
            showAlert()
            print("password is empty")
            return
        }
        
        performSegue(withIdentifier: "goToMovieList", sender: nil)
    }
    
    
    

}
