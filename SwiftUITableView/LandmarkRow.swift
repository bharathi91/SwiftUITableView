//
//  LandmarkRow.swift
//  SwiftUITableView
//
//  Created by Bharathi Kumar on 18/09/23.
//

import SwiftUI

struct LandmarkRow: View {

    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
            Text(landmark.name)
            Spacer()
        }
    }
}

struct LandmarkRow_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark:landmarks[5])
            LandmarkRow(landmark:landmarks[1])
            LandmarkRow(landmark:landmarks[2])
        }
        .previewLayout(.fixed(width:300,height:70))
    }
}
