//
//  ViewController.swift
//  HackerNews
//
//  Created by Barış Ertaş on 4.08.2019.
//  Copyright © 2019 Barış Ertaş. All rights reserved.
//

import UIKit
import SafariServices

let cellId = "cellId"

class FeedController: UITableViewController {
  

  var users = [Int]()
  var news = [Items]()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  
  setup()
    print(users.count)
    
  }
  
  func setup(){
   
    navigationItem.title = "HackerNews"
    navigationController?.navigationBar.prefersLargeTitles = true
    fetchUserIds()
    tableView.register(NewsCell.self, forCellReuseIdentifier: cellId)
//    view.backgroundColor = .black
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
            
            DispatchQueue.main.async {
              self.tableView.reloadData()
            }
            
              self.news.append(info)
        
          case .failure(let error):
            print(error)
          }
        })
      case .failure(let error):
        print(error)
      }
  }
}
  
  
  func convertDate(of unixTime: Double) -> String{
    let date = Date(timeIntervalSince1970: unixTime)
    let formatter = DateFormatter()
    formatter.timeStyle = DateFormatter.Style.medium
    formatter.dateStyle = DateFormatter.Style.medium
    formatter.timeZone = .current
    let localDate = formatter.string(from: date)
    return localDate
    
  }
}


extension FeedController {
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return news.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! NewsCell

    let newsInfo: Items
    let date: String
      newsInfo = news[indexPath.row]
    
    date = convertDate(of: Double(newsInfo.time))
    
    
    cell.setup(with: newsInfo, with: date)
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
    guard let url = URL(string: news[indexPath.row].url) else {
      return
    }
    
    let safariVC = SFSafariViewController(url: url)
    present(safariVC, animated: true)
    
  }
  
}





