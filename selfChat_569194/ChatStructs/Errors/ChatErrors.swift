//
// Created by Note on 07.02.22.
//

import Foundation

enum ChatErrors: Error {
    case UserDoesntExistError(user: User)
    case ChatDoesntExistError(chat: Chat)
    case ChatWithUserAlreadyExists(chat: Chat)

}
