//
//  SecondViewController.swift
//  Delegates and Protocols
//
//  Created by Cullen Mooney on 1/24/18.
//  Copyright © 2018 Cullen Mooney. All rights reserved.
//

import UIKit

// first step in passing data back is creating a protocol
protocol CanReceive {
    func dataReceived(data: String)
}

class SecondViewController: UIViewController {
    // delegate might be nil - hence optional
    var delegate : CanReceive?
    
    // Data that is going to be passed over
    var data = ""
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        label.text = data
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendDataBack(_ sender: Any) {
        delegate?.dataReceived(data: textField.text!)
        dismiss(animated: true, completion: nil)
    }
    

}
