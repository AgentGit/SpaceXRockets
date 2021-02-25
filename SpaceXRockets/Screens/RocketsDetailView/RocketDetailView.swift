//
//  RocketDetailView.swift
//  SpaceXRockets
//
//  Created by Chad Goodyear on 25/2/21.
//

import SwiftUI
import Kingfisher

struct RocketDetailView: View {
    
    let rocket: Rocket
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                KFImage(URL(string: rocket.flickrImages?.first ?? ""))
                    .cancelOnDisappear(true)
                    .resizable()
                    .frame(width: 300, height: 250)
                
                VStack {
                    //Title
                    Text(rocket.name  ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    //Discription
                    Text(rocket.rocketDescription ?? "")
                        .multilineTextAlignment(.center)
                        .font(.body)
                        .padding()
                    
                    //Rating
                    Image("starFilled")
                        .renderingMode(.template)
                        .foregroundColor(rocket.ratingColour)
                
                    //RocketInfo
                    RocketInfo(title: "Country", value: rocket.country ?? "")
                        .padding()
                    HStack(spacing: 40) {
                        RocketInfo(title: "Cost", value: "$\(rocket.costPerLaunch?.shortLiteralDescription() ?? "Unknown")")
                        RocketInfo(title: "Active", value: rocket.active ?? false ? "YES" : "NO")
                    }
                }
                Spacer()
                
                Link(destination: URL(string: rocket.wikipedia ?? "https://en.wikipedia.org/wiki/SpaceX")!) {
                    SXButton(title: "\(rocket.name ?? "") - Learn More")
                }
                .padding(30)
            }
            .frame(width: 300)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40)
            .overlay(Button {
                isShowingDetail = false
            } label: {
                XDismissButton()
            }, alignment: .topTrailing)
        
        }
        .padding(.top, 40)
    }
}

struct RocketDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RocketDetailView(rocket: MockData.sampleRocket, isShowingDetail: .constant(true))
    }
}

struct RocketInfo: View {
    
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

