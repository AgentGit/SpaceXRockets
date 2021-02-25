//
//  Rocket.swift
//  SpaceXRockets
//
//  Created by Chad Goodyear on 25/2/21.
//

import SwiftUI

struct Rocket: Codable, Identifiable {
    let name: String?
    let flickrImages: [String]?
    let active: Bool?
    let costPerLaunch, successRatePct: Int?
    let firstFlight, country: String?
    let wikipedia: String?
    let rocketDescription, id: String?
    
    var ratingColour: Color {
        let rating = successRatePct ?? 100
        switch rating {
        case 0...29: return Color.red
        case 30...59: return Color.orange
        default: return Color.green
        }
    }

    enum CodingKeys: String, CodingKey {
        case name
        case flickrImages = "flickr_images"
        case active
        case costPerLaunch = "cost_per_launch"
        case successRatePct = "success_rate_pct"
        case firstFlight = "first_flight"
        case country
        case wikipedia
        case rocketDescription = "description"
        case id
    }
}

typealias Rockets = [Rocket]

struct MockData {
    
    static let sampleRocket = Rocket(name: "Ajax", flickrImages: ["https://farm5.staticflickr.com/4599/38583829295_581f34dd84_b.jpg"], active: true, costPerLaunch: 9000000, successRatePct: 50, firstFlight: "1985-01-01", country: "United States", wikipedia: "https://en.wikipedia.org/wiki/Flash_Gordon_(film)", rocketDescription: " General Kala dispatches the war rocket Ajax to kill Flash, but the hawkmen ambush and seize the rocket. Meanwhile, Princess Aura overpowers her guard and frees Barin and Zarkov from the execution chamber. Flash and the hawkmen attack Mingo City in Ajax and Kala activates the defenses as Ming's and Dale's wedding begins. Mingo City's lightning field can only be penetrated by flying Ajax into it at a suicidal speed. Flash volunteers to stay at the helm to ensure success and enable the hawkmen to invade the city.", id: "666")
}
