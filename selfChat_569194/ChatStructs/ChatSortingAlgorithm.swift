//
//  ChatSortingAlgorithm.swift
//  selfChat_569194
//
//  Created by Note on 08.02.22.
//

import Foundation

func chatSortingAlgorithm(first: Chat, second: Chat) -> Bool {
    return first.withUser.name > second.withUser.name
}
