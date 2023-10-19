//
//  LiveSessionViewModel.swift
//  DiloenSenas
//
//  Created by Alumno on 02/10/23.
//

import Foundation
import SwiftUI

class LiveSessionViewModel: ObservableObject {
    @Published var imageClassifier: ImageClassifier = ImageClassifier()
    @StateObject var ObjectVM = ObjectViewModel()
    @Published var objectsToScan: [ObjectModel] = []
    
    // Lista de objetos a escanear y sus instrucciones
    
    @Published var currentObjectIndex: Int = 0
    
    // Propiedades para mostrar el popup
    @Published var isPopupVisible: Bool = false
    @Published var popupMessage: String = ""
    
    init() {
        // Configuración inicial del ViewModel si es necesario
        fetchObjectsToScanFromAPI()
    }
    
    func objectDetectedSuccessfully() {
        // Cuando se detecta el objeto correcto, incrementa el índice para cambiar al siguiente objeto
        currentObjectIndex += 1
        
        // Verifica si se han escaneado todos los objetos
        if currentObjectIndex >= objectsToScan.count {
            // Puedes implementar acciones de finalización del juego aquí
            // Por ejemplo, mostrar un mensaje de victoria o reiniciar el juego
            currentObjectIndex = 0
        } else {
            // Mostrar el mensaje de objeto correcto en el popup
            isPopupVisible = true
            popupMessage = "¡Correcto!"
        }
    }
    
    func objectDetectedIncorrectly() {
        // Mostrar el mensaje de objeto incorrecto en el popup
        isPopupVisible = true
        popupMessage = "Incorrecto"
    }
    
    func closePopup() {
        // Ocultar el popup
        isPopupVisible = false
    }
    
    func fetchObjectsToScanFromAPI() {
        if let url = URL(string: "https://api-senas.onrender.com/objects") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let apiResponse = try decoder.decode(APIResponse.self, from: data)
                        self.objectsToScan = apiResponse.users
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                }
            }.resume()
        }
    }
}
