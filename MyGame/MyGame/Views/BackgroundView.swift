//
//  BackgroundView.swift
//  MyGame
//
//  Created by Nicolás Zarcero García on 15/11/23.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game:Game
    @State var marksIsVisible = false
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    marksIsVisible = true
                }, label: {IconView(imageName: "list.dash")}).sheet(isPresented: $marksIsVisible) {
                    MarksView(isVisible: $marksIsVisible, game: $game)
                }
                
                Spacer()
                
                Button(action: {
                    game.restartGame()
                }) {
                    IconView(imageName: "arrow.clockwise")
                }
            }
            Spacer()
            HStack {
                TextView(text: "Score", value: game.score)
                Spacer()
                TextView(text: "Round", value: game.round)
            }
        }
        .padding(30)
        .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}

struct IconView: View {
    var imageName:String
    var body: some View {
        Image(systemName: imageName)
            .font(.largeTitle)
            .frame(width:56, height: 56)
            .overlay(Circle().stroke())
            .foregroundColor(.black)
    }
}

struct TextView: View {
    var text:String
    var value:Int
    var body: some View {
        VStack {
            Text(text.uppercased())
                .kerning(1.0)
            Text("\(value)")
                .frame(width: 68, height: 56)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke())
        }
    }
}
