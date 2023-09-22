//
//  LandmarkDetail.swift
//  SwiftUITableView
//
//  Created by Bharathi Kumar on 18/09/23.
//

import Foundation
import SwiftUI

struct LandmarkDetail: View {
    
    @State private var navigationSelectionTag: Int? = 0
    var landmark: Landmark
    var body: some View {
        //ScrollView
       NavigationView {
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
            }
       }
       .navigationBarItems(trailing: Button(action: {
           print("Floating Button Click")
       }, label: {
           NavigationLink(destination: HomePage()) {
                //Text("Open View")
               Image(systemName: "plus")
            }
       }))
//        .navigationBarItems(trailing:
//                                Button(action: {
//            print("Edit button pressed...")
//          _ =  NavigationLink(destination: HomePage()) {
//                Text("Do Something")
//            }
//           
//        }) {
//            Image(systemName: "plus")
//        }
//        )
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct LandmarkDetail_Preview: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarks[2])
    }
}
