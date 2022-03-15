//
//  ColorSlider.swift
//  Basic-SwiftUI-Part1
//
//  Created by Chondro Satrio Wibowo on 15/03/22.
//

import SwiftUI

struct ColorSlider:View{
    @Binding var value:Double
    var trackColor:Color
    
    var body: some View{
        HStack{
            Text("0")
            Slider(value: $value).foregroundColor(trackColor)
            Text("255")
        }.padding(.horizontal)
    }
}
