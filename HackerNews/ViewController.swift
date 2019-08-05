//
//  ViewController.swift
//  HackerNews
//
//  Created by Barış Ertaş on 4.08.2019.
//  Copyright © 2019 Barış Ertaş. All rights reserved.
//

import UIKit

private let cell = "NewsCell"

class FeedController: UITableViewController {
  

  var users = [User]()
  var news = [All]()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .red
    navigationItem.title = "HackerNews"
    navigationController?.navigationBar.prefersLargeTitles = true
    fetchUserIds()
    
  }
  
  
  func fetchUserIds(){
    
    NetworkManager.shared.fetchIds { (result) in
      switch result {
      case .success(let id):
        self.users = id
        for i in 1...20{
          NetworkManager.shared.fetchInfo(of: self.users[i].userId, completion: { (result) in
            switch result {
            case .success(let info):
             self.news = [info]
             self.news.forEach({ (item) in
              print(item.username + item.title + item.url)
             })
            case .failure(let error):
              print(error)
            }
          })
        }
      case .failure(let error):
        print(error)
      }
    }
  }

  
  
}

extension FeedController {
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return news.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     //   let cell = tableView.dequeueReusableCell(withIdentifier: cell, for: indexPath.row)
  }
  
  
}
