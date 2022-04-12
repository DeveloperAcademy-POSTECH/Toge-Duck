//
//  ModelData.swift
//  togeduck
//
//  Created by 이성민 on 2022/04/08.
//

import Foundation

var members: [Member] = load("members.json")


class ImageViewModel : ObservableObject {
    
    @Published var members  = 0

}
//class ImageViewModel : ObservableObject {
//
//    @Published var members : [Member]
//
//    init() {
//        var jsonData : [Member] = load("members.json")
//        self.members = jsonData
//    }
//
//    func load<T: Decodable>(_ filename: String) -> T {
//        let data: Data
//
//        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//        else {
//            fatalError("Couldn't find \(filename) in main bundle.")
//        }
//
//        do {
//            data = try Data(contentsOf: file)
//        } catch {
//            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//        }
//
//        do {
//            let decoder = JSONDecoder()
//            return try decoder.decode(T.self, from: data)
//        } catch {
//            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//        }
//    }
//
//}

func load<T: Decodable>(_ filename: String) -> T {
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
}
