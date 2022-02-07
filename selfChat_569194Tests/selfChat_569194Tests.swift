//
//  selfChat_569194Tests.swift
//  selfChat_569194Tests
//
//  Created by Note on 01.02.22.
//
//

import XCTest
@testable import selfChat_569194

class selfChat_569194Tests: XCTestCase {

    private var instance = AppInstance()
    
    override func setUpWithError() throws {
        instance.reset()

        let user: User = User(name: "testUser")
        var chat: Chat = Chat(user)
        try instance.addChat(chat)

        chat = try instance.getChatWithUser(user)
        chat.addMessage("this is my message", false)
        try instance.updateChat(chat)
    }

    override func tearDownWithError() throws {
        //instance.reset()
    }

    func testSaving() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.

        try instance.save()
        instance.fillWithTestValuesOnTestMode()
        try print(instance.asJson().unsafelyUnwrapped)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
