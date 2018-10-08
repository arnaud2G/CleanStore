//
//  ListOrdersInteractorTests.swift
//  CleanStore
//
//  Created by Arnaud Verrier on 28/09/2018.
//  Copyright (c) 2018 tagattitude. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import CleanStore
import XCTest

class ListOrdersInteractorTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: ListOrdersInteractor!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        setupListOrdersInteractor()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupListOrdersInteractor()
    {
        sut = ListOrdersInteractor()
    }
    
    // MARK: Test doubles
    
    class ListOrdersPresentationLogicSpy: ListOrdersPresentationLogic
    {
        func presentFetchOrder(response: ListOrders.FetchOrders.Response) {
            presentFetchOrderCalled = true
        }
        
        var presentFetchOrderCalled = false
    }
    
    class OrdersWorkerSpy: OrdersWorker
    {
        // MARK: Method call expectations
        var fetchOrdersCalled = false
        
        // MARK: Spied methods
        override func fetchOrders(completionHandler: @escaping ([Order]) -> Void) {
            
            fetchOrdersCalled = true;
            completionHandler([])
        }
    }
    
    // MARK: Tests
    
    func testFetchOrderWorkerCalled()
    {
        // Given
        let spy = OrdersWorkerSpy(ordersStore: OrdersMemStore())
        sut.orderWorker = spy
        let request = ListOrders.FetchOrders.Request()
        
        // When
        sut.fetchOrders(request: request)
        
        // Then
        XCTAssertTrue(spy.fetchOrdersCalled, "fetchOrders(request:) should do some work : fetch Orders")
    }
    
    func testPresentFetchOrderCalled()
    {
        // Given
        let spy = ListOrdersPresentationLogicSpy()
        sut.presenter = spy
        sut.orderWorker = OrdersWorkerSpy(ordersStore: OrdersMemStore())
        let request = ListOrders.FetchOrders.Request()
        
        // When
        sut.fetchOrders(request: request)
        
        // Then
        XCTAssertTrue(spy.presentFetchOrderCalled, "fetchOrders(request:) should ask the presenter to format the result")
    }
}