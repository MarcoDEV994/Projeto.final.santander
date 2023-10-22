//
//  CharacterItemView.swift
//  Rick and Morty
//
//  Created by Marco Antonio on 22/10/23.
//

import Foundation
import SwiftUI

struct CharacterItemView : View {
    let character: Character
    
    var body: some View {
        HStack() {
            AsyncImage(url: URL(string: character.image ?? ""), scale: 2){ image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 60, height: 60)
            Text(character.name ?? "")
        }.frame(height: 50)
    }
}
