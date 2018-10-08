//
//  CreateOrderModels.swift
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

enum CreateOrder
{
    // MARK: Use cases
    
    enum Information
    {
        struct Request
        {
        }
        struct Response
        {
            var firstName:String
            var lastName:String
        }
        struct ViewModel
        {
            var firstName:String
            var lastName:String
        }
    }
    
    enum FormatExpirationDate
    {
        struct Request
        {
            var date:Date;
        }
        struct Response
        {
            var date:Date;
        }
        struct ViewModel
        {
            var date: String
        }
    }
}