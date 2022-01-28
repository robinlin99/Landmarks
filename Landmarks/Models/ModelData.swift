//
//  ModelData.swift
//  Landmarks
//
//  Created by Robin Lin on 1/27/22.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load(from: "landmarkData")
}

func load(from fileName: String) -> [Landmark] {
    guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {
        fatalError("Failed to open \(fileName).json")
    }
    
    do {
        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
        let jsonDecoder = JSONDecoder()
        return try jsonDecoder.decode([Landmark].self, from: data)
    } catch {
        fatalError("Parsing failed.")
    }
}
