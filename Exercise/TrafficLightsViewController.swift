//
//  TrafficLightsViewController.swift
//  Exercise
//
//  Created by Jordan Gordeev on 22.11.24.
//

import UIKit

class TrafficLightsViewController: UIViewController {
	@IBOutlet weak var redSegment: UIView!
	@IBOutlet weak var orangeSegment: UIView!
	@IBOutlet weak var greenSegment: UIView!
	
	var phasesIterator = TrafficLightsPhasesIterator()
	var timer: Timer!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		startNextPhase(animated: false)
    }
	
	func startNextPhase(animated: Bool) {
		let (color, duration) = phasesIterator.nextPhase()
		if animated {
			UIView.animate(withDuration: 0.2) {
				self.switchTo(color)
			}
		} else {
			switchTo(color)
		}
		timer = Timer.scheduledTimer(withTimeInterval: duration, repeats: false, block: { [weak self] _ in
			self?.startNextPhase(animated: true)
		})
	}
	
	func switchTo(_ color: TrafficLightsColor) {
		switch color {
		case .red:
			configureRed(isOn: true)
			configureOrange(isOn: false)
			configureGreen(isOn: false)

		case .orange:
			configureRed(isOn: false)
			configureOrange(isOn: true)
			configureGreen(isOn: false)

		case .green:
			configureRed(isOn: false)
			configureOrange(isOn: false)
			configureGreen(isOn: true)
		}
	}
	
	func configureRed(isOn: Bool) {
		redSegment.backgroundColor = isOn ? UIColor(.tlRed) : UIColor(.tlOff)
	}
	
	func configureOrange(isOn: Bool) {
		orangeSegment.backgroundColor = isOn ? UIColor(.tlOrange) : UIColor(.tlOff)
	}
	
	func configureGreen(isOn: Bool) {
		greenSegment.backgroundColor = isOn ? UIColor(.tlGreen) : UIColor(.tlOff)
	}
	
	deinit {
		timer?.invalidate()
	}
}
