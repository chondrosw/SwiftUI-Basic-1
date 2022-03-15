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
    var body: some View {
        VStack{
            Circle().fill(Color(rgbStruct: game.target))
            if !showScore{
                Text("R:??? G:??? B:???").padding()
            }else{
                Text(game.target.intString())
            }
            Circle().fill(Color(rgbStruct: guess))
            Text(guess.intString())
            ColorSlider(value: $guess.red, trackColor: .red)
            ColorSlider(value: $guess.green, trackColor: .green)
            ColorSlider(value: $guess.blue, trackColor: .blue)
            Button("Hit Me"){
                showScore = true
                game.check(guess: guess)
            }.alert(isPresented: $showScore, content: {
                Alert(title: Text("Your Score"), message: Text("\(self.game.scoreRound)"), dismissButton: .default(Text("Ok")){
                    game.startNewRound()
                    guess = RGB()
                })
            })
            
        }
    }

    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(guess:RGB()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
