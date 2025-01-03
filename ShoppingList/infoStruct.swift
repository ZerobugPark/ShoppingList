//
//  infoStruct.swift
//  ShoppingList
//
//  Created by youngkyun park on 1/3/25.
//


import Foundation


struct ShoppingStatus {
    var checkStatus: Bool
    var likeStatus: Bool
}


struct ShoppingInfoList {
    var list:[ShoppingStatus] = [
        ShoppingStatus(checkStatus: true, likeStatus: true),
        ShoppingStatus(checkStatus: false, likeStatus: false),
        ShoppingStatus(checkStatus: false, likeStatus: true),
        ShoppingStatus(checkStatus: false, likeStatus: true)
    
    
    
    ]
}
