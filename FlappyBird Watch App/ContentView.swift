//
//  ContentView.swift
//  FlappyBird Watch App
//
//  Created by don kora jacob on 24/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var birdPosition = CGSize.zero
    @State private var birdVelocity = CGSize.zero
    @State private var pipeTop = CGFloat.random(in: 0...150)
    @State private var pipeBottom = CGFloat.random(in: 0...150)
    @State private var gameOver = false
    @State private var score = 0
    
    var body: some View {
        ZStack {
            if !gameOver {
                Image("background")
                    .resizable()
                    .scaledToFill()
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Image("pipeTop")
                            .resizable()
                            .scaledToFit()
                            .frame(height: pipeTop)
                        
                        Image("pipeBottom")
                            .resizable()
                            .scaledToFit()
                            .frame(height: pipeBottom)
                    }
                    .offset(x: -100)
                    .animation(.easeInOut(duration: 1.5))
                    
                    Spacer()
                    
                    HStack {
                        Image("bird")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .offset(birdPosition)
                            .animation(.spring())
                    }
                }
                
                Text("Score: \(score)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .offset(x: -20, y: -20)
            } else {
                VStack {
                    Text("Game Over!")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                    
                    Text("Your Score: \(score)")
                        .font(.title)
                        .foregroundColor(.red)
                        .offset(x: -20, y: -20)
                }
            }
        }
        .onAppear(perform: startGame)
        .onTapGesture {
            if !self.gameOver {
                withAnimation(.spring()) {
                    self.birdVelocity.height = -10
                }
            } else {
                self.startGame()
            }
        }
        .animation(.easeInOut)
    }
    
    func startGame() {
        withAnimation(.default) {
            self.birdPosition = CGSize.zero
            self.birdVelocity = CGSize.zero
            self.pipeTop = CGFloat.random(in: 0...150)
            self.pipeBottom = CGFloat.random(in: 0...150)
            self.gameOver = false
            self.score = 0
        }
    }
}


