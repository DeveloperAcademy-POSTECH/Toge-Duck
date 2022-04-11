//
//  Member.swift
//  togeduck
//
//  Created by 이성민 on 2022/04/09.
//

import Foundation
import SwiftUI

struct Member: Hashable, Codable {
    var name: String
    var introduction: String
    var id: Int
    var age: Int
    var subscribes: Int
    var friends: Int
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    var hobbies: [Hobby]
//    struct Hobby: Hashable, Codable{
//        var hobbyName: String
//        var hobbyPost: [post]
//    }
    
//    struct post: Hashable, Codable {
//        var postTitle: String
//        var postContent: String
//        private var postImageName: String
//        var postImage: Image{
//            Image(postImageName)
//        }
//    }
}

struct Hobby: Hashable, Codable{
    var hobbyName: String
    var hobbyPost: [Post]
}

struct Post: Hashable, Codable {
//    var id = UUID()
    var postTitle: String
    var postContent: String
    private var postImageName: String
    var postImage: Image{
        Image(postImageName)
    }
    
//    private enum CodingKeys : String, CodingKey {case postTitle, postContent, postImageName, postImage}
}
