//
//  VideoModel.swift
//  Africa
//
//  Created by Arthur Neves on 12/11/21.
//

import Foundation

struct Video: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  
  var thumbnail: String {
    "video-\(id)"
  }
}
