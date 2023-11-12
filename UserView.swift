//
//  UserView.swift
//  ProyectoFinal
//
//  Created by iOS Lab on 30/05/23.
//

import Foundation
import SwiftUI

struct Userview: View {
    
    private var data = DataPersistence()
    @State private var user: userModel
    
    var body: some View {
        VStack(alignment: .center){
            
            Text("Hola \(user.name)")
                .font(.title)
            Spacer()
            Text("Your month budget: $\(user.monthBudget)")
                .font(.headline)
            Text("Your remaining budget: $\(user.remainingMoney)")
                .font(.headline)
            Text("Total purchases: \(user.purchaseAmount)")
                .font(.headline)
            Spacer()
            Text("Purchase description:")
                .font(.headline)
            Text("Food: \(user.foodPurchases)")
                .font(.subheadline)
            Text("Need: \(user.needPurchases)")
                .font(.subheadline)
            Text("Fun: \(user.funPurchases)")
                .font(.subheadline)
            
        }.onAppear{
            do{
                user = try data.loadUser()
            } catch{}
        }
    }
    
}
