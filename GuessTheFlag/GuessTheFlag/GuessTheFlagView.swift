//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by f on 27.10.2021.
//

import SwiftUI

struct GuessTheFlagView: View {
    @State private var showingAlert = false
    @State private var scoreTitle = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var score: Int = 0
    @State private var questionCount = 1
    private var maxQuestionCount = 8
    
    private var buttonText = Text("Restart").foregroundColor(.white).font(.title.bold())

    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)],
                           center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess The Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
            
                VStack(spacing: 20) {
                    VStack {
                        Text("Tap on the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundColor(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagIsTapped(number )
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .shadow(radius: 8)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("\(questionCount) / \(maxQuestionCount)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
                Spacer()
                
                HStack {
                    Text("Score: \(score)")
                        .foregroundColor(.white)
                        .font(.title.bold())
                    
                    Spacer()
                    
                    Button("\(buttonText)") {
                        restartGame()
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingAlert) {
            if questionCount < maxQuestionCount {
                Button("Continue", action: askQuestion)
            } else {
                Button("Restart", action: restartGame)
            }
        } message: {
            if questionCount < maxQuestionCount {
                Text("Your score is \(score)")
            } else {
                Text("Game ends in here, your score is \(score). \(isItGood)")
            }
        }
    }
    
    func flagIsTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong, that was the flag of \(countries[number])"
            score -= 1
        }
        showingAlert = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        questionCount += 1
    }
    
    func restartGame() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        score = 0
        questionCount = 1
    }
    
    private var isItGood: String {
        if score == 8 {
            return "Excellent!!"
        } else if score > 4 {
            return "Good"
        } else if score < 0 {
            return "That is horrible!!"
        } else {
            return "It seems like you may want to improve your flags knowledge."
        }
    }
}





























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GuessTheFlagView()
    }
}
