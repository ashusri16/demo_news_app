//
//  LoginPageViewController.swift
//  DemoApp
//
//  Created by Ashutosh Srivastava on 02/05/21.
//

import UIKit

class LoginPageViewController: UIViewController {
    
    @IBOutlet weak var iUserNameTextField: UITextField!
    @IBOutlet weak var iPasswordTextField: UITextField!
    @IBOutlet weak var iLoginButton: UIButton!
    
    private let dummyDatabase = [User(username: "user123",password: "123456")]
    private let validation: ValidationService
    
    init(validation: ValidationService){
        self.validation = validation
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.validation = ValidationService()
        super.init(coder: coder)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        iUserNameTextField.layer.cornerRadius = 5.0
        iPasswordTextField.layer.cornerRadius = 5.0
        iLoginButton.layer.cornerRadius = 25.0
    }
    
    
    @IBAction func pressedLoginButton(_ sender: Any) {
        do{
            let username = try validation.validateUser(iUserNameTextField.text)
            let password = try validation.validatePassword(iPasswordTextField.text)
            let isAuthorised = validation.authenticateCredentials(username, password)
            
            
            if isAuthorised{
                let vc = ViewController()
                present(vc, animated: true)
            }else{
                throw LoginError.wrongCredentials
            }
        }catch{
            presentAlert(error.localizedDescription)
        
        }
    }
    
    enum LoginError: LocalizedError{
        case wrongCredentials
        
        var errorDescription: String?{
            switch self {
            case .wrongCredentials:
                return "Entered credentials doesnt match"
            }
        }
    }
    func presentAlert(_ message: String){
        let alert = UIAlertController(title: message, message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: { (alertAction) in
            
        }))
        self.present(alert, animated:true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
