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
    
    // Lista de objetos a escanear y sus instrucciones
    var objectsToScan: [(name: String, instructions: String)] = [
        ("cat", "Encuentra el cat  en la imagen."),
        ("dog", "Encuentra el dog  en la imagen."),
        // Agrega más objetos e instrucciones según sea necesario
    ]
    
    @Published var currentObjectIndex: Int = 0
    
    var currentInstructions: String {
        return objectsToScan[currentObjectIndex].instructions
    }
    
    init() {
        // Configuración inicial del ViewModel si es necesario
    }
    
    func objectDetectedSuccessfully() {
        // Cuando se detecta el objeto correcto, incrementa el índice para cambiar al siguiente objeto
        currentObjectIndex += 1
        
        // Verifica si se han escaneado todos los objetos, en cuyo caso puedes mostrar un mensaje de victoria o reiniciar el juego
        if currentObjectIndex >= objectsToScan.count {
            // Puedes implementar acciones de finalización del juego aquí
            // Por ejemplo, mostrar un mensaje de victoria o reiniciar el juego
            currentObjectIndex = 0
        }
    }
}
