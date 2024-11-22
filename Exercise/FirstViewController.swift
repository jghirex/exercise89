//
//  FirstViewController.swift
//  Exercise
//
//  Created by Jordan Gordeev on 22.11.24.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var validationErrorLabel: UILabel!
	@IBOutlet weak var startDrivingButton: UIButton!

	var carModelValidator = CarModelValidator()
	
	override func viewDidLoad() {
		super.viewDidLoad()

		textField.delegate = self
		performValidation()
	}
	
	@IBAction func textFieldDidChange(_ sender: Any) {
		performValidation()
	}
	
	func performValidation() {
		let carModel = textField.text ?? ""
		if let errMsg = carModelValidator.validate(carModel) {
			validationErrorLabel.text = errMsg
			validationErrorLabel.isHidden = false
			startDrivingButton.isEnabled = false
		} else {
			validationErrorLabel.isHidden = true
			startDrivingButton.isEnabled = true
		}
	}
	
	@IBAction func startDrivingButtonTapped(_ sender: Any) {
		textField.resignFirstResponder()
		performSegue(withIdentifier: "goToSecondScreen", sender: self)
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "goToSecondScreen" {
			let secondViewController = segue.destination as! SecondViewController
			secondViewController.carModel = self.textField.text ?? ""
		}
    }
}
