//
//  MovieService.swift
//  Cinetopia
//
//  Created by Douglas Gomes on 01/10/25.
//

import Foundation

enum MovieServiceError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}

struct MovieService {
    func getMovies() async throws -> [Movie] {
        let urlString = "https://my-json-server.typicode.com/alura-cursos/movie-api/movies"
        guard let url = URL(string: urlString) else {
            throw MovieServiceError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw MovieServiceError.invalidResponse
        }
        
        do{
            return try JSONDecoder().decode([Movie].self, from: data)
        }catch{
            throw MovieServiceError.decodingError
        }
    }
}
