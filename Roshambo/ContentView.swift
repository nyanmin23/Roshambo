//
//  ContentView.swift
//  Roshambo
//
//  Created by Nyan Min Htet on 28/02/2024.
//

//import SwiftUI
//
//struct ContentView: View {
//    @State private var possibleMove = ["🪨", "📃", "✂️"]
//    @State private var appMove = Int.random(in: 0...2)
//    @State private var shouldWin = Bool.random()
//    @State private var playerScore = 0
//    
//    var body: some View {
//        VStack {
//            Text("Your goal is to \(shouldWin == true ? "WIN" : "LOSE").")
//                .font(.title)
//            
//            Text("\(possibleMove[appMove])")
//                .font(.system(size: 100))
//            
//            Text("Choose your selection:")
//                .font(.title)
//            HStack {
//                ForEach(possibleMove, id: \.self) { move in
//                    Text(move)
//                    .font(.system(size: 100))
//                    .onTapGesture {
//                        self.checkResults(move)
//                    }
//                }
//            }
//            Text("Score: \(playerScore)")
//                .font(.title)
//        }
//    }
//    
//    
//    func checkResults(_ playerMove: String) {
//        if playerMove == possibleMove[appMove] {
//            playerScore = playerScore
//            // You might want to handle ties differently based on your game logic
//        } else if (shouldWin && (playerMove == possibleMove[(appMove + 1) % 3])) ||
//                   (!shouldWin && (playerMove == possibleMove[(appMove + 2) % 3])) {
//            // Player wins
//            playerScore += 1
//        } else {
//            playerScore -= 1
//        }
//        appMove = Int.random(in: 0...2)
//        shouldWin.toggle()
//    }
//}
//
//
//
//#Preview {
//    ContentView()
//}


//func checkResults(_ playerMove: String) {
//    if playerMove == possibleMove[appMove] {
//        // It's a tie
//        // You might want to handle ties differently based on your game logic
//    } else if (shouldWin && (playerMove == possibleMove[(appMove + 1) % 3])) ||
//               (!shouldWin && (playerMove == possibleMove[(appMove + 2) % 3])) {
//        // Player wins
//        playerScore += 1
//    } else {
//        // Player loses
//        playerScore -= 1
//    }
import SwiftUI

struct ContentView: View {
    @State private var possibleMove = ["🪨", "📃", "✂️"]
    @State private var appMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var playerScore = 0
    
    var body: some View {
        ZStack {
            Color.blue
            .ignoresSafeArea()
            
            VStack {
                Text("Your goal is to \(shouldWin ? "WIN" : "LOSE").")
                    .font(.title)
                
                Text(possibleMove[appMove])
                    .font(.system(size: 100))
                
                Text("Choose your selection:")
                    .font(.title)
                
                HStack {
                    ForEach(possibleMove, id: \.self) { move in
                        Button(action: {
                            self.checkResults(move)
                        }) {
                            Text(move)
                                .font(.system(size: 100))
                        }
                    }
                }
                .padding()
                
                Text("Score: \(playerScore)")
                    .font(.title)
            }
            .background(.ultraThinMaterial)
            .clipShape(.buttonBorder)
            .padding()
        }
    }
    
    func checkResults(_ playerMove: String) {
        if playerMove == possibleMove[appMove] {
            // It's a tie
            // You might want to handle ties differently based on your game logic
        } else if (shouldWin && (playerMove == possibleMove[(appMove + 1) % 3])) ||
                   (!shouldWin && (playerMove == possibleMove[(appMove + 2) % 3])) {
            // Player wins
            playerScore += 1
        } else {
            // Player loses
            playerScore -= 1
        }
        
        // Update the app's move for the next round
        appMove = Int.random(in: 0...2)
        shouldWin.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
