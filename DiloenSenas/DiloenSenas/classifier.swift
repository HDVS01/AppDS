//
//  classifier.swift
//  DiloenSenas
//
//  Created by Alicia Ayón on 21/9/23.
//

import CoreML
import Vision
import CoreImage

struct Classifier {
    
    private(set) var results: String?
    
    mutating func detect(ciImage: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: Modeloescuela(configuration: MLModelConfiguration()).model)
        else {
            return
        }
        
        let request = VNCoreMLRequest(model: model)
        
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        
        try? handler.perform([request])
        
        guard let results = request.results as? [VNClassificationObservation] else {
            return
        }
        
        if let firstResult = results.first {
            self.results = firstResult.identifier
        }
        
    }
    /*func detect(ciImage: CIImage) -> String? {
        guard let model = try? VNCoreMLModel(for: PerrosyGatos1(configuration: MLModelConfiguration()).model) else {
            return nil
        }
        
        let request = VNCoreMLRequest(model: model)
        
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        
        try? handler.perform([request])
        
        guard let results = request.results as? [VNClassificationObservation], let firstResult = results.first else {
            return nil
        }
        
        return firstResult.identifier
    }*/

    
}
