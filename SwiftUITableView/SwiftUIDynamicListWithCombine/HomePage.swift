//
//  HomePage.swift
//  SwiftUITableView
//
//  Created by Bharathi Kumar on 22/09/23.
//

import Foundation
import SwiftUI
import Combine

struct HomePage: View {
    //private var apps:[Movies]? = nil
    @ObservedObject var viewModel = MoviesViewModel()
    let movies = [Results]()

    private var cancellables = Set<AnyCancellable>()
    /*
     var body: some View {
         NavigationView {
             Text("New Page")
         }.onAppear {
             self.getApps()
         }
     }
     
     List(landmarks) { landmark in
             NavigationLink(
                     destination:LandmarkDetail(landmark:landmark)) {
                     LandmarkRow(landmark: landmark)
                 }
     }
     
     */
   
    var body: some View {
       // NavigationView {
            
            List(self.viewModel.movies.results ?? [Results](), id: \.self) {
                MovieView(movies: $0)
            }.navigationBarTitle("Movies")
            .onAppear {
                self.viewModel.fetchMoviesNew()
            }
       // }
    }
    private func getApps() {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.hidesWhenStopped = true
            spinner.startAnimating()
           // tableView.backgroundView = spinner
        /*
         let appURL = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json"
     
         WebServiceManager.shared.getData(endpoint: appURL, type: AppResponse.self)
             .sink { completion in
                 spinner.stopAnimating()
             switch completion {
             case .failure(let err):
                 print("Error is \(err.localizedDescription)")
             case .finished:
                 print("Finished")
             }
         } receiveValue: { [weak self] appsResponse in
             self?.apps = appsResponse.feed.results
             //self?.tableView.reloadData()
         } .store(in: &cancellables)
         */
       
        
        //self.viewModel.fetchBreweries()
    }
}


struct HomePage_Preview: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            HomePage()
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
/*
 struct AppResponse: Codable {
     let feed: Feed
 }

 // MARK: - Feed
 struct Feed: Codable {
     let results: [App]
 }

 // MARK: - Result
 public struct App: Codable {
     let artistName, id, name, releaseDate: String
     let artworkUrl100: String
     let url: String
 }
 */

struct MovieView: View {
    private let movies: Results
    init(movies: Results) {
        self.movies = movies
    }
    
    var body: some View {
        HStack {
            Image("icybay")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            VStack(alignment: .leading, spacing: 15) {
                Text(movies.originalTitle ?? "")
                    .font(.system(size: 18))
                    .foregroundColor(Color.blue)
                Text("\(movies.originalLanguage ?? "") - \(movies.releaseDate ?? "")")
                    .font(.system(size: 14))
                
                Text(movies.overview ?? "")
                    .font(.system(size: 14))
            }
        }
    }
}
