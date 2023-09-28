//
//  CreateSessionView.swift
//  Proyect
//
//  Created by Alumno on 18/09/23.
//

import SwiftUI

struct CreateSessionView: View {
    @State private var maxAmount = 10
    @State private var sessionType = "School"
    let amountPlayers = [10,20,30,40]
    let sessions = ["School", "House"]
    
    var body: some View {
        Text("Configure Session")
            .bold()
        Form{
            Section {
                Picker("Amount of players: ", selection: $maxAmount){
                    ForEach(amountPlayers, id:\.self){
                        Text("\($0)")
                    }
                }
            }
            Section {
                Picker("Type of Scene: ", selection: $maxAmount){
                    ForEach(sessions, id:\.self){
                        Text($0)
                    }
                }
            }
            NavigationLink(destination: MainView()){
                Text("Iniciar Sesion")
            }
        }
    }
}

struct CreateSessionView_Previews: PreviewProvider {
    static var previews: some View {
        CreateSessionView()
    }
}
