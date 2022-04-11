//
//  Member.swift
//  togeduck
//
//  Created by 이성민 on 2022/04/09.
//

import Foundation
import SwiftUI

struct Member: Hashable, Codable, Identifiable {
    var name: String
    var introduction: Strings
    var id: Int
    var age: Int
    var subscribes: Int
    var friends: Int
    var distance : Int
    var hobbies: [Hobby]
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}

struct Hobby: Hashable, Codable, Identifiable {
    let id = UUID()
    var hobbyName: String
    var hobbyPost: [Post]
}

struct Post: Hashable, Codable, Identifiable {
    let id = UUID()
    var postTitle: String
    var postContent: String
    
    private var postImageName: String
    var postImage: Image{
        Image(postImageName)
    }
    
//    private enum CodingKeys : String, CodingKey {case postTitle, postContent, postImageName, postImage}
}
