//
//  LiveSessionView.swift
//  DiloenSenas
//
//  Created by Alicia Ayón on 20/9/23.
//
import SwiftUI

struct LiveSession: View {
 
    @State var isPresented: Bool = false
    @State var selectedImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .camera
    @ObservedObject var classifier: ImageClassifier
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Rectangle()
                    .foregroundColor(Color.yellow)
                    .cornerRadius(10)
                    .frame(width: 350, height: 300)
                
                VStack(spacing: 0) {
                    Image(systemName: "video.fill") // aca va el video imagen
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 190) // Tamaño de la imagen/video
                    
                    Text("Instrucciones")
                        .font(.headline)
                        .padding()
                }
            }
            
            Spacer()
            
            VStack{
                
                
                Rectangle()
                    .strokeBorder()
                    .foregroundColor(.yellow)
                    .overlay(
                        Group {
                            if selectedImage != nil {
                                Image(uiImage: selectedImage!)
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                    )
                
                
                VStack{
                    Button(action: {
                        if selectedImage != nil {
                            classifier.detect(uiImage: selectedImage!)
                        }
                    }) {
                        Image(systemName: "bolt.fill")
                            .foregroundColor(.orange)
                            .font(.title)
                    }
                    
                    
                    Group {
                        if let imageClass = classifier.imageClass {
                            HStack{
                                Text("Image categories:")
                                    .font(.caption)
                                Text(imageClass)
                                    .bold()
                            }
                        } else {
                            HStack{
                                Text("Image categories: NA")
                                    .font(.caption)
                            }
                        }
                    }
                    .font(.subheadline)
                    .padding()
                    
                }
            }
            
            .sheet(isPresented: $isPresented){
                ImagePickerView(selectedImage: $selectedImage, isPresented:  $isPresented, sourceType: $sourceType)
                    .onDisappear{
                        if selectedImage != nil {
                            classifier.detect(uiImage: selectedImage!)
                        }
                    }
                
            }
            
            .padding()
            
            HStack {
                Button(action: {
                    isPresented = true
                    sourceType = .camera
                }) {
                    Text("Escanear")
                        .frame(width: 200, height:.infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                
                Button(action: {
                }) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.blue)
                        .aspectRatio(contentMode: .fit)
                }
                .padding(.trailing)
            }
        }
    }
}

struct LiveSession_Previews: PreviewProvider {
    static var previews: some View {
        LiveSession(classifier: ImageClassifier())
    }
}
