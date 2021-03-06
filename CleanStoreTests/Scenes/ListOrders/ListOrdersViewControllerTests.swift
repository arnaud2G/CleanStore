//
//  ListOrdersViewControllerTests.swift
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

class ListOrdersViewControllerTests: XCTestCase
{
    // MARK: Subject under test
    
    var sut: ListOrdersViewController!
    var window: UIWindow!
    
    // MARK: Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        window = UIWindow()
        setupListOrdersViewController()
    }
    
    override func tearDown()
    {
        window = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupListOrdersViewController()
    {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "ListOrdersViewController") as? ListOrdersViewController
    }
    
    func loadView()
    {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Test doubles
    
    class ListOrdersBusinessLogicSpy: ListOrdersBusinessLogic
    {
        var fetchOrdersCalled = false
        
        func fetchOrders(request: ListOrders.FetchOrders.Request) {
            fetchOrdersCalled = true
        }
    }
    
    class tableViewSpy:UITableView
    {
        // MARK: Method call expectations
        var reloadDataCalled = false
        
        // MARK: Spied methods
        override func reloadData()
        {
            reloadDataCalled = true
        }
    }
    
    
    
    // MARK: Tests
    func testShouldfetchOrdersWhenViewIsLoaded()
    {
        // Given
        let spy = ListOrdersBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        
        // Then
        XCTAssertTrue(spy.fetchOrdersCalled, "viewDidLoad() should ask the interactor to do something")
    }
    
    func testShouldDisplayFetchedOrders()
    {
        // Given
        let spy = tableViewSpy()
        sut.tableView = spy
        
        let displayedOrders = [ListOrders.FetchOrders.ViewModel.DisplayedOrder(id: "abc123", date: "6/29/07", email: "amy.apple@clean-swift.com", name: "Amy Apple", total: "$1.23")]
        let viewModel = ListOrders.FetchOrders.ViewModel(displayedOrders: displayedOrders)
        
        // When
        sut.displayFetchOrders(viewModel: viewModel)
        
        // Then
        XCTAssertTrue(spy.reloadDataCalled, "displayFetchOrders() should ask the table view to reload data")
    }
    
    func testNumberOfRowAfterDisplayFetchedOrders()
    {
        // Given
        let spy = tableViewSpy()
        sut.tableView = spy
        
        let displayedOrders = [ListOrders.FetchOrders.ViewModel.DisplayedOrder(id: "abc123", date: "6/29/07", email: "amy.apple@clean-swift.com", name: "Amy Apple", total: "$1.23")]
        let viewModel = ListOrders.FetchOrders.ViewModel(displayedOrders: displayedOrders)
        
        // When
        sut.displayFetchOrders(viewModel: viewModel)
        
        // Then
        XCTAssertEqual(spy.numberOfRows(inSection: 0), displayedOrders.count, "Number of row should be equal to number of orders")
    }
    
    func testShouldConfigureTableViewCellToDisplayOrder()
    {
        // Given
        let testDisplayedOrders = [ListOrders.FetchOrders.ViewModel.DisplayedOrder(id: "abc123", date: "6/29/07", email: "amy.apple@clean-swift.com", name: "Amy Apple", total: "$1.23")]
        sut.displayOrders = testDisplayedOrders
        
        // When
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.tableView(sut.tableView, cellForRowAt: indexPath)
        
        // Then
        XCTAssertEqual(cell.textLabel?.text, "6/29/07", "A properly configured table view cell should display the order date")
        XCTAssertEqual(cell.detailTextLabel?.text, "$1.23", "A properly configured table view cell should display the order total")
    }
}
