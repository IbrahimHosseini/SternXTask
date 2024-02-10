//
//  DataProcessing.swift
//  SternXTask
//
//  Created by Ibrahim Hosseini on 2/8/24.
//

import Foundation

// MARK: - Data processing
protocol DataProcessing {
    func averageBodyLength(post: [Post], by userId: userID) -> Float
}

class DataProcessingImp: DataProcessing {

    private let calculationService: CalculationService

    init(calculationService: CalculationService) {
        self.calculationService = calculationService
    }

    // get average body length by user id
    func averageBodyLength(post: [Post], by userId: userID) -> Float {

        let postCount = calculationService.getCountOfPost(post: post, userId: userId)

        let lengthOfBodies = calculationService.getUserPostLength(data: post, userId: userId)

        return calculationService.calculateAverage(postCount: Float(postCount), bodyCount: Float(lengthOfBodies))
    }

}
