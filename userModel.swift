//
//  userModel.swift
//  ProyectoFinal
//
//  Created by iOS Lab on 01/06/23.
//

import Foundation

struct userModel: Encodable, Decodable {
    let name: String
    let monthBudget: Float
    let remainingMoney: Float
    let purchaseAmount: Int
    let foodPurchases: Int
    let funPurchases: Int
    let needPurchases: Int
}
