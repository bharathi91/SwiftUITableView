//
//  LandmarkDetail.swift
//  SwiftUITableView
//
//  Created by Bharathi Kumar on 18/09/23.
//

import Foundation
import SwiftUI

struct LandmarkDetail: View {
    
    var landmark: Landmark
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height:300)
                  
            CircleImage(image:landmark.image)
                    .offset(y:-130)
                    .padding(.bottom, -130)
                  VStack(alignment:.leading) {
                    Text(landmark.name)
                        .font(.title)
                    HStack {
                        Text(landmark.park)
                        Spacer()
                        Text(landmark.state)
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    Divider()
                    Text("About \(landmark.name)")
                        .font(.title2)
                    Text(landmark.description)
                }//VStack
                    .padding()
            }//ScrollView
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
        }
    }


struct LandmarkDetail_Preview: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[2])
    }
}
