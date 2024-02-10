//
//  UserProcessing.swift
//  SternXTask
//
//  Created by Ibrahim Hosseini on 2/8/24.
//

import Foundation

typealias userID = Int

enum Order {
    case ASC, DES
}

// MARK: - User processing

protocol UserProcessing {
    func sortedUserByPostLength(post: [Post], order: Order) -> [userID] 
}

class UserProcessingImp: UserProcessing {

    private let dataProcessing: DataProcessing
    private let summationService: CalculationService

    init(
        dataProcessing: DataProcessing,
        summationService: CalculationService
    ) {
        self.dataProcessing = dataProcessing
        self.summationService = summationService
    }

    func sortedUserByPostLength(post: [Post], order: Order = .DES) -> [userID] {
        let userIds = sortedUsersByPost(data: post)

        var userPostsLength = [userID: Float]()

        for id in userIds {
            userPostsLength[id] = dataProcessing.averageBodyLength(post: post, by: id)
        }

        if order == .ASC {
            return userPostsLength.keysSortedByValue(<)
        }

        return userPostsLength.keysSortedByValue(>)
    }

    // sorted users with post
    private func sortedUsersByPost(data: [Post], order: Order = .DES) -> [userID] {
        let allUsersWithPostCount = getAllUsersWithPostsCount(data: data)

        if order == .ASC {
            return allUsersWithPostCount.keysSortedByValue(<)
        }
        return allUsersWithPostCount.keysSortedByValue(>)
    }

    // get all users with count of posts
    private func getAllUsersWithPostsCount(data: [Post]) -> [userID: Int] {
        let uniqueUsers = getUserIds(data: data)
        var userPosts = [userID: Int]()

        for uniqueUser in uniqueUsers {
            userPosts[uniqueUser] = summationService.getCountOfPost(post: data, userId: uniqueUser)
        }
        return userPosts
    }

    // get users that release a post
    private func getUserIds(data: [Post]) -> [userID] {
        data.map { $0.userId }.unique()
    }

}
