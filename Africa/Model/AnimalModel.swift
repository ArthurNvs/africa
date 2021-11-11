//
//  AnimalModel.swift
//  Africa
//
//  Created by Arthur Neves on 11/11/21.
//

import Foundation

struct Animal: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  let description: String
  let link: String
  let image: String
  let gallery: [String]
  let fact: [String]
}
