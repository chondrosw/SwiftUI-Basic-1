//
//  ContentView.swift
//  Basic-SwiftUI-Part1
//
//  Created by Chondro Satrio Wibowo on 15/03/22.
//

import SwiftUI
import CoreData


struct ContentView: View {
   @State private var game = Game()
    @State var guess:RGB
    @State var showScore = false
    
    let circleSize: CGFloat = 0.275
      let labelHeight: CGFloat = 0.06
      let labelWidth: CGFloat = 0.53
      let buttonWidth: CGFloat = 0.87
    var body: some View {
        GeometryReader{proxy in
            ZStack{
                Color.element.ignoresSafeArea()
                VStack{
                    ColorCircle(rgb: game.target, size: proxy.size.height * circleSize)
                    if !showScore{
                        BevelText(text: "R: ??? G: ??? B: ???", width: proxy.size.width * labelWidth, height: proxy.size.height * labelHeight)
                    }else{
                        BevelText(text: game.target.intString(), width: proxy.size.width * labelWidth, height: proxy.size.height * labelHeight)
                        
                    }
                    ColorCircle(rgb: guess, size: proxy.size.height * circleSize)
                    BevelText(text: guess.intString(), width: proxy.size.width * labelWidth, height: proxy.size.height * labelHeight)
                    ColorSlider(value: $guess.red, trackColor: .red)
                    ColorSlider(value: $guess.green, trackColor: .green)
                    ColorSlider(value: $guess.blue, trackColor: .blue)
                    Button("Hit Me"){
                        showScore = true
                        game.check(guess: guess)
                    }.buttonStyle(NeuButtonStyle(width: proxy.size.width * buttonWidth, height: proxy.size.height * labelHeight)).alert(isPresented: $showScore, content: {
                        Alert(title: Text("Your Score"), message: Text("\(self.game.scoreRound)"), dismissButton: .default(Text("Ok")){
                            game.startNewRound()
                            guess = RGB()
                        })
                    })
                    
                }
            }
        }
        
        
    }

    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(guess:RGB()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
