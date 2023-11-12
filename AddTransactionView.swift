//
//  AddTransactionView.swift
//  Datos
//
//  Created by iOS Lab on 01/06/23.
//

import SwiftUI

struct AddTransactionView: View {
    
    //
    var handleAdd: (TransactionModel) -> Void = {_ in }
    let categories = ["Alimentos", "Entretenimiento", "Gastos necesarios"]
    @State private var emptyFields = false
    @State private var wrongInput = false

    //Variables de usuario
    @State private var newTransactionTitle = ""
    @State private var newTransactionCategory = ""
    @State private var newTransactionAmount = ""
    @State private var newTransactionDescription = ""

    @Environment(\.presentationMode) var presentation

    var body: some View {
        NavigationView {
            Form {
                Section {
                    
                    TextField("Title", text: $newTransactionTitle)
                    TextField("Amount", text: $newTransactionAmount)
                    Picker("Categoria", selection: $newTransactionCategory){
                        ForEach(categories, id: \.self){
                            Text($0)
                        }
                    }
                    
                }
                
                TextField("Description", text: $newTransactionDescription)
                
                Section {
                    Button("Add new transaction") {
                        if newTransactionTitle.isEmpty && newTransactionAmount.isEmpty && newTransactionCategory.isEmpty {
                            emptyFields = true
                        } else {
                            
                            let transactionValue = Float(newTransactionAmount) ?? -1
                            
                            if transactionValue <= 0  {
                                wrongInput = true
                            } else {
                                
                                let transaction = TransactionModel(id: UUID(), title: newTransactionTitle, date: Date(), amount: transactionValue, category: newTransactionCategory, description: newTransactionDescription)
                                handleAdd(transaction)
                                self.presentation.wrappedValue.dismiss()
                            }
                            
                        }
                    }
                }
            }
            .navigationTitle("Add transaction")
            .alert(isPresented: $emptyFields) {
                Alert(
                    title: Text("Error"),
                    message: Text("Por favor rellene bien los campos"),
                    dismissButton: .default(Text("OK"))
                )
            }
            .alert(isPresented: $wrongInput) {
                Alert(
                    title: Text("Error"),
                    message: Text("Ingrese una cantidad valida"),
                    dismissButton: .default(Text("OK"))
                )
            }

        }
    }
}
