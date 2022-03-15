//
//  Color.swift
//  Basic-SwiftUI-Part1
//
//  Created by Chondro Satrio Wibowo on 15/03/22.
//

import Foundation
import SwiftUI

extension Color{
    init(rgbStruct rgb:RGB) {
        self.init(red: rgb.red, green: rgb.green, blue: rgb.blue)
    }
    
    static let element = Color("Element")
    static let highlight = Color("Highlight")
    static let shadow = Color("Shadow")
}
