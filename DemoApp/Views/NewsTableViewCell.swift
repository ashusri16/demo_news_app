//
//  NewsTableViewCell.swift
//  DemoApp
//
//  Created by APPLE on 16/03/21.
//

import UIKit

final class NewsTableViewCell: UITableViewCell {
    var newsVM: NewsViewModel? {
        didSet{
            if let newsVM = newsVM {
                titleLable.text = newsVM.title
                NetworkManager.sharedInstance.getImage(urlString: newsVM.urlToImage) { (data) in
                    guard let data = data else {return}
                    DispatchQueue.main.async {
                       self.newsImage.image = UIImage(data: data)
                }
                }
            }
        }
    }
    
    
   private lazy var newsImage: ImageView = {
        let v = ImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var titleLable: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.numberOfLines = 0
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(titleLable)
        addSubview(newsImage)
        setupConstrains()
    }
    
    func setupConstrains(){
        NSLayoutConstraint.activate([
            newsImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            newsImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            newsImage.topAnchor.constraint(equalTo: topAnchor),
            newsImage.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            titleLable.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            titleLable.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16),
            titleLable.topAnchor.constraint(equalTo: newsImage.bottomAnchor,constant: 8),
            titleLable.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -16),
        ])
    }
    
    
}
