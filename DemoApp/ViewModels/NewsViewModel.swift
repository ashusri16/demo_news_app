//
//  NewsViewModel.swift
//  DemoApp
//
//  Created by APPLE on 16/03/21.
//

import Foundation

struct NewsViewModel {
    let news: News
    var author: String {return news.author ?? ""}
    var title: String{ return news.title ?? ""}
    var descrition: String { return news.description ?? ""}
    var url: String {return news.url ?? ""}
    var urlToImage: String { return news.urlToImage ?? ""}
}
