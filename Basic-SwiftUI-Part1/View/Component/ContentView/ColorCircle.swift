//
//  ColorCircle.swift
//  Basic-SwiftUI-Part1
//
//  Created by Chondro Satrio Wibowo on 15/03/22.
//

import SwiftUI

struct ColorCircle:View{
    let rgb:RGB
    let size:CGFloat
    
    var body: some View{
        ZStack{
            Circle().fill(Color.element)
                .northWestShadow()
            Circle().fill(Color(red: rgb.red, green: rgb.green, blue: rgb.blue)).padding(20)
        }.frame(width:size,height:size)
    }
}
