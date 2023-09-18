//
//  LandmarkList.swift
//  SwiftUITableView
//
//  Created by Bharathi Kumar on 18/09/23.
//

import Foundation
import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            List(landmarks) { landmark in
                    NavigationLink(
                            destination:LandmarkDetail(landmark:landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
