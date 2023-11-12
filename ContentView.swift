//
//  ContentView.swift
//  ProyectoFinal
//
//  Created by iOS Lab on 25/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        //Vistas tabuladas
        TabView{
            Userview()
                .tabItem{
                    Image(systemName: "info")
                    Text("My info")
                }
            TransactionView()
                .tabItem{
                    Image(systemName: "currency")
                    Text("Purchases")
                }
            Vista2()
                .tabItem{
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
