//
//  CreateGameView.swift
//  api-senas-post
//
//  Created by user240259 on 10/17/23.
//

import SwiftUI
import UIKit

struct CreateGameView: View {
    @State private var isOn = false
    @ObservedObject var createGameModel: CreateGameModel
    @ObservedObject var objectsToggle = ObjectsToggle()
    @State private var selectedSegment = 0
    @State private var selectedImage: Image? // Para seleccionar una Image
    @State private var selectedUIImage: UIImage? // Para almacenar el UIImage
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
   
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image("fondosolo")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
            .zIndex(0)
            ScrollView{
                VStack {
                    Spacer(minLength: 20)
                    Text("¡CREA TU PROPIO ESCAPE!").font(Font.custom("Rowdies", size: 45)).foregroundColor(Color(red: 55/255, green: 215/255, blue: 70/255))
                   Spacer(minLength: 25)
           
                    // Título
                    Text("Título del Escape").font(.custom("Rowdies", size: 25)).foregroundColor(Color(red: 55/255, green: 215/255, blue: 70/255))
                   
                    TextField("Título", text: $createGameModel.titulo)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 500) // Establece el ancho máximo
                        .multilineTextAlignment(.center) // Centra el texto dentro del TextField}
                        .cornerRadius(10)
                   
                    // Descripción
                    Text("Descripción").font(.custom("Rowdies-Regular", size: 22)).foregroundColor(Color(red: 55/255, green: 215/255, blue: 70/255))
                    Spacer()
                    TextField("Descripción", text: $createGameModel.descripcion)
                        .foregroundColor(Color.black)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 500) // Establece el ancho máximo
                        .multilineTextAlignment(.center) // Centra el texto dentro del TextField
                        .cornerRadius(10)
                   
                   
                    // Visibilidad (usando Picker para seleccionar entre "Pública" y "Privada")
                    Text("Visibilidad").font(.custom("Rowdies", size: 22)).foregroundColor(Color(red: 55/255, green: 215/255, blue: 70/255)).bold()
                    Picker("Visibilidad", selection: $createGameModel.visibilidad) {
                        Text("Pública")
                            .tag("Pública")
                            .font(Font.custom("Rowdies", size: 45))
                        Text("Privada")
                            .tag("Privada")
                            .font(Font.custom("Rowdies", size: 45))
                    }
                   
