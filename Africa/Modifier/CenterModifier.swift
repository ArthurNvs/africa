//
//  CenterModifier.swift
//  Africa
//
//  Created by Arthur Neves on 17/11/21.
//

import SwiftUI

struct CenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}
