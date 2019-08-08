//
//  ViewController.swift
//  HackerNews
//
//  Created by Barış Ertaş on 4.08.2019.
//  Copyright © 2019 Barış Ertaş. All rights reserved.
//

import UIKit


let cellId = "cellId"

class FeedController: UITableViewController {
  

  var users = [Int]()
  var news = [All]()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  
  setup()
    print(users.count)
    
  }
  
  func setup(){
    view.backgroundColor = .white
    navigationItem.title = "HackerNews"
    navigationController?.navigationBar.prefersLargeTitles = true
    fetchUserIds()
    tableView.register(NewsCell.self, forCellReuseIdentifier: cellId)
    
  }
  
  
  func fetchUserIds(){
    
    NetworkManager.shared.fetchIds { (result) in
      
      switch result {
      case .success(let id):
        self.users = id
          print("\(self.users) + \(self.users.count)")
        NetworkManager.shared.fetchInfo(of: self.users, completion: { (result) in
          switch result {
          case .success(let info):
            self.news.append(info)
            DispatchQueue.main.async {
              self.tableView.reloadData()
            }
          case .failure(let error):
            print(error)
          }
        })
      case .failure(let error):
        print(error)
      }

  }
  }
}


extension FeedController {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return news.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! NewsCell

    
      cell.titleLabel.text = news[indexPath.row].title
    cell.urlLabel.text = news[indexPath.row].url

//    cell.layoutSubviews()
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
  
  

}





