//
//  ReportService.swift
//  SternXTask
//
//  Created by Ibrahim Hosseini on 2/8/24.
//

import Foundation

// MARK: - report service

protocol ReportService {
    func getReport(data: [Post]) -> [Report]
}

class ReportServiceImp: ReportService {

    private let userService: UserService
    private let dataProcessingService: DataProcessing

    init(
        userService: UserService,
        dataProcessingService: DataProcessing
    ) {
        self.userService = userService
        self.dataProcessingService = dataProcessingService
    }

    func getReport(data: [Post]) -> [Report] {
        let userIds = userService.getTopUsers(data: data)
        
        var report = [Report]()

        for id in userIds {
            report.append(
                Report(
                    userId: id,
                    avgLengthPost: self.getAveragePostLength(data: data, userId: id)
                )
            )
        }

        return report
    }

    private func getAveragePostLength(data: [Post], userId: userID) -> Float {
        dataProcessingService.averageBodyLength(post: data, by: userId)
    }
}
