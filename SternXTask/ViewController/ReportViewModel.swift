//
//  ReportViewModel.swift
//  SternXTask
//
//  Created by Ibrahim Hosseini on 2/7/24.
//

import Foundation
import Combine

class ReportViewModel: ObservableObject {
    @Published var error: String?
    @Published var report: [Report]?

    private let serviceHandler: PostsService
    private let reportService: ReportService

    init(
        serviceHandler: PostsService,
        reportService: ReportService
    ) {
        self.serviceHandler = serviceHandler
        self.reportService = reportService
    }

    func fetchPosts() {
        serviceHandler.getPosts(completion: { result in
            switch result {
            case .success(let data):
                self.report = self.getReport(with: data)
            case .failure(let error):
                self.error = error.localizedDescription
            }
        })
    }

    private func getReport(with posts: [Post]) -> [Report] {
        reportService.getReport(data: posts)
    }
}

