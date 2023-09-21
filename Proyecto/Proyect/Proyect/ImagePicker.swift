//
//  ImagePicker.swift
//  tomarFoto
//
//  Created by Alumno on 18/09/23.
//
import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {

  @Binding var uiImage: UIImage?
  @Binding var isPresenting: Bool
  @Binding var sourceType: UIImagePickerController.SourceType

  func makeUIViewController(context: Context) -> UIImagePickerController {

    let imagePicker = UIImagePickerController()

    imagePicker.sourceType = sourceType

    imagePicker.delegate = context.coordinator

    return imagePicker

  }


  func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {

  }

 
  typealias UIViewControllerType = UIImagePickerController
  

  func makeCoordinator() -> Coordinator {

    Coordinator(self)

  }
   
    //Coordinator class so ImagePickerViewController can notify our ImagePicker struct user has interacted with an image
  class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

     

    let parent: ImagePicker

         
      //The first function will be used when an image is selected and pass the image data to a delegate.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

      parent.uiImage = info[.originalImage] as? UIImage

      parent.isPresenting = false

    }

     

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {

      parent.isPresenting = false

    }

     

    init(_ imagePicker: ImagePicker) {

      self.parent = imagePicker

    }

     

  }


}

