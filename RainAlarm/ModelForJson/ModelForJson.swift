//
//  TestModel.swift
//  RainAlarm
//
//  Created by artem on 19.02.2023.
//

import Foundation

struct ModelForJson: Codable {
    let lat: Double?
    let lon: Double?
    let timezone: String?
    let hourly: [Hourly]?
}

struct Hourly: Codable {
    let dt: Int?
    let weather: [Weather1]?
}

struct Weather1: Codable {
    let id: Int?
    let main: String?
}
