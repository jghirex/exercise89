//
//  SecondViewController.swift
//  Exercise
//
//  Created by Jordan Gordeev on 22.11.24.
//

import UIKit

class SecondViewController: UIViewController {
	
	var carModel: String = ""
	
	@IBOutlet weak var carModelLabel: UILabel!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		carModelLabel.text = carModel
	}
}
