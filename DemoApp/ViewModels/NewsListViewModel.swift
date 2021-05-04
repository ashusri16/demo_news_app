//
//  NewsListViewModel.swift
//  DemoApp
//
//  Created by APPLE on 16/03/21.
//

import Foundation
import Alamofire

class NewsListViewModel{
    var newsVM = [NewsViewModel]()
    
    let reuseID = "newID"
    
    
    
    func getNews(completion: @escaping ([NewsViewModel]) -> Void) {
        
        
    
            NetworkManager.sharedInstance.getNews {(news) in
                guard let news = news else {
                    print("error in NewsListVM")
                    return
                }
                let newsVM = news.map(NewsViewModel.init)
                DispatchQueue.main.async {
                    self.newsVM = newsVM
                    completion(newsVM)
                }
            }
        
    }
}


public class Connectivity{
    class var isConnectedToInternet: Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
