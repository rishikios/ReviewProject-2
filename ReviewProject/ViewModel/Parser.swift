////
////  Parser.swift
////  ReviewProject
////
////  Created by Reddy, P on 26/05/22.
////
//
//import Foundation
//import UIKit
//
//struct Parser {
//    //var fetchedMovie = [WelcomeElement]()
//    func parseData() {
//
//        //fetchedMovie = []
//
//        let url = "http://api.tvmaze.com/shows/1/episodes"
//        var request = URLRequest(url: URL(string: url)!)
//        request.httpMethod = "GET"
//
//        let congiguration = URLSessionConfiguration.default
//        let session = URLSession(configuration: congiguration, delegate: nil, delegateQueue: OperationQueue.main)
//        let task = session.dataTask(with: request) { (data, response, error) in
//
//            if (error != nil) {
//                print("Error")
//            }
//            else{
//                do{
//                    let fetchedData = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSArray
//                    //print(fetchedData)
//                    for eachFetchedMovie in fetchedData {
//                        let eachMovie = eachFetchedMovie as! [String : Any]
//                        let movieName = eachMovie["name"] as! String
//                        let movieSum = eachMovie["summary"] as! String
//                        self.fetchedMovie.append(WelcomeElement(name: movieName, summary: movieSum ))
//                    }
//
//                }
//                catch{
//                    print("error 2")
//                }
//            }
//
//        }
//        task.resume()
//
//    }
////    func Parser() {
////        let api = URL(string: "http://api.tvmaze.com/shows/1/episodes")
////
////        URLSession.shared.dataTask(with: api!) { data, response, error in
////            if error != nil {
////                print(error?.localizedDescription)
////                return
////            }
////            do{
////                let result = try JSONDecoder().decode(WelcomeElement.self, from: data!)
////                print(result)
////
////            } catch{
////
////            }
////        }.resume()
////    }
//
//}
//
