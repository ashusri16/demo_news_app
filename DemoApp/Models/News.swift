//
//  News.swift
//  DemoApp
//
//  Created by APPLE on 15/03/21.
//

import Foundation
 
struct News: Decodable{
    let author: String?
    let title: String?
    let description: String?
    let urlToImage: String?
    let url: String?
}

struct NewsEnvelop: Decodable{
    let status: String
    let totalResults: Int
    let articles: [News]
}
