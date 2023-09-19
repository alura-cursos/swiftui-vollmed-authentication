//
//  ContentView.swift
//  Vollmed
//
//  Created by Giovanna Moeller on 12/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var authManager = AuthenticationManager.shared
    
    var body: some View {
        
        if authManager.token == nil {
            NavigationStack {
                SignInView()
            }
        } else {
            TabView {
                NavigationStack {
                    HomeView()
                }
                .tabItem {
                    Label(
                        title: { Text("Home") },
                        icon: { Image(systemName: "house") }
                    )
                }
                
                NavigationStack {
                    MyAppointmentsView()
                }
                .tabItem {
                    Label(
                        title: { Text("Minhas consultas") },
                        icon: { Image(systemName: "calendar") }
                    )
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
