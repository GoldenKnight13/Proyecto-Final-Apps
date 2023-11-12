//
//  ShowTransactionView.swift
//  ProyectoFinal
//
//  Created by iOS Lab on 01/06/23.
//

import Foundation
import SwiftUI

struct ShowTransactionView: View {
    let transaction: TransactionModel
    var handleDelete: (TransactionModel) -> Void = {_ in }
    
    @State var show = false
    
    var body: some View {
        
        VStack{
            Text(transaction.title)
            Text("")
            Text(transaction.date.formatted())
            
            if !transaction.description.isEmpty{
                Text("")
                Text("Descripción:")
                Text(transaction.description)
            }
            
            Button("Delete transaction"){
                handleDelete(transaction)
            }
            
            
            
        }
        
        
        
        
        
    }
}
