//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Barış Ertaş on 5.08.2019.
//  Copyright © 2019 Barış Ertaş. All rights reserved.
//

import UIKit

//enum APIHandlerError: Error {
//  case network(error: Error)
//  case apiProvidedError(reason: String)
//  case objectSerialization(reason: String)
//}

//enum BaseURL: String {
//  case topStories = "https://hacker-news.firebaseio.com/v0/topstories.json"
//}


class NetworkManager {
  
  static let shared = NetworkManager()
  let baseURL = "https://hacker-news.firebaseio.com/v0/topstories.json"
  let info = "https://hacker-news.firebaseio.com/v0/item/{item-id}.json"
  
  func fetchIds(completion: @escaping (Result<[User],Error>) -> Void){
    
    guard let url = URL(string: baseURL) else { return }
    URLSession.shared.dataTask(with: url) { (data, _, error) in
      
      if let error = error {
        completion(.failure(error))
        return
      }
      
      guard let jsonData = data else { return }
      do {
        
        let array0fInts = try JSONDecoder().decode([Int].self, from: jsonData)
        let info = array0fInts.map(User.init)
        completion(.success(info))
        
        
      }catch let error {
        completion(.failure(error))
      }
      }.resume()
  }
  
  
  func fetchInfo(of Id: Int, completion: @escaping (Result<All,Error>) -> Void){
    
    guard let url = URL(string: "https://hacker-news.firebaseio.com/v0/item/\(Id).json") else { return }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
      
      if let error = error {
        completion(.failure(error))
        return
      }
      
      guard let jsonData = data else { return }
      do{
        let info = try JSONDecoder().decode(All.self, from: jsonData)
       // let kalem = info.news
    
        completion(.success(info))
        
      }catch let error {
        completion(.failure(error))
      }
      
    }.resume()
    
    
    
  }
  
  
}
