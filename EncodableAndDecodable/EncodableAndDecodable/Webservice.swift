//
//  Webservice.swift
//  EncodableAndDecodable
//
//  Created by T2P mac mini on 19/8/2563 BE.
//  Copyright © 2563 pucknavin. All rights reserved.
//

import Foundation

class Webservice {
    func postAPI(completion:@escaping(Post?)->Void){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")

        
        let postTitle = "dolorem dolore est ipsam"
        let postBody = "dignissimos aperiam dolorem qui eum\nfacilis quibusdam animi sint suscipit qui sint possimus cum\nquaerat magni maiores excepturi\nipsam ut commodi dolor voluptatum modi aut vitae"
        
        let newPost:Post = Post(userId: 55, id: nil, title: postTitle, body: postBody)
        
        do{
            urlRequest.httpBody = try JSONEncoder().encode(newPost)
        }catch{
            print(error)
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { (data:Data?, response:URLResponse?, error:Error?) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            } else if let data = data {
                //--------------------
                do{
                    let receivePost = try JSONDecoder().decode(Post.self, from: data)
                    
                    completion(receivePost)
                    return
                }catch{
                    print(error)
                    return
                }
                //--------------------
                
            }
            
        }
        task.resume()
    }
    
    
    func getPost(completion:@escaping([Post]?)->Void){
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { (data:Data?, response:URLResponse?, error:Error?) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            } else if let data = data {
                //--------------------
                do{
                    let receivePost = try JSONDecoder().decode([Post].self, from: data)
                    
                    completion(receivePost)
                    return
                }catch{
                    print(error)
                    return
                }
                //--------------------
                
            }
            
        }
        task.resume()
        
    }
}
