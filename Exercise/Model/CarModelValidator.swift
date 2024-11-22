//
//  CarModelValidator.swift
//  Exercise
//
//  Created by Jordan Gordeev on 22.11.24.
//

struct CarModelValidator {
	let kMinLength = 3
	
	// Returns nil when validation is successful or an error message on failure.
	func validate(_ carModel: String) -> String? {
		if carModel.count >= kMinLength {
			return nil
		} else {
			return "⚠️ At least \(kMinLength) characters are required"
		}
	}
}
