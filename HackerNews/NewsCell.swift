//
//  NewsCell.swift
//  HackerNews
//
//  Created by Barış Ertaş on 6.08.2019.
//  Copyright © 2019 Barış Ertaş. All rights reserved.
//

import UIKit


class NewsCell: UITableViewCell{
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = UIColor.darkGray
    label.font = UIFont.systemFont(ofSize: 16)
    label.numberOfLines = 0
    return label
  }()
  
  let urlLabel: UILabel = {
    let label = UILabel()
    label.textColor = UIColor.lightGray
    label.sizeToFit()
    label.font = UIFont.systemFont(ofSize: 14)
    return label
  }()
  
  let nameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 12)
    return label
  }()
  
  let timeLabel: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 12)
    return label
  }()
  
 
  let userImage: UIImageView = {
    let userimage = UIImageView(image: #imageLiteral(resourceName: "user"))
    return userimage
  }()

  let timeImage: UIImageView = {
    let timeImage = UIImageView(image: #imageLiteral(resourceName: "time"))
    return timeImage
  }()
  
  func setup(with news: Items, with date: String){
      titleLabel.text = news.title
      urlLabel.text = news.url
      nameLabel.text = news.username
      timeLabel.text = date
}
  
  func setupView(){
   
    addSubview(titleLabel)
    titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 5, width: 0, height: 0)
    
    addSubview(urlLabel)
    urlLabel.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 5, width: 0, height: 0)

    addSubview(userImage)
    userImage.anchor(top: urlLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 20, height: 20)
    
    addSubview(nameLabel)
    nameLabel.anchor(top: urlLabel.bottomAnchor, left: userImage.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    
    addSubview(timeImage)
    timeImage.anchor(top: urlLabel.bottomAnchor, left: nameLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 17, height: 17)
    
    
    addSubview(timeLabel)
    timeLabel.anchor(top: urlLabel.bottomAnchor, left: timeImage.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    
  }
}