                    .pickerStyle(SegmentedPickerStyle()).frame(width: 500).cornerRadius(10)
                    Spacer()
                }
                // Categoría (usando Picker para seleccionar entre "Escolar" y "En casa")
                Text("Categoría").font(.custom("Rowdies-Regular", size: 22)).foregroundColor(Color(red: 55/255, green: 215/255, blue: 70/255)).bold()
                Picker("Categoría", selection: $createGameModel.categoria) {
                    Text("Escolar").tag("Escolar")
                    Text("En casa").tag("En casa")
                        .multilineTextAlignment(.center) // Centra el texto dentro del TextField
                }
                .pickerStyle(SegmentedPickerStyle()).frame(width: 500).cornerRadius(10)
                Spacer(minLength: 30)
               
                VStack {
                    Text("Selecciona los objetos que utilizarás en el ESCAPE")
                        .font(.custom("Rowdies-Regular", size: 22))
                        .foregroundColor(Color(red: 55/255, green: 215/255, blue: 70/255))
                        .bold()
                    Spacer(minLength: 20)
                   
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20)]) {
                        Toggle("Lápiz", isOn: $objectsToggle.lapizToggle)          .font(.custom("Rowdies-Regular", size: 22))
                        Toggle("Pluma", isOn: $objectsToggle.plumaToggle)
                            .font(.custom("Rowdies-Regular", size: 22))
                        Toggle("Libreta", isOn: $objectsToggle.libretaToggle)
                            .font(.custom("Rowdies-Regular", size: 22))
                        Toggle("Libro", isOn: $objectsToggle.libroToggle)
                            .font(.custom("Rowdies-Regular", size: 22))
                        Toggle("Borrador", isOn: $objectsToggle.borradorToggle)
                            .font(.custom("Rowdies-Regular", size: 22))
                        Toggle("Regla", isOn: $objectsToggle.reglaToggle)
                            .font(.custom("Rowdies-Regular", size: 22))
                        Toggle("Crayola", isOn: $objectsToggle.crayolaToggle)
                            .font(.custom("Rowdies-Regular", size: 22))
                        Toggle("Sacapuntas", isOn: $objectsToggle.sacapuntasToggle)
                            .font(.custom("Rowdies-Regular", size: 22))
                        Toggle("Pegamento", isOn: $objectsToggle.pegamentoToggle)     .font(.custom("Rowdies-Regular", size: 22))

                       
                    }
                }
                Spacer(minLength: 30)
                //TOGGLE ON
                VStack(spacing:20){
                   //Lapiz
                   if objectsToggle.lapizToggle {
                       ObjectPickerView(objectName: "Lápiz")
                   }
                   //Pluma
                   if objectsToggle.plumaToggle {
                       ObjectPickerView(objectName: "Pluma")
                   }

                   //Libreta
                   if objectsToggle.libretaToggle {
                       ObjectPickerView(objectName: "Pluma")
                   }
                   //Libro
                   if objectsToggle.libroToggle {
                       ObjectPickerView(objectName: "Libreta")
                   }
                   
                   //borrador
                   if objectsToggle.borradorToggle {
                       ObjectPickerView(objectName: "Borrador")
                   }
                   //Crayola
                   if objectsToggle.crayolaToggle {
                       ObjectPickerView(objectName: "Crayola")
                   }
                   //Sacapuntas
                   if objectsToggle.sacapuntasToggle {
                       ObjectPickerView(objectName: "Sacapuntas")
                   }
                   //Regla
                   else if objectsToggle.reglaToggle {
                       ObjectPickerView(objectName: "Regla")
                   }
                   //Pegamento
                   else if objectsToggle.pegamentoToggle {
                       ObjectPickerView(objectName: "Pegamento")
                   }
                   //BorradorPizarra
                   else if objectsToggle.borradorPizarronToggle {
                       ObjectPickerView(objectName: "Borrador de Pizarron")
                   }

               }
               
                VStack {
                    Spacer(minLength: 15)
                    Button(action: {
                        
                        
                        postData()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4){
                            postDataObjects()
                            
                        }
                        
                        
                    }) {
                        Text("Guardar")
                            .frame(width: 150, height: 50)
                            .background(Color(red: 55/255, green: 215/255, blue: 70/255))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .font(Font.custom("Rowdies", size: 25))
                        

                    }

                }
                Spacer()
               
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.clear)
            .alignmentGuide(.top) { _ in 0 }
        }
    }
    func postData() {
        let url = URL(string: "https://api-senas.onrender.com/escapes/add")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let parameters: [String: Any] = [
            "TITLE": createGameModel.titulo,
            "DESCRIPTION": createGameModel.descripcion,
            "VISIBILITY": "PUBLIC",
            "APPLEID_CREATOR": "apple id 1",
            "DATE_OF_CREATION": "2023-10-01T00:00:00.000Z",
            "ACTIVE": "Active",
            "CATEGORIES_ID": 3
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
        } catch {
            print("Error creating JSON data: \(error)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                if let responseString = String(data: data, encoding: .utf8) {
                    print("Response: \(responseString)")
                }
            }
        }
        
        task.resume()
    }
    func postDataObjects() {
        let url = URL(string: "https://api-senas.onrender.com/escapes_objects/addWithRecentEscape")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        if objectsToggle.lapizToggle {
            
            let parameters: [String: Any] = [
                "OBJECTS_ID": 1,
                "VIDEO_CLUES_ID": 1,
                "DATE_OF_CREATION": "2023-10-01T00:00:00.000Z",
                "ACTIVE": "Active"
            ]
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
            } catch {
                print("Error creating JSON data: \(error)")
                return
            }
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                } else if let data = data {
                    if let responseString = String(data: data, encoding: .utf8) {
                        print("Response: \(responseString)")
                    }
                }
            }
            
            task.resume()
        }
    
    if objectsToggle.libretaToggle {
        
        let parameters: [String: Any] = [
            "OBJECTS_ID": 12,
            "VIDEO_CLUES_ID": 1,
            "DATE_OF_CREATION": "2023-10-01T00:00:00.000Z",
            "ACTIVE": "Active"
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
        } catch {
            print("Error creating JSON data: \(error)")
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                if let responseString = String(data: data, encoding: .utf8) {
                    print("Response: \(responseString)")
                }
            }
        }
        
        task.resume()
    }
        if objectsToggle.borradorToggle {
            
            let parameters: [String: Any] = [
                "OBJECTS_ID": 7,
                "VIDEO_CLUES_ID": 1,
                "DATE_OF_CREATION": "2023-10-01T00:00:00.000Z",
                "ACTIVE": "Active"
            ]
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
            } catch {
                print("Error creating JSON data: \(error)")
                return
            }
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                } else if let data = data {
                    if let responseString = String(data: data, encoding: .utf8) {
                        print("Response: \(responseString)")
                    }
                }
            }
            
            task.resume()
        }
        if objectsToggle.pegamentoToggle {
            
            let parameters: [String: Any] = [
                "OBJECTS_ID": 15,
                "VIDEO_CLUES_ID": 1,
                "DATE_OF_CREATION": "2023-10-01T00:00:00.000Z",
                "ACTIVE": "Active"
            ]
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
            } catch {
                print("Error creating JSON data: \(error)")
                return
            }
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                } else if let data = data {
                    if let responseString = String(data: data, encoding: .utf8) {
                        print("Response: \(responseString)")
                    }
                }
            }
            
            task.resume()
        }
        if objectsToggle.plumaToggle {
            
            let parameters: [String: Any] = [
                "OBJECTS_ID": 14,
                "VIDEO_CLUES_ID": 1,
                "DATE_OF_CREATION": "2023-10-01T00:00:00.000Z",
                "ACTIVE": "Active"
            ]
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
            } catch {
                print("Error creating JSON data: \(error)")
                return
            }
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                } else if let data = data {
                    if let responseString = String(data: data, encoding: .utf8) {
                        print("Response: \(responseString)")
                    }
                }
            }
            
            task.resume()
        }
        
        if objectsToggle.libroToggle {
            
            let parameters: [String: Any] = [
                "OBJECTS_ID": 13,
                "VIDEO_CLUES_ID": 1,
                "DATE_OF_CREATION": "2023-10-01T00:00:00.000Z",
                "ACTIVE": "Active"
            ]
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
            } catch {
                print("Error creating JSON data: \(error)")
                return
            }
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                } else if let data = data {
                    if let responseString = String(data: data, encoding: .utf8) {
                        print("Response: \(responseString)")
                    }
                }
            }
            
            task.resume()
        }
        if objectsToggle.reglaToggle {
            
            let parameters: [String: Any] = [
                "OBJECTS_ID": 16,
                "VIDEO_CLUES_ID": 1,
                "DATE_OF_CREATION": "2023-10-01T00:00:00.000Z",
                "ACTIVE": "Active"
            ]
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
            } catch {
                print("Error creating JSON data: \(error)")
                return
            }
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                } else if let data = data {
                    if let responseString = String(data: data, encoding: .utf8) {
                        print("Response: \(responseString)")
                    }
                }
            }
            
            task.resume()
        }
        
        if objectsToggle.sacapuntasToggle {
            
            let parameters: [String: Any] = [
                "OBJECTS_ID": 17,
                "VIDEO_CLUES_ID": 1,
                "DATE_OF_CREATION": "2023-10-01T00:00:00.000Z",
                "ACTIVE": "Active"
            ]
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
            } catch {
                print("Error creating JSON data: \(error)")
                return
            }
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                } else if let data = data {
                    if let responseString = String(data: data, encoding: .utf8) {
                        print("Response: \(responseString)")
                    }
                }
            }
            
            task.resume()
        }

    }
    
}
    // Modelo para almacenar datos relacionados con la creación de juegos
    class CreateGameModel: ObservableObject {
        @Published var titulo = ""
        @Published var descripcion = ""
        @Published var visibilidad = "Pública" // Valor predeterminado
        @Published var categoria = "Escolar" // Valor predeterminado
        @Published var preguntas: [Question] = []  // Arreglo de preguntas
       
        // Otras propiedades y funciones relacionadas con la creación de juegos
    }




struct CreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameView(createGameModel: CreateGameModel())
    }
}
