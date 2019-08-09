//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Barış Ertaş on 5.08.2019.
//  Copyright © 2019 Barış Ertaş. All rights reserved.
//

import UIKit

class NetworkManager {
  
  static let shared = NetworkManager()
  let baseURL = "https://hacker-news.firebaseio.com/v0/topstories.json"
  let info = "https://hacker-news.firebaseio.com/v0/item/{item-id}.json"
  
  func fetchIds(completion: @escaping (Result<[Int],Error>) -> Void){
    
    guard let url = URL(string: baseURL) else { return }
    URLSession.shared.dataTask(with: url) { (data, _, error) in
      
      if let error = error {
        completion(.failure(error))
        return
      }
      
      guard let jsonData = data else { return }
      do {
        
        let array0fInts = try JSONDecoder().decode([Int].self, from: jsonData)
      //  let info = array0fInts.map(User.init)
        completion(.success(array0fInts))
        
        
      }catch let error {
        completion(.failure(error))
      }
      }.resume()
  }
  
  
  func fetchInfo(of Id: [Int], completion: @escaping (Result<Items,Error>) -> Void){
    
  
    
    
    Id.forEach { (id) in
      guard let url = URL(string: "https://hacker-news.firebaseio.com/v0/item/\(id).json") else { return }
      URLSession.shared.dataTask(with: url) { (data, response, error) in
        
        if let error = error {
          completion(.failure(error))
          return
        }
        guard let jsonData = data else { return }
        do{
          
          
          
          let info = try JSONDecoder().decode(Items.self, from: jsonData)
          
          completion(.success(info))
          
          
          
        }catch let error {
          completion(.failure(error))
        }
        
        }.resume()
    }
    
  
    
  }
  
  
}
