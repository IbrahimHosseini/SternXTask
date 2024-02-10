//
//  MockCalculationTest.swift
//  SternXTaskTests
//
//  Created by Ibrahim Hosseini on 2/9/24.
//

import Foundation
@testable import SternXTask

class MockCalculationTest: CalculationService {
    func getCountOfPost(post: [Post], userId: userID) -> Int {
        let sum = post.sum(of: \.userId)
        return sum[userId] ?? 0
    }
    
    func getUserPostLength(data: [Post], userId: userID) -> Int {
        let sum = data.sum(of: \.userId, by: \.body.count)
        return sum[userId] ?? 0
    }
    
    func calculateAverage(postCount: Float, bodyCount: Float) -> Float {
        bodyCount/postCount
    }
}
