//
//  User.swift
//  ReviewProject
//
//  Created by Reddy, P on 26/05/22.
//

import Foundation

// MARK: - WelcomeElement
struct WelcomeElement: Codable {
    
    let name: String
    //let season, number: Int
    //let runtime: Int
    //let image: Image
    let summary: String
//    var image: String
//    init(mName:String, mSum:String,mImg:String){
//        name = mName
//        summary = mSum
//        image = mImg
//    }
    
    
//

    enum CodingKeys: String, CodingKey {
        case  name, summary
        //season, number,runtime, image
        
    }
}

// MARK: - Image
struct Image: Codable {
    let medium, original: String
}


