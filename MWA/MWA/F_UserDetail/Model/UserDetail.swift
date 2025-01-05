//
//  UserDetail.swift
//  MWA
//
//  Created by Dinesh Kumar.M on 05/01/25.
//
struct UserDetail: Codable, Identifiable, Hashable {
    let id: Int
    let profilePicture: String
    let username: String
    let address: String
    let dob: String
    let interests: [String]
}
