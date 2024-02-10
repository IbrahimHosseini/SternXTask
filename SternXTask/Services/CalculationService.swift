//
//  CalculationService.swift
//  SternXTask
//
//  Created by Ibrahim Hosseini on 2/8/24.
//

import Foundation

protocol CalculationService {
    func getCountOfPost(post: [Post], userId: userID) -> Int
    func getUserPostLength(data: [Post], userId: userID) -> Int
    func calculateAverage(postCount: Float, bodyCount: Float) -> Float
}

class CalculationServiceImp: CalculationService {

    init(){}

    // get count of the post for a user
    func getCountOfPost(post: [Post], userId: userID) -> Int {
        let sum = post.sum(of: \.userId)
        return sum[userId] ?? 0
    }

    // get the length of all posts of a user
    func getUserPostLength(data: [Post], userId: userID) -> Int {
        let sum = data.sum(of: \.userId, by: \.body.count)
        return sum[userId] ?? 0
    }

    // get average char length of body
    func calculateAverage(postCount: Float, bodyCount: Float) -> Float {
        bodyCount/postCount
    }
}
