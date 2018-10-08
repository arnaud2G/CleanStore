//
//  OrdersMemStore.swift
//  CleanStore
//
//  Created by Arnaud Verrier on 28/09/2018.
//  Copyright © 2018 tagattitude. All rights reserved.
//

import Foundation

class OrdersMemStore: OrdersStoreProtocol
{
    func fetchOrders(completionHandler: @escaping (_ orders: [Order]) -> Void)
    {
        completionHandler([])
    }
}
