//
//  JoinSessionView.swift
//  DiloenSenas
//
//  Created by Alicia Ayón on 20/9/23.
//

import SwiftUI

struct JoinSessionView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("fondosolo")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                Text("JOIN SESSION")
                    .font(.system(size: 40))  // Aumenta el tamaño de la fuente
                    .padding()  // Añade un poco de espacio alrededor
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct JoinSession_Preview: PreviewProvider {
    static var previews: some View {
        JoinSessionView()
    }
}

