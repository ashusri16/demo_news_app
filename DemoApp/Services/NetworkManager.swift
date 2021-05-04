//
//  NetworkManager.swift
//  DemoApp
//
//  Created by APPLE on 15/03/21.
//

import Foundation

class NetworkManager{
    let imagecache = NSCache<NSString,NSData>()
    
    static let sharedInstance = NetworkManager()
    private init() {}
        
    func getNews(completion: @escaping ([News]?)->Void){
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=ef973d26d8c24d1fa0f461a35aeeb3d6"
        guard let url = URL(string: urlString) else {
            print("error in creating url")
            return
        }
        
        URLSession.shared.dataTask(with: url){data,response,error in
            guard error == nil, let data = data else{
                print(error!)
                completion(nil)
                return
            }
            
            do{
            let newsEnvelop = try JSONDecoder().decode(NewsEnvelop.self,from: data)
            completion(newsEnvelop.articles)
            }catch{
                print("Unexpected error: \(error)")
            }
            
        }.resume()
    }
    
    func getImage(urlString: String, completion: @escaping (Data?) -> Void){
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        if let cachedImage = imagecache.object(forKey: NSString(string: urlString)){
            completion(cachedImage as Data)
        }else{
            URLSession.shared.dataTask(with: url){(data, response, error) in
                guard error == nil, let data = data else{
                    print("error in getImage data retrival")
                    completion(nil)
                    return
                }
                self.imagecache.setObject(data as NSData, forKey: NSString(string: urlString))
                completion(data)
            }.resume()
        }
    }
    
    
}
