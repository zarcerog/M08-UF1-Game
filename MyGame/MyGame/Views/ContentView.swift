//
//  ContentView.swift
//  MyGame
//
//  Created by Nicolás Zarcero García on 8/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var alertIsRestarted = false
    
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                Text("🎯🎯🎯")
                    .font(.largeTitle)
                Text("\(game.target)")
                    .kerning(-1)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                SliderView(value: $sliderValue)
                Button("Try"){
                    alertIsVisible = true
                    game.score(sliderValue: Int(sliderValue.rounded()))
                    sliderValue = 50.0
                    game.saveScores()
                }
                .font(.title2)
                .foregroundColor(.white)
                .padding()
                .background(
                    ZStack {
                        Color("AccentColor")
                        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]),
                                       startPoint: .top,
                                       endPoint: .bottom)
                    }
                )
                .cornerRadius(21.0)
                .alert(isPresented: $alertIsVisible){
                    Alert(title: Text("Congratulations"), message: Text("Your score is: \(game.points)"), dismissButton: .default(Text("Ok")){
                        game.restartRound()
                    })
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SliderView: View {
    @Binding var value:Double
    var body: some View {
        HStack{
            Text("1")
                .font(.callout)
                .fontWeight(.bold)
            Slider(value: $value, in:1...100)
            Text("100")
                .font(.callout)
                .fontWeight(.bold)
        }
    }
}
