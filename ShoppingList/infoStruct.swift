//
//  infoStruct.swift
//  ShoppingList
//
//  Created by youngkyun park on 1/3/25.
//


import Foundation

struct ShoppingStatus {
    var checkStatus: Bool
    var title: String
    var likeStatus: Bool
}


struct ShoppingInfoList {
    var list:[ShoppingStatus] = [
        ShoppingStatus(checkStatus: true,title: "그립톡 구매하기" ,likeStatus: true),
        ShoppingStatus(checkStatus: false,title: "사이다 구매" ,likeStatus: false),
        ShoppingStatus(checkStatus: false,title: "아이패드 케이스 최저가 알아보기" ,likeStatus: true),
        ShoppingStatus(checkStatus: false,title: "양말" ,likeStatus: true)
    
    
    
    ]
}
