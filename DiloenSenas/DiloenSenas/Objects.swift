//
//  Objects.swift
//  DiloenSenas
//
//  Created by Alumno on 11/10/23.
//

import SwiftUI

class ObjectsToggle: ObservableObject {
    @Published var lapizToggle = false
    @Published var plumaToggle = false
    @Published var libretaToggle = false
    @Published var libroToggle = false
    @Published var borradorToggle = false
    @Published var reglaToggle = false
    @Published var crayolaToggle = false
    @Published var sacapuntasToggle = false
    @Published var pegamentoToggle = false
    @Published var borradorPizarronToggle = false
    
}


struct ObjectPickerView: View {
    let objectName: String
    @State private var selectedLevel: String = "Fácil"
    @State private var urlInput: String = ""

    
    var body: some View {
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(red: 55/255, green: 215/255, blue: 70/255))
                        .cornerRadius(20)
                        .frame(width: 700, height: 150)
                    
                    VStack {
                        Spacer()
                        
                        Text("Objeto: \(objectName)")
                            .font(Font.custom("Rowdies-Regular", size: 20))
                        Spacer(minLength: 15)
                        HStack(spacing:30){
                            VStack{
                                Text("Selecciona la dificultad")
                                    .font(Font.custom("Rowdies-Regular", size: 15))
                                Picker("Nivel", selection: $selectedLevel) {
                                    Text("Fácil").tag("Fácil")
                                    Text("Intermedio").tag("Intermedio")
                                    Text("Avanzado").tag("Avanzado")
                                }
                                .pickerStyle(SegmentedPickerStyle()).frame(width: 250)
                                
                            }
                            
                            VStack {
                                Text("o")
                                    .font(Font.custom("Rowdies-Regular", size: 30))
                            }

                            VStack {
                                Text("Sube tu propia URL")
                                    .font(Font.custom("Rowdies-Regular", size: 15))
                                
                                TextField("Introduce tu URL aquí", text: $urlInput)
                                    .font(.custom("Rowdies-Bold", size: 15))
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(width: 250) // Establece el ancho máximo
                                    .multilineTextAlignment(.center) // Centra el texto dentro del TextField}
                                    .cornerRadius(10)
                                    

                            }

                            
                        }
                        Spacer()
                    }
                }
            }
        }
}
