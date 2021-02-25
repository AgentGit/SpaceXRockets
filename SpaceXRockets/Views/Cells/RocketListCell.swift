//
//  SwiftUIView.swift
//  SpaceXRockets
//
//  Created by Chad Goodyear on 25/2/21.
//

import SwiftUI
import Kingfisher

struct RocketListCell: View {
    
    let rocket: Rocket
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Text(rocket.name ?? "")
            .fontWeight(.heavy)
        
            HStack {
            
                KFImage(URL(string: rocket.flickrImages?.first ?? ""))
                .cancelOnDisappear(true)
                .resizable()
                .frame(width: 200, height: 100)
                .cornerRadius(18)
            
           
            
            Image("starFilled")
                .renderingMode(.template)
                .foregroundColor(rocket.ratingColour)
            }
            HStack {
                Text("First Launched: ")
                Text(rocket.firstFlight ?? "")
                .italic()
            }
        }
        .padding()
        .background(Color(.tertiarySystemFill))
        .cornerRadius(18)
        .padding()    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        RocketListCell(rocket: MockData.sampleRocket)
    }
}
