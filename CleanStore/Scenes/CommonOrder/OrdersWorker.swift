//
//  OrderWorker.swift
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

protocol OrdersStoreProtocol {
    
    func fetchOrders(completionHandler:  @escaping (_ orders: [Order]) -> Void)
}

class OrdersWorker
{
    
    var ordersStore: OrdersStoreProtocol
    
    init(ordersStore: OrdersStoreProtocol)
    {
        self.ordersStore = ordersStore
    }
    
    func fetchOrders(completionHandler: @escaping (_ orders:[Order]) -> Void) {
        
        ordersStore.fetchOrders(completionHandler: completionHandler)
    }
}
