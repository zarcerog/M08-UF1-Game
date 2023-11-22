//
//  MarksView.swift
//  MyGame
//
//  Created by Nicolás Zarcero García on 15/11/23.
//

import SwiftUI

struct MarksView: View {
    @Binding var isVisible:Bool
    @Binding var game: Game
    
    var body: some View {
        VStack {
            HStack {
                Text("Marks")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                Button("Close") {
                    isVisible = false
                }
            }
            Spacer()
            VStack {
                VStack {
                    ForEach(Array(game.getScoresHistory().enumerated()), id: \.1.id) { index, item in
                        HStack {
                            TextView(text: "", value: index + 1)
                            Spacer()
                            Text("\(item.score)")
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                            Text("\(item.time)")
                                .font(.title2)
                                .fontWeight(.bold)
                        }
                        Divider().background(Color.black).frame(height: 1)
                    }
                }
            }
        }.padding()
    }
}

struct MarksView_Previews: PreviewProvider {
    static var previews: some View {
        MarksView(isVisible: .constant(false), game: .constant(Game()))
    }
}
