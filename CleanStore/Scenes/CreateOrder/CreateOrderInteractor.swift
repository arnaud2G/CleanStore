//
//  CreateOrderInteractor.swift
//  CleanStore
//
//  Created by Arnaud Verrier on 27/09/2018.
//  Copyright (c) 2018 tagattitude. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CreateOrderBusinessLogic
{
    var shippingMethods: [String] { get }
    func formatExpirationDate(request: CreateOrder.FormatExpirationDate.Request);
    func autoFormatInformation();
}

protocol CreateOrderDataStore
{
    var firstName: String? { get set }
    var lastName: String? { get set }
}

class CreateOrderInteractor: CreateOrderBusinessLogic, CreateOrderDataStore
{
    var firstName: String?
    var lastName: String?
    
    var presenter: CreateOrderPresentationLogic!
    var worker: CreateOrderWorker?
    
    var shippingMethods: [String] = [
        "Standard Shipping",
        "Two-Day Shipping ",
        "One-Day Shipping "
    ]
    
    func formatExpirationDate(request: CreateOrder.FormatExpirationDate.Request) {
        
        let response = CreateOrder.FormatExpirationDate.Response(date: request.date)
        presenter.presentExpirationDate(response:response)
    }
    
    func autoFormatInformation() {
        
        if let firstName = firstName, let lastName = lastName {
            
            let response = CreateOrder.Information.Response(firstName:firstName, lastName:lastName)
            presenter.presentInformation(response: response)
        }
    }
    
    //var name: String = ""
    
    // MARK: Do something
    
    /*func doSomething(request: CreateOrder.Something.Request)
    {
        worker = CreateOrderWorker()
        worker?.doSomeWork()
        
        let response = CreateOrder.Something.Response()
        presenter?.presentSomething(response: response)
    }*/
    
    
    
    
    
    
}
