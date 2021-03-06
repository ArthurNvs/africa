//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Arthur Neves on 10/11/21.
//

import Foundation

extension Bundle {
  func decode<T: Codable>(_ file: String) -> T {
    //1. Locate json file
    guard let url = self.url(forResource: file, withExtension: nil) else {
      fatalError("Failed to locate \(file) in bundle")
    }
    
    //2. Create a property for the data inside json file url
    guard let data = try? Data(contentsOf: url) else {
      fatalError("Failed to load \(file) from bundle.")
    }
    
    //3. Create a decode
    let decoder = JSONDecoder()
    
    //4. Create a property for the decoded data
    guard let loaded = try? decoder.decode(T.self, from: data) else {
      fatalError("Failed to load \(file) from bundle.")
    }
    
    //5. Return the ready-to-use data
    return loaded
  }
}
