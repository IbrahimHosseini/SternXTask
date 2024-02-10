//
//  UserService.swift
//  SternXTask
//
//  Created by Ibrahim Hosseini on 2/9/24.
//

import Foundation

protocol UserService {
    func getTopUsers(data: [Post]) -> [userID]
}

class UserServiceImp: UserService {

    private let userProcessing: UserProcessing
    private let countOfUser: Int
    private let order: Order

    init(
        userProcessing: UserProcessing,
        countOfUser: Int,
        order: Order
    ) {
        self.userProcessing = userProcessing
        self.countOfUser = countOfUser
        self.order = order
    }

    func getTopUsers(data: [Post]) -> [userID] {
        let users = userProcessing.sortedUserByPostLength(
            post: data,
            order: order
        )
        return Array(users.prefix(countOfUser))
    }
}
