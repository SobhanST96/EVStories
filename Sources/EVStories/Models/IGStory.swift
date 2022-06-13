//
//  IGStory.swift
//
//  Created by Ranjith Kumar on 9/8/17
//  Copyright (c) DrawRect. All rights reserved.
//

import Foundation

public struct IGStory: Codable {
    // Note: To retain lastPlayedSnapIndex value for each story making this type as class
    public var snapsCount: Int {
        return snaps.count
    }
    
    // To carry forwarding non-deleted snaps.
//    public var snaps: [IGSnap] {
//        return _snaps.filter{!($0.isDeleted)}
//    }
    
    public let id: String
    public let expiresAt: String
    public let createdAt: String
    public let updatedAt: String
    // To hold the json snaps.
    public var snaps: [IGSnap]
    public let thumbnailUrl: String
    public let title: String
    
    public var lastPlayedSnapIndex = 0
    public var isCompletelyVisible = false
    public var isCancelledAbruptly = false
    
    public init(id: String,
                expiresAt: String,
                createdAt: String,
                updatedAt: String,
                snaps: [IGSnap],
                thumbnailUrl: String,
                title: String) {
        
        self.id = id
        self.expiresAt = expiresAt
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.snaps = snaps
        self.thumbnailUrl = thumbnailUrl
        self.title = title
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case expiresAt
        case createdAt
        case updatedAt
        case snaps
        case thumbnailUrl
        case title
    }
}

extension IGStory: Equatable {
    public static func == (lhs: IGStory, rhs: IGStory) -> Bool {
        return lhs.id == rhs.id
    }
}
