//
//  RocketsListView.swift
//  SpaceXRockets
//
//  Created by Chad Goodyear on 25/2/21.
//

import SwiftUI

struct RocketsListView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @StateObject var viewModel = RocketsListViewModel()
    
    var body: some View {
        Group {
            if horizontalSizeClass == .compact {
                ZStack {
                    NavigationView {
                        List(viewModel.rockets) { rocket in
                            RocketListCell(rocket: rocket)
                                .onTapGesture {
                                    viewModel.selectedRocket = rocket
                                    viewModel.isShowingDetail = true
                                }
                            
                        }
                        .navigationTitle("🚀 SpaceX Rockets")
                        .disabled(viewModel.isShowingDetail)
                    }
                    .onAppear {
                        viewModel.getRockets()
                    }
                    .blur(radius: viewModel.isShowingDetail ? 20 : 0)
                    
                    if viewModel.isShowingDetail {
                        RocketDetailView(rocket: viewModel.selectedRocket!, isShowingDetail: $viewModel.isShowingDetail)
                    }
                    
                    if viewModel.isLoading {
                        LoadingView()
                    }
                }
                .alert(item: $viewModel.alertItem) { alertItem in
                    Alert(title: alertItem.title,
                          message: alertItem.message,
                          dismissButton: alertItem.dismissButton)
                }
            } else {
                ScrollView {
                    LazyVGrid(columns: viewModel.columns) {
                        ForEach(viewModel.rockets) { rocket in
                            RocketListCell(rocket: rocket)
                                .onTapGesture {
                                    viewModel.selectedRocket = rocket
                                }
                        }
                    }
                    .navigationTitle("🚀 SpaceX Rockets")
                    .onAppear {
                        viewModel.getRockets()
                    }
                    
                }
                //This dosent appear to be allowed due to the 'if horizontalSizeClass' on line 16
//                .sheet(isPresented: $viewModel.isShowingDetail) {
//                    RocketDetailView(rocket: viewModel.selectedRocket, isShowingDetail: $viewModel.isShowingDetail)
//                }
                
            }
        }
    }
}

struct RocketsListView_Previews: PreviewProvider {
    static var previews: some View {
        RocketsListView()
    }
}
