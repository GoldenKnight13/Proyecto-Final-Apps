//
//  PurchaseLog.swift
//  ProyectoFinal
//
//  Created by iOS Lab on 30/05/23.
//

import Foundation
import SwiftUI

struct TransactionView: View {
    
    private var data = DataPersistence()
    @State private var transactions: [TransactionModel] = []
    
    func addTransaction(transactionModel: TransactionModel) -> Void {
        transactions.append(transactionModel)
        do{
            try data.saveTransactions(transactions: transactions)
        } catch{}
    }
    
    func deleteTransaction(transactionModel: TransactionModel) -> Void {
        transactions.removeAll{$0.id == transactionModel.id}
        do{
            try data.saveTransactions(transactions: transactions)
        } catch{}
    }
    
    var body: some View {
        
        VStack{
            NavigationStack{
                List(transactions) { transaction in
                    NavigationLink(destination: ShowTransactionView(transaction: transaction), label: {
                        VStack(alignment: .leading){
                            Text(transaction.title)
                                .font(.headline)
                            Text(transaction.date.formatted())
                                .font(.subheadline)
                        }.foregroundColor(.black)
                    })
                }.navigationTitle("Your transactions")
                    .navigationBarItems(trailing:
                                            NavigationLink(destination: {
                        AddTransactionView(handleAdd: addTransaction)
                    }){
                        Image(systemName: "plus")
                    }
                    )
            }
        }
        .onAppear{
            do{
                transactions = try data.loadTransactions()
            } catch{
                
            }
        }
    }
}

