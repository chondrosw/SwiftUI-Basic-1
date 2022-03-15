//
//  BevelText.swift
//  Basic-SwiftUI-Part1
//
//  Created by Chondro Satrio Wibowo on 15/03/22.
//

import SwiftUI

struct BevelText:View{
    let text:String
    let width:CGFloat
    let height:CGFloat
    
    var body: some View{
        Text(text).frame(width: width, height: height)
            .background(ZStack{
                Capsule().fill(Color.element)
                    .northWestShadow()
                Capsule().inset(by: 3).fill(Color.element)
                    .southEastShadow()
            })
    }
}
