//
//  TrafficLightsPhasesIterator.swift
//  Exercise
//
//  Created by Jordan Gordeev on 22.11.24.
//

import Foundation

struct TrafficLightsPhasesIterator {
	private var currentColor: TrafficLightsColor = .red
	
	mutating func nextPhase() -> (TrafficLightsColor, TimeInterval) {
		let nextColor: TrafficLightsColor
		switch currentColor {
		case .red:
			nextColor = .green
		case .orange:
			nextColor = .red
		case .green:
			nextColor = .orange
		}
		
		let duration: TimeInterval
		switch nextColor {
		case .red:
			duration = 4
		case .orange:
			duration = 1
		case .green:
			duration = 4
		}
		
		currentColor = nextColor
		
		return (nextColor, duration)
	}
}
