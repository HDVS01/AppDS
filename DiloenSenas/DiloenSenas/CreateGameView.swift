//
//  CreateGameView.swift
//  DiloenSenas
//
//  Created by Alicia Ayón on 20/9/23.
//

import SwiftUI
import UIKit

struct CreateGameView: View {
    @ObservedObject var createGameModel: CreateGameModel
    @State private var selectedImage: Image? // Para seleccionar una Image
    @State private var selectedUIImage: UIImage? // Para almacenar el UIImage
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary

    var body: some View {
        VStack {
            // Otras vistas y controles aquí

            if let selectedImage = selectedImage {
                // Mostrar la Image seleccionada
                selectedImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 200)
            }

            Button(action: {
                // Presentar el selector de imágenes
                createGameModel.isShowingImagePicker = true
            }) {
                Text("Seleccionar Imagen")
            }
            .sheet(isPresented: $createGameModel.isShowingImagePicker, content: {
                // Presentar el ImagePicker
                ImagePickerView(selectedImage: $selectedUIImage, isPresented: $createGameModel.isShowingImagePicker, sourceType: $sourceType)
            })

            // Resto de la vista CreateGameView
        }
    }
}

// Modelo para almacenar datos relacionados con la creación de juegos
class CreateGameModel: ObservableObject {
    @Published var isShowingImagePicker = false
    @Published var selectedImage: UIImage?
    
    // Otras propiedades y funciones relacionadas con la creación de juegos
}

struct CreateGameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGameView(createGameModel: CreateGameModel())
    }
}
