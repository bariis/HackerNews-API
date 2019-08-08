//
//  Items.swift
//  HackerNews
//
//  Created by Barış Ertaş on 5.08.2019.
//  Copyright © 2019 Barış Ertaş. All rights reserved.
//

import Foundation

//struct All: Decodable {
//
//  let news: [News]
//
//  enum CodingKeys: String, CodingKey{
//    case news
//  }
//
//}

//struct AllInfo: Decodable  {
//  var results: [All]
//  
//}


struct All: Decodable {
  
  let username: String
  let title: String
  let url: String
  
  enum CodingKeys: String, CodingKey {
    case username = "by", title, url
  }
  
}
