//
//  LiveSessionView.swift
//  DiloenSenas
//
//  Created by Alicia Ayón on 20/9/23.
//

import SwiftUI

struct LiveSession: View {
    @State private var isPresented: Bool = false
    @State private var selectedImage: UIImage?
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    //@ObservedObject var classifier: ImageClassifier
    @ObservedObject var viewModel: LiveSessionViewModel // Cambia a usar el ViewModel
    @State private var isShowingAlert = false
    @State private var alertMessage = ""
        

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("fondosolo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    ZStack(alignment: .bottom) {
                        Rectangle()
                            .foregroundColor(Color(red: 55/255, green: 215/255, blue: 70/255))
                            .cornerRadius(10)
                            .frame(width: 550, height: 350)
                        
                        VStack{
                            Image(systemName: "video") // aquí va la imagen o el video
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 190) // Tamaño de la imagen/video
                            Text("Instrucciones")
                                .font(.headline)
                                .padding()
                        }
                    }
                    
                    
                    VStack {
                        Rectangle()
                            .strokeBorder(Color(red: 55/255, green: 215/255, blue: 70/255),style: StrokeStyle(lineWidth: 5))
                            .overlay(
                                Group {
                                    if let selectedImage = selectedImage {
                                        Image(uiImage: selectedImage)
                                            .resizable()
                                            .scaledToFit()
                                    }
                                }
                            )
                        
                        VStack {
                            //print(viewModel.objectsToScan[viewModel.currentObjectIndex].name)
                            Button(action: {
                                
                                let userWon = true
                                let userLose = true

                                if userWon {
                                    alertMessage = "¡Ganaste!"
                                } else {
                                    alertMessage = "Perdiste."
                                }

                                // Mostrar el pop-up.
                                isShowingAlert = true
                
                                if let selectedImage = selectedImage {
                                    /*
                                     if viewModel.imageClassifier.detect(uiImage: selectedImage) == viewModel.objectsToScan[viewModel.currentObjectIndex].name {
                                     viewModel.objectDetectedSuccessfully()
                                     }
                                     */
                                    viewModel.imageClassifier.detect(uiImage: selectedImage)
                                    if viewModel.imageClassifier.imageClass == viewModel.objectsToScan[viewModel.currentObjectIndex].name {
                                        viewModel.objectDetectedSuccessfully()
                                    }
                                    print("-----------------------------------------------------")
                                    print(viewModel.objectsToScan[viewModel.currentObjectIndex].name)
                                    print("-----------------------------------------------------")
                                    
                                }
                            }) {
                                Image(systemName: "camera.fill")
                                    .foregroundColor(.green)
                                    .font(.title)
                            }
                            
                            .alert(isPresented: $isShowingAlert) {
                                        Alert(title: Text("Resultado"), message: Text(alertMessage), dismissButton: .default(Text("Aceptar")))
                                    }
                            
                            if let imageClass = viewModel.imageClassifier.imageClass {
                                HStack {
                                    Text("Categorías de la imagen:")
                                        .font(.caption)
                                    Text(imageClass)
                                        .bold()
                                    
                                }
                                .font(.subheadline)
                                .padding()
                            } else {
                                Text("Categorías de la imagen: NA")
                                    .font(.caption)
                                    .padding()
                            }
                        }
                        .padding()
                    }
                    .sheet(isPresented: $isPresented) {
                        ImagePickerView(selectedImage: $selectedImage, isPresented: $isPresented, sourceType: $sourceType)
                            .onDisappear {
                                if let selectedImage = selectedImage {
                                    viewModel.imageClassifier.detect(uiImage: selectedImage)
                                }
                            }
                    }
                    .padding()
                    
                    HStack {
                        Button(action: {
                            isPresented = true
                            sourceType = .camera
                            print("-----------------------------------------------------")
                            print(viewModel.objectsToScan[viewModel.currentObjectIndex].name)
                            print("-----------------------------------------------------")
                        }) {
                            Text("Escanear")
                                .frame(width: 150, height: 50)
                                .background(Color(red: 55/255, green: 215/255, blue: 70/255))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .font(Font.custom("Rowdies-Regular", size: 20))
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

struct LiveSession_Previews: PreviewProvider {
    static var previews: some View {
        LiveSession(viewModel: LiveSessionViewModel())
    }
}
