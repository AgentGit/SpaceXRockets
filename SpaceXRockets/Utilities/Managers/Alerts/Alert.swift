//
//  Alert.swift
//  SpaceXRockets
//
//  Created by Chad Goodyear on 25/2/21.
//

import SwiftUI

struct AlertItem: Identifiable {
    var id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button?
}

struct AlertContext {
    
    //MARK:- Network Alerts
    static let invalidURL           = AlertItem(title: Text("Server Error"),
                                                message: Text("The data recieved from the server was invalid. Please contact support"),
                                                dismissButton: .default(Text("Ok")))
    
    static let invalidResponse      = AlertItem(title: Text("Server Error"),
                                                message: Text("Invalid response from the server. Please try again later or contact support"),
                                                dismissButton: .default(Text("Ok")))
    
    static let invalidData          = AlertItem(title: Text("Server Error"),
                                                message: Text("There was an issue connecting to the server. If this persists, please contact support."),
                                                dismissButton: .default(Text("Ok")))
    
    static let unableToComplete     = AlertItem(title: Text("Server Error"),
                                                message: Text("Unable to complete your request at this time. Please check your internet connection."),
                                                dismissButton: .default(Text("Ok")))
}
