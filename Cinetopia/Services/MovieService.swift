//
//  MovieService.swift
//  Cinetopia
//
//  Created by Douglas Gomes on 01/10/25.
//

import Foundation

struct MovieService {
    func getMovies(
        completion: @escaping ([Movie]?) -> Void
    ) {
        let urlString = "https://my-json-server.typicode.com/alura-cursos/movie-api/movies"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                completion(nil)
                return
            }
            
            do{
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                completion(movies)
            }catch{
                completion(nil)
                print(error.localizedDescription)
            }
        }
        
        task.resume()
    }
}
