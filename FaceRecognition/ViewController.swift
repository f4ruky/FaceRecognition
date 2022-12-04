//
//  ViewController.swift
//  FaceRecognition
//
//  Created by Faruk Yaşar on 4.12.2022.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    @IBOutlet weak var LabelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func SigninButton(_ sender: Any) {
        
        let authContext = LAContext()
        var error:  NSError?
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "is it you?") { success, error in
                if success == true{
                    //Successful auth
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)

                    }
                }
                else{
                    DispatchQueue.main.async {
                        self.LabelText.text = "error!"
                    }
                    
                }
            }
            
        }
        
    }
    
}

