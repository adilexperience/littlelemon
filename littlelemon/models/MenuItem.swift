//
//  MenuItem.swift
//  littlelemon
//
//  Created by Muhammad Adil Mehmood on 01/05/2023.
//

import Foundation

struct MenuItem : Identifiable, Decodable {
    let id : Int
    let title : String
    let description : String
    let price  : String
    let image : String
    let category : String
}
