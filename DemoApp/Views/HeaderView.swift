//
//  HeaderView.swift
//  DemoApp
//
//  Created by APPLE on 16/03/21.
//

import UIKit

class HeaderView: UIView {
    private var fontSize: CGFloat;
    
    private lazy var headingLabel: UILabel = {
        let v = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.text = "Demo News App"
        v.textAlignment = .center
        v.layoutMargins = .init(top: 10, left: 10, bottom: 5, right: 10)
        return v
    }()
        
    init(fontSize: CGFloat){
        self.fontSize = fontSize
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(headingLabel)
        setupConstrains()
    }
    
    func setupConstrains(){
        NSLayoutConstraint.activate([
            headingLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            headingLabel.topAnchor.constraint(equalTo: topAnchor,constant: 20),
        ])
    }
}
