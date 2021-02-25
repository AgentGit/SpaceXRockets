//
//  RocketsListViewModel.swift
//  SpaceXRockets
//
//  Created by Chad Goodyear on 25/2/21.
//

import SwiftUI
import Alamofire

final class RocketsListViewModel: ObservableObject {
    
    @Published var rockets: Rockets = []
    @Published var isLoading = false
    @Published var isShowingDetail = false
    @Published var selectedRocket: Rocket?
    @Published var alertItem: AlertItem?
    
    let columns: [GridItem] = [GridItem(.flexible(minimum: 160)),
                               GridItem(.flexible(minimum: 160))]
    
    func getRockets() {
        isLoading = true
        NetworkManager.shared.getRockets { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                switch result {
                case .success(let rockets):
                    self.rockets = rockets
                    
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }

    }
}

