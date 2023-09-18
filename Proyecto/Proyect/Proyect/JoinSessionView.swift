//
//  JoinSessionView.swift
//  Proyect
//
//  Created by Alumno on 18/09/23.
//

import SwiftUI
import UIKit
import AVFoundation

struct JoinSessionView: View {
    @State private var showPINInput = false
    @State private var showQRScanner = false
    @State private var enteredPIN = ""
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.showPINInput = true
                    self.showQRScanner = false
                }) {
                    Text("Ingresa PIN")
                        .frame(width: 150, height: 50)
                        .background(Color.blue.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    
                }
                .padding()
                
                Button(action: {
                    self.showPINInput = false
                    self.showQRScanner = true
                }) {
                    Text("Escanea QR")
                        .frame(width: 150, height: 50)
                        .background(Color.blue.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            
            if showPINInput {
                // Vista para ingresar el PIN
                TextField("Ingresa el PIN", text: $enteredPIN)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    // Aquí debes verificar el PIN y unirte a la sesión si es correcto
                }) {
                    Text("Unirse a la Sesión")
                        .frame(width: 200, height: 50)
                        .background(Color.blue.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            } else if showQRScanner {
                // Vista para escanear el código QR (necesitarás implementar esto utilizando UIKit)
                QRScannerView()
            }
            
            Spacer()
            
            //if showPINInput
            VStack{
                NavigationLink(destination: LobbySession()) {
                    Text("Unirse a Sesión")
                        .frame(width: 200, height: 50)
                        .background(Color.blue.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            
            
        }
    }
}

struct QRScannerView: View {
    var body: some View {
        // Aquí debes implementar la vista que abre la cámara y escanea el código QR utilizando UIKit
        // Puedes hacerlo en una representación UIViewControllerRepresentable
        Text("Escanea QR aquí")
            .font(.largeTitle)
            .onAppear {
                // Aquí debes abrir la cámara para escanear el código QR
            }
    }
}


struct JoinSession_Preview: PreviewProvider {
    static var previews: some View {
        JoinSessionView()
    }
}

