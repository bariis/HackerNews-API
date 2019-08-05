//
//  userIDs.swift
//  HackerNews
//
//  Created by Barış Ertaş on 5.08.2019.
//  Copyright © 2019 Barış Ertaş. All rights reserved.
//

import Foundation


struct User: Decodable {

  let userId: Int
  
  enum CodingKeys: String, CodingKey {
    case userId = "id"
  }

}
