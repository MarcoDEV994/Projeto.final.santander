//
//  RMService.swift
//  Rick and Morty
//
//  Created by Marco Antonio on 22/10/23.
//

import Foundation
let BASE_URL = "https://rickandmortyapi.com/api"

func performAPICall(page: String) async throws -> RickAndMortyResponse  {
    let url = URL(string: "\(BASE_URL)/character?page=\(page)")!
    let (data, _) = try await URLSession.shared.data(from: url)
    let rickAndMortyResponse = try JSONDecoder().decode(RickAndMortyResponse.self, from: data)
    return rickAndMortyResponse
}

func performAPICallUrl(url: String) async throws -> RickAndMortyResponse  {
    let url = URL(string: url)!
    let (data, _) = try await URLSession.shared.data(from: url)
    let rickAndMortyResponse = try JSONDecoder().decode(RickAndMortyResponse.self, from: data)
    return rickAndMortyResponse
}
