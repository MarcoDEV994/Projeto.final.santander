//
//  ContentView.swift
//  Rick and Morty
//
//  Created by Marco Antonio on 21/10/23.
//
import SwiftUI

struct ContentView: View {
    @State private var chacterList: [Character] = []
    @State private var nextPage: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(chacterList) { characterItem in
                    CharacterItemView(character: characterItem)
                }
            }
            .navigationTitle("Rick an Morty")
            .task {
                do {
                    let chacter = try await performAPICall(page: "1")
                    chacterList = chacter.results ?? []
                    nextPage = chacter.info?.next ?? ""
                } catch {
                    chacterList = []
                }
            }
        }
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
