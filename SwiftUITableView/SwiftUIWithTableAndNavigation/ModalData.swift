//
//  ModalData.swift
//  SwiftUITableView
//
//  Created by Bharathi Kumar on 18/09/23.
//

import Foundation
//Mark: Load From Local

var landmarks: [Landmark] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String) -> T {
    //MARK: Using Local Json
    Networking().loadFromAPI("https://bharathi91.github.io/landmarkData.json") { landmarks in
        print(landmarks)
    }
     let data: Data

     guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
         else {
             fatalError("Couldn't find \(filename) in main bundle.")
     }

     do {
         data = try Data(contentsOf: file)
     } catch {
         fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
     }

     do {
         let decoder = JSONDecoder()
         return try decoder.decode(T.self, from: data)
     } catch {
         fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
     }
     
  
    
    //MARK: Using API
    
//    loadFromAPI("https://bharathi91.github.io/landmarkData.json") { landmarks in
//        print(landmarks)
//        let data: Data
//        do {
//            let decoder = JSONDecoder()
//            do {
//                data = try JSONSerialization.data(withJSONObject: landmarks, options: JSONSerialization.WritingOptions.prettyPrinted)
//                return decoder.decode(T.self, from: data)
//                } catch let myJSONError {
//                    print(myJSONError)
//                }
//        } catch {
//            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//        }
//    }
    
}


//MARK: Load from API


func loadFromAPI(_ url: String,completion:@escaping (([Landmark]) -> (Void))) {
    let data: Data
    //MARK: Using API
    let url = URL(string: url)!
    Networking().loadFromAPI("https://bharathi91.github.io/landmarkData.json") { landmarks in
        print(landmarks)
    }
}



class Networking {
    func loadFromAPI(_ url: String,completion:@escaping (([Landmark]) -> (Void))) {
        let data: Data
        //MARK: Using API
        let url = URL(string: url)!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
            do {
                let decoder = JSONDecoder()
                let landmarks = try decoder.decode([Landmark].self, from: data)
                completion(landmarks)
            } catch {
                fatalError("Couldn't parse \(error)")
            }
        }.resume()
        
    }

}
