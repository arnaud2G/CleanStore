//
//  ListOrdersModels.swift
//  CleanStore
//
//  Created by Arnaud Verrier on 28/09/2018.
//  Copyright (c) 2018 tagattitude. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum ListOrders
{
  // MARK: Use cases
  
  enum FetchOrders
  {
    struct Request
    {
    }
    struct Response
    {
        var orders: [Order]
    }
    struct ViewModel
    {
        struct DisplayedOrder
        {
            var id: String
            var date: String
            var email: String
            var name: String
            var total: String
        }
        var displayedOrders: [DisplayedOrder]
    }
  }
}
