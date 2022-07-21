//
//  ViewController.swift
//  Tesla_POC
//
//  Created by ANUJ KUMAR on 19/07/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    func setUpElements() {
        // Style the elements
        Utilities.styleFilledButton(loginButton)
        Utilities.styleFilledButton(registerButton)
    }

}

