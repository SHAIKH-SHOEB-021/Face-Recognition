//
//  ViewController.swift
//  Face Recognition
//
//  Created by shoeb on 24/01/23.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var helloLBL: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func Move(_ sender: Any) {
        let authContext = LAContext()
        var error : NSError?
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is It You"){ (success, error) in
                if success == true{
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "worldViewController", sender: nil)
                    }
                }else{
                    DispatchQueue.main.async {
                        self.helloLBL.text = "Error!"
                    }
                }
            }
        }
    }
    
}

