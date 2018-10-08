//
//  CreateOrderPresenter.swift
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

protocol CreateOrderPresentationLogic
{
    func presentExpirationDate(response: CreateOrder.FormatExpirationDate.Response)
    func presentInformation(response: CreateOrder.Information.Response)
}

class CreateOrderPresenter: CreateOrderPresentationLogic
{
    weak var viewController: CreateOrderDisplayLogic!
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        return dateFormatter
    }()
    
    // MARK: Do something
    
    func presentExpirationDate(response: CreateOrder.FormatExpirationDate.Response)
    {
        
        let stringDate = dateFormatter.string(from: response.date)
        let viewModel = CreateOrder.FormatExpirationDate.ViewModel(date: stringDate)
        viewController.displayExpirationDate(viewModel: viewModel);
    }
    
    func presentInformation(response: CreateOrder.Information.Response)
    {
        
        let viewModel = CreateOrder.Information.ViewModel(firstName: response.firstName, lastName:response.lastName)
        viewController.displayAutoInformation(viewModel: viewModel)
    }
}