//
//  ObjectModel.swift
//  DiloenSenas
//
//  Created by Alumno on 11/10/23.
//

import Foundation

struct APIResponse: Codable {
    let users: [ObjectModel]
}

struct ObjectModel: Codable{
    var id: Int
    var name: String
    var categories_id: Int
    var images_id: Int
    var date_of_creation: String
    var active: String
}
