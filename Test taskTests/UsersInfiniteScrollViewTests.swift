//
//  UsersInfiniteScrollViewTests.swift
//  Test taskTests
//
//  Created by Сергей on 24.03.2021.
//

import XCTest
@testable import Test_task

class UsersInfiniteScrollViewTests: XCTestCase {
    
    var sut: UsersInfiniteScrollViewModel!
    var mockNetworkManager: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager.shared
        sut = .init(networkManager: mockNetworkManager)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testAddingItemsToArrayUsersOnLoad() {
        sut.actionLoadPage()
        print(sut.users)
        XCTAssert(!sut.users.isEmpty, "users are not loaded into the array")
    }
    
    func testPageInformationAvailability() {
        sut.actionLoadPage()
        XCTAssert(sut.listUsers != nil)
    }
    
    func testNextPageLoad() {
        sut.actionLoadPage()
        let currentPage = sut.listUsers?.page
        print(currentPage as Any)
        sut.actionLoadPage()
        let nexPage = sut.listUsers?.page
        print(nexPage as Any)
        
        XCTAssert((currentPage != nexPage), "Error loading next page")
    }
    
    func testAddItemToArrayUsersWhenLoadingNewPage() {
        let amountItemsBeforeLoading = sut.users.count
        sut.actionLoadPage()
        let amountItemsAfterLoading = sut.users.count
        
        XCTAssert(amountItemsBeforeLoading != amountItemsAfterLoading)
        
    }
    
    func testStopAddingItemsAfterReachingTheLastPage() {
        sut.actionLoadPage()
        
        if let totalPage = sut.listUsers?.totalPages {
            for _ in 1...(totalPage - 1) {
                sut.actionLoadPage()
            }
        }
        
        let amountItemsBeforeLoading = sut.users.count

        sut.actionLoadPage()
        
        let amountItemsAfterLoading = sut.users.count
       
        XCTAssert(amountItemsBeforeLoading == amountItemsAfterLoading &&
                    !sut.users.isEmpty)
    }
    
    func testLoadPageWhenPenultimateRowAppears() {
        sut.actionLoadPage()
        let firsPage = sut.listUsers?.page
        let penultimateLineIndex = sut.users.count - 2
        sut.actionWhenRowAppears(with: penultimateLineIndex)
        
        let secondPage = sut.listUsers?.page
        XCTAssert(firsPage != secondPage && firsPage != nil && secondPage != nil)
        
    }
    
    
}
