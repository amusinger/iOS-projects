//
//  APIManager.swift
//  Quiz
//
//  Created by Aizhan Yerimbetova on 10/3/17.
//  Copyright © 2017 Aizhan Yerimbetova. All rights reserved.
//

import Foundation
import Alamofire

public typealias CompletionClosure = (_ hello: [AnyObject]) -> Void

public class APIManager : NSObject {
    class func getQuizWithAlamofire(Closure: @escaping CompletionClosure){
        Alamofire.request("https://jsonbin.io/b/59e365063a67f427208e2368").responseJSON { response in
            debugPrint(response)
            
            if let json = response.result.value {
                let result = json as! [AnyObject]
                Closure(result)
            }
        }
    }
    class func getQuizFromAPI(Closure: @escaping CompletionClosure){
        let urlString = "https://jsonbin.io/b/59e365063a67f427208e2368"
        
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let session = Foundation.URLSession.shared
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if (error != nil) {
                
                print(error?.localizedDescription)
            } else {
                _ = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)! as String
                
                do {
                    _ = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    
                let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions())
                let result = json as! [AnyObject]
                    
                    Closure(result)
               
                } catch {
                    print(error)
                }
                
                
            }
            
            
        }
        
        task.resume()
    }
}
