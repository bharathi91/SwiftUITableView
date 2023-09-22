//
//  MoviesViewModel.swift
//  SwiftUITableView
//
//  Created by Bharathi Kumar on 22/09/23.
//

import Foundation
import SwiftUI
import Combine

class MoviesViewModel: ObservableObject {
    private let url = "https://bharathi91.github.io/MoviesList.json"
    var task: AnyCancellable?
    private var cancellables = Set<AnyCancellable>()

    @Published var movies: MoviesModel = MoviesModel()
    
    func fetchMovies() {
        task = URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
            .map { $0.data }
            .decode(type: MoviesModel.self, decoder: JSONDecoder())
            .replaceError(with: MoviesModel())
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \MoviesViewModel.movies, on: self)
    }
    
    func fetchMoviesNew() {
        let appURL = "https://bharathi91.github.io/MoviesList.json"
    
        WebServiceManager.shared.getData(endpoint: appURL, type: MoviesModel.self)
            .sink { completion in
               // spinner.stopAnimating()
            switch completion {
            case .failure(let err):
                print("Error is \(err.localizedDescription)")
            case .finished:
                print("Finished")
            }
        } receiveValue: { [weak self] appsResponse in
            //self?.apps = appsResponse.feed.results
            //self?.tableView.reloadData()
            self?.movies.results = appsResponse.results
            print(appsResponse)
        } .store(in: &cancellables)
        
    }
}
