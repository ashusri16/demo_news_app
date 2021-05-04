//
//  ImageView.swift
//  DemoApp
//
//  Created by APPLE on 16/03/21.
//

import UIKit

class ImageView: UIView {
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    private lazy var imageView: UIImageView  = {
       let v = UIImageView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentMode = .scaleAspectFill
        v.layer.cornerRadius = 20
        v.clipsToBounds = true
        return v
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(imageView)
        setupConstrains()
    }
    
    func setupConstrains() {
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16),
            imageView.topAnchor.constraint(equalTo: topAnchor,constant: 16),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -16),
            
        ])
        
    }
}
