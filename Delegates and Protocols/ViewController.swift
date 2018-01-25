//
//  ViewController.swift
//  Delegates and Protocols
//
//  Created by Cullen Mooney on 1/24/18.
//  Copyright © 2018 Cullen Mooney. All rights reserved.
//

import UIKit
// Passing data back
// Step 1 - creating the protocol in our second view controller
// Step 2 - declaring the protocol that our class conforms to
// Step 3 - implement the required delegate method and set the delegate

class ViewController: UIViewController, CanReceive {
    
    var dataPassedBack = ""

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "sendDataForwards", sender: self)
    }
    
    @IBAction func changeColorBlue(_ sender: Any) {
        view.backgroundColor = UIColor.blue
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sendDataForwards" {
            let secondVC = segue.destination as! SecondViewController
            
            secondVC.data = textField.text!
            // setting the second view controllers delegate as the current view controller
            secondVC.delegate = self
        }
    }
    
    func dataReceived(data: String) {
        label.text = data
    }
}

