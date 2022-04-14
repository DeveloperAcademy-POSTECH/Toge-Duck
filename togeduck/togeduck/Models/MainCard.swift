//
//  MainCard.swift
//  togeduck
//
//  Created by YejiMac on 2022/04/12.
//

import Foundation

struct MainCardData: Identifiable {
    let id: UUID
    var group_title: String
    var dotimgs: [String]
    
    init(id: UUID = UUID(), group_title: String, dotimgs: [String]) {
        self.id = id
        self.group_title = group_title
        self.dotimgs = dotimgs
    }
}

extension MainCardData {
    static let sampleData: [MainCardData] =
    [
        MainCardData(group_title: "와인을 좋아해요", dotimgs: ["dotimg3", "dotimg2", "dotimg3", "dotimg6", "dotimg1"]),
        MainCardData(group_title: "축구를 좋아해요", dotimgs: ["dotimg2", "dotimg5", "dotimg1", "dotimg1", "dotimg5"]),
        MainCardData(group_title: "사케를 좋아해요", dotimgs: ["dotimg3", "dotimg5", "dotimg3", "dotimg2", "dotimg6"]),
        MainCardData(group_title: "토트넘을 좋아해요", dotimgs: ["dotimg6", "dotimg3", "dotimg3", "dotimg1", "dotimg4"]),
        MainCardData(group_title: "30분 거리에 있어요", dotimgs: ["dotimg4", "dotimg6", "dotimg3", "dotimg2", "dotimg2"]),
        MainCardData(group_title: "희귀한 취미를 가지고 있어요", dotimgs: ["dotimg5", "dotimg6", "dotimg6", "dotimg1", "dotimg3"]),
    ]
}
